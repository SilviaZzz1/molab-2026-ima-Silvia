import Foundation
import AVFoundation
import CoreImage
import UIKit
import Combine

class CameraModel: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {

    let session = AVCaptureSession()

    @Published var image: UIImage?
    @Published var selectedMood = "Normal"

    private let context = CIContext()

    override init() {
        super.init()
        setupCamera()
    }

    func setupCamera() {

        session.beginConfiguration()
        session.sessionPreset = .high

        guard let camera = AVCaptureDevice.default(
            .builtInWideAngleCamera,
            for: .video,
            position: .back
        ) else {
            print("Camera not found")
            session.commitConfiguration()
            return
        }

        do {
            let input = try AVCaptureDeviceInput(device: camera)

            if session.canAddInput(input) {
                session.addInput(input)
            }

        } catch {
            print("Camera input error:", error)
        }

        let output = AVCaptureVideoDataOutput()

        output.setSampleBufferDelegate(
            self,
            queue: DispatchQueue(label: "videoQueue")
        )

        if session.canAddOutput(output) {
            session.addOutput(output)
        }

        session.commitConfiguration()

        DispatchQueue.global(qos: .userInitiated).async {
            self.session.startRunning()
        }
    }


    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {

        guard let pixelBuffer =
                CMSampleBufferGetImageBuffer(sampleBuffer)
        else {
            return
        }

        var ciImage = CIImage(cvPixelBuffer: pixelBuffer)

        ciImage = applyMoodFilter(to: ciImage)

        guard let cgImage = context.createCGImage(
            ciImage,
            from: ciImage.extent
        ) else {
            return
        }

        let uiImage = UIImage(
            cgImage: cgImage,
            scale: 1.0,
            orientation: .right
        )

        DispatchQueue.main.async {
            self.image = uiImage
        }
    }


    func applyMoodFilter(to image: CIImage) -> CIImage {

        switch selectedMood {

        case "Happy":

            return image
                .applyingFilter(
                    "CIColorControls",
                    parameters: [
                        kCIInputSaturationKey: 1.5,
                        kCIInputBrightnessKey: 0.08
                    ]
                )
                .applyingFilter(
                    "CITemperatureAndTint",
                    parameters: [
                        "inputNeutral":
                            CIVector(x: 6500, y: 0),
                        "inputTargetNeutral":
                            CIVector(x: 5000, y: 0)
                    ]
                )


        case "Calm":

            return image
                .applyingFilter(
                    "CIColorControls",
                    parameters: [
                        kCIInputSaturationKey: 0.7,
                        kCIInputBrightnessKey: 0.03
                    ]
                )
                .applyingFilter(
                    "CITemperatureAndTint",
                    parameters: [
                        "inputNeutral":
                            CIVector(x: 6500, y: 0),
                        "inputTargetNeutral":
                            CIVector(x: 8000, y: 0)
                    ]
                )


        case "Dreamy":

            return image
                .applyingFilter(
                    "CIGaussianBlur",
                    parameters: [
                        kCIInputRadiusKey: 2.0
                    ]
                )
                .applyingFilter(
                    "CIColorControls",
                    parameters: [
                        kCIInputSaturationKey: 0.8,
                        kCIInputBrightnessKey: 0.08
                    ]
                )


        case "Lonely":

            return image.applyingFilter(
                "CIPhotoEffectMono"
            )


        case "Chaos":

            return image.applyingFilter(
                "CIColorControls",
                parameters: [
                    kCIInputSaturationKey: 2.0,
                    kCIInputContrastKey: 1.8
                ]
            )


        default:
            return image
        }
    }
}
