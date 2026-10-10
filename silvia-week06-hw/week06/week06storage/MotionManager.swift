import Foundation
import CoreMotion
import Combine

class MotionManager: ObservableObject {

    private var motionManager = CMMotionManager()

    @Published var x = 0.0
    @Published var y = 0.0

    init() {

        motionManager.deviceMotionUpdateInterval = 0.05

        motionManager.startDeviceMotionUpdates(to: .main) { motion, error in

            if let motion = motion {
                self.x = motion.gravity.x
                self.y = motion.gravity.y
            }
        }
    }
}
