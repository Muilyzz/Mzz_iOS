
import UIKit



open class MzzView : UIView {
    
    
    
    
    
    
    //public var zOnTouch:((Bool)->())?
    //public var zOnClick:(()->())?
    
    private func startAnimation() {
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [.repeat, .autoreverse, .allowUserInteraction],
                       animations: { self.alpha = 0.3 },
                       completion: { (finished: Bool) -> Void in self.alpha = 1.0 })
    }
    private func stopAnimation() {
        self.layer.removeAllAnimations()
    }
    
    
    
}


public typealias MzzRect = CGRect
public extension MzzRect {
    init(_ x: Float, _ y: Float, _ w: Float, _ h: Float) {
        self.init(x: CGFloat(x), y: CGFloat(y), width: CGFloat(w), height: CGFloat(h))
    }
    func reduce(_ dx:Float, _ dy:Float) -> MzzRect {
        return insetBy(dx: CGFloat(dx), dy: CGFloat(dy))
    }
    var x: Float { return Float(minX) }
    var y: Float { return Float(minY) }
    var w: Float { return Float(width) }
    var h: Float { return Float(height) }
}

public typealias MzzSize = CGSize
public extension MzzSize {
    init(_ w: Float, _ h: Float) {
        self.init(width: CGFloat(w), height: CGFloat(h))
    }
}

//public typealias R = MzzRect
