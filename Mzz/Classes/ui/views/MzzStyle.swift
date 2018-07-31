
import UIKit

public class MzzStyle : MzStyle {
    public var zCornerRadius: Float = 0 {
        didSet { update() }
    }
    public var zBackgroundColor: MzzColor = MzzColor.CLEAR {
        didSet { update() }
    }
    public var zBorderWidth: Float = 0 {
        didSet { update() }
    }
    public var zBorderColor: MzzColor = MzzColor.CLEAR {
        didSet { update() }
    }
    
    private var mView: UIView!
    public init(_ view: UIView) {
        mView = view
        
        mView.layer.addSublayer(bg)
        bg.frame = mView.bounds
        mView.backgroundColor = UIColor.clear
        
        update()
    }
    
    private var bg: CAShapeLayer = CAShapeLayer()
    private func update() {
        bg.strokeColor = zBorderColor.toUIColor().cgColor
        bg.fillColor = zBackgroundColor.toUIColor().cgColor
        bg.lineWidth = CGFloat(zBorderWidth)
        bg.path = UIBezierPath(roundedRect: mView.bounds.insetBy(dx: CGFloat(zBorderWidth/2), dy: CGFloat(zBorderWidth/2)), cornerRadius: CGFloat(zCornerRadius-zBorderWidth)).cgPath
    }
    /*public init(_ pCornerRadius: Float, _ pBackgroundColor: MzzColor, _ pBorderWidth: Float, _ pBorderColor: MzzColor) {
        zCornerRadius = pCornerRadius
        zBackgroundColor = pBackgroundColor
        zBorderWidth = pBorderWidth
        zBorderColor = pBorderColor
    }*/
}
