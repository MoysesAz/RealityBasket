import UIKit
import RealityKit
import SceneKit
import Combine


class ViewController: UIViewController, UIGestureRecognizerDelegate {
    var width: CGFloat = CGFloat()
    var height: CGFloat = CGFloat()
    var points = 0
    var collisionSubscriptions: [Cancellable] = []
    var movableEntities: [[MovableEntity]]!
    var slideGesture: SlideGesture = SlideGesture()
    let basket = Basket(size: 0.05, color: .green, roughness: 0.0)
    let ball = Ball(size: 0.05, color: .orange, roughness: 1.0)

    @IBOutlet var arView: ARView!

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        let Location = sender.location(in: arView)
        if let modal = arView.entity(at: Location) {
            Animations.transition1(model: modal, delay: 0.25, transition: [0, 0, 0])
        }
    }

    @IBAction func panTap(_ sender: UIPanGestureRecognizer) {
        slideGesture.captureSlideGesture(sender: sender, arView: arView)
        if sender.state == .ended {
            slideGesture.calculateElasticConstant(sender: sender)
            if let modal = arView.entity(at: slideGesture.openingGesture){
                    let x = Float(slideGesture.slideX / width)
                    let z = Float(slideGesture.slideY / height)
                    let matrixMoviment = [SIMD3<Float>(x/2, 0.4, z * 2), SIMD3<Float>(x/2, -0.4, z)]
                
                    Animations.transitionsForMatrix(model: modal, coordinates: matrixMoviment, duration: 0.25)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        width = self.view.frame.width
        height = self.view.frame.height
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 22))
        label.center = CGPoint(x: 340, y: 50)
        label.textAlignment = .center
        label.text = "Point: \(self.points)"
        self.view.addSubview(label)
        setScene()
    }

    fileprivate func setScene() {
        let planeAnchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.2, 0.2])
        arView.scene.addAnchor(planeAnchor)
        planeAnchor.addChild(Axes.createX())
        planeAnchor.addChild(Axes.createY())
        planeAnchor.addChild(Axes.createZ())
        basket.position = [0, 0, -0.3]
        ball.position = [0, 0, 0]
        planeAnchor.addChild(basket)
        planeAnchor.addChild(ball)
        ball.addCollisions()
        basket.addCollisions()
    }
}
