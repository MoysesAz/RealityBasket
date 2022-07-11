import Foundation
import RealityKit

class Ball: MovableEntity {
    override func generateMeshResource() -> MeshResource {
        /// spheres are specified with radius, not diameter, so the project divides the size in half
        return MeshResource.generateSphere(radius: size / 2 )
    }
}
