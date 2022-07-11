import UIKit
import RealityKit
import Combine

class MovableEntity: Entity, HasModel, HasCollision{

    var size: Float!
    var color: UIColor!
    var roughness: MaterialScalarParameter!

    var collisionSubs: [Cancellable] = []

    init(size: Float, color: UIColor, roughness: Float) {
        super.init()

        self.size = size
        self.color = color
        self.roughness = MaterialScalarParameter(floatLiteral: roughness)
        

        let mesh = generateMeshResource()
        let materials = [generateMaterial()]
        model = ModelComponent(mesh: mesh, materials: materials)
        generateCollisionShapes(recursive: true)
    }

    required init() {
        fatalError("init() has not been implemented")
    }


    func generateMeshResource() -> MeshResource {
        return MeshResource.generateBox(size: size)
    }

    func generateMaterial() -> Material {
        return SimpleMaterial(color: color, roughness: roughness, isMetallic: true)
    }
}
