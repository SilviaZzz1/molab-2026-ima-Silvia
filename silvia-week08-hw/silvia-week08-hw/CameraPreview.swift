import SwiftUI

struct CameraPreview: View {

    @ObservedObject var camera: CameraModel

    var body: some View {

        GeometryReader { geometry in

            if let image = camera.image {

                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                    .clipped()

            } else {

                ZStack {

                    Color.black

                    ProgressView()
                        .tint(.white)
                }
            }
        }
        .ignoresSafeArea()
    }
}
