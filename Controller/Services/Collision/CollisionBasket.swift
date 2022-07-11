import Foundation
import RealityKit

extension Basket {
    func addCollisions() {
        guard let scene = self.scene else {
            return
        }

        collisionSubs.append(scene.subscribe(to: CollisionEvents.Began.self, on: self) { event in
            guard let boxA = event.entityA as? MovableEntity else {
                return
            }
            let positions: [Array<SIMD3<Float>>.ArrayLiteralElement] = [
                [0.0, 0.2, -0.2],
                [0.2, 0.2, -0.4],
                [-0.2, 0.2, -0.4],
            ]
            let position = positions.randomElement()!
            boxA.position = position
        })
    }
}
