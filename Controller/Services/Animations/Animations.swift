import Foundation
import RealityKit

struct Animations{
    static func transitionsForMatrix(model: Entity, coordinates: [SIMD3<Float>], duration: Double = 0.25){
        for (index, coordinate) in coordinates.enumerated(){
            Animations.transition(model: model, delay: Double(index)*duration, transition: coordinate)
        }
    }
    
    static func transition(model: Entity, delay: Double, transition: SIMD3<Float>, duration: Double = 0.25){
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            var modelTransform = model.transform
            modelTransform.translation += transition
            model.move(to: modelTransform, relativeTo: model.parent, duration: duration, timingFunction: .default)
        }
    }

    static func transition1(model: Entity, delay: Double, transition: SIMD3<Float>, duration: Double = 0.25){
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            var modelTransform = model.transform
            modelTransform.translation = transition
            model.move(to: modelTransform, relativeTo: model.parent, duration: duration, timingFunction: .default)
        }
    }

    static func transitionInCenter(model: Entity, delay: Double, duration: Double = 0.25){
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            model.position = [0, 0, 0]
        }
    }

}


