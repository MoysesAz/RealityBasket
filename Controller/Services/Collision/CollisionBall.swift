import Foundation
import RealityKit

extension Ball {
    func addCollisions() {
        guard let scene = self.scene else {
            return
        }

        collisionSubs.append(scene.subscribe(to: CollisionEvents.Began.self, on: self) { event in
            guard let boxA = event.entityA as? MovableEntity else {
                return
            }

            boxA.position = [0, 0, 0]
        })
    }
}
