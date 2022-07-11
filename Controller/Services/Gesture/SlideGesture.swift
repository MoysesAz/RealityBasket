import Foundation
import UIKit
import RealityKit

struct SlideGesture {
    private var _openingGesture: CGPoint = CGPoint()
    private var _clousingGesture: CGPoint = CGPoint()
    private var _slideY: CGFloat = CGFloat()
    private var _slideX: CGFloat = CGFloat()

    public var openingGesture: CGPoint {
        get {
            return _openingGesture
        }
    }
    public var slideY: CGFloat {
        get {
            return _slideY
        }
    }
    public var slideX: CGFloat {
        get {
            return _slideX
        }
    }

    mutating func captureSlideGesture(sender: UIPanGestureRecognizer, arView: ARView) {
        let Location = sender.location(in: arView)
        if sender.state == .began{
            _openingGesture = Location
        } else if sender.state == .ended {
            _clousingGesture = Location
        }
    }

    mutating func calculateElasticConstant(sender: UIPanGestureRecognizer) {
        if sender.state == .ended {
            let value = _openingGesture.y - _clousingGesture.y
            if value < 0 {
                _slideY = value
                _slideX = _openingGesture.x - _clousingGesture.x
            }
        }
    }
}
