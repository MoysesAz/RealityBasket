import Foundation
import RealityKit

struct Axes {
    static func createX() -> ModelEntity {
        let metalMaterial = SimpleMaterial(color: .red, isMetallic: false)
        let line = MeshResource.generateBox(width: 2, height: 0.001, depth: 0.001)
        let model = ModelEntity(mesh: line, materials: [metalMaterial])
        model.position = [0.0, 0.0, 0.0]
        model.name = "AxleX"
        return model
    }

    static func createY() -> ModelEntity {
        let metalMaterial = SimpleMaterial(color: .blue, isMetallic: false)
        let line = MeshResource.generateBox(width: 0.001, height: 2, depth: 0.001)
        let model = ModelEntity(mesh: line, materials: [metalMaterial])
        model.position = [0.0, 0.0, 0.0]
        model.name = "AxleY"
        return model
    }

    static func createZ() -> ModelEntity {
        let metalMaterial = SimpleMaterial(color: .green, isMetallic: false)
        let line = MeshResource.generateBox(width: 0.001, height: 0.001, depth: 2)
        let model = ModelEntity(mesh: line, materials: [metalMaterial])
        model.position = [0.0, 0.0, 0.0]
        model.name = "AxleZ"
        return model
    }

    

}
