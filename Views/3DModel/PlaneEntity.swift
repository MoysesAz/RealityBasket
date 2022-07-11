import UIKit
import RealityKit

class PlaneEntity: Entity, HasModel, HasPhysics, HasCollision {

    required init() {
        super.init()
        let mesh = MeshResource.generatePlane(width: 2, depth: 2)
        let materials = [UnlitMaterial(color: .clear)]
        model = ModelComponent(mesh: mesh, materials: materials)
        physicsBody = PhysicsBodyComponent()
        physicsBody?.mode = .static
    }

}
