//
//  Plataform.swift
//  teste
//
//  Created by Moyses Miranda do Vale Azevedo on 07/07/22.
//

import Foundation
import RealityKit

struct Plataform{
    static func createPlataform() -> ModelEntity{
        let metalMaterial = SimpleMaterial(color: .red, isMetallic: false)
//        let plataform = MeshResource.generateBox(width: 0.15, height: 0.01, depth: 0.15)
        let plataform = MeshResource.generateBox(size: [0.15, 0.01, 0.15], cornerRadius: 0.5)
        let model = ModelEntity(mesh: plataform, materials: [metalMaterial])
        model.generateCollisionShapes(recursive: true)
        model.name = "Plataform"
        model.position = [0.0, 0.15, -0.45]
        return model
    }
}
