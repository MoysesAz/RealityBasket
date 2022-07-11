import Foundation
import RealityKit

class Basket: MovableEntity {
    override func generateMeshResource() -> MeshResource {
        return MeshResource.generateBox(width: size, height: size/10, depth: size)
    }
}

