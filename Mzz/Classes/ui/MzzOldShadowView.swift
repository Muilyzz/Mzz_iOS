
import UIKit

open class MzzOldShadowView : MzzContainerView {
    
    public init(_ vc: MzzViewController?, _ frame: MzzRect, _ shadowColor: MzzColor) {
        super.init(vc, frame)
        
        //backgroundColor = shadowColor
        
        isUserInteractionEnabled = false
        
        //showsTouchWhenHighlighted = true
        
        let s = zW*0.5
        let shadowPath = UIBezierPath(rect: MzzRect(-s, -s, zW+s*2, zH+s*2))
        layer.shadowPath = shadowPath.cgPath
        layer.shadowColor = shadowColor.toUIColor().cgColor
        layer.shadowRadius = CGFloat(s*1.3)
        layer.shadowOffset = .zero
        layer.masksToBounds = false
        layer.shadowOpacity = 1.0
        
        self.alpha = 0.0
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show() {
        //self.layer.shadowOpacity = 1.0
        self.alpha = 1.0
    }
    public func hide(alpha:CGFloat = 0.0, _ onDone:(()->())? = nil) {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = alpha
        }) { _ in
            onDone?()
        }
    }
    
    var shadowColor:UIColor = .white {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
}
