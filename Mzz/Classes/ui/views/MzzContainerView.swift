
import UIKit

open class MzzContainerView : UIView, MzContainerView {
    //-------------------------------------------------------------------------------------
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    public init(_ vc: MzzViewController) {
        super.init(frame: vc.view.bounds)
        zVC = vc
        zStyle = MzzStyle(self)
    }
    public init(_ vc: MzzViewController?, _ frame: MzzRect) {
        super.init(frame: frame)
        zVC = vc
        zStyle = MzzStyle(self)
    }
    public var zVC: MzzViewController?
    //-------------------------------------------------------------------------------------
    public var zParent: MzView? {
        get { return superview as? MzView }
    }
    //-------------------------------------------------------------------------------------
    public func add(_ view: MzView) {
        addSubview(view as! UIView)
    }
    public func clear() {
        for subview in subviews { subview.removeFromSuperview() }
    }
    public func clear<T:MzView>(_ type: T.Type) {
        for subview in subviews { if subview is T { subview.removeFromSuperview() } }
    }
    //-------------------------------------------------------------------------------------
    public var zF: MzzRect {
        get { return frame }
        set(value) { frame = value }
    }
    
    //-------------------------------------------------------------------------------------
    public var zIsUserInteractionEnabled: Bool {
        get { return isUserInteractionEnabled }
        set(value) { isUserInteractionEnabled = value }
    }
    open func onTouchDown() { }
    open func onTouchUp() { }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        onTouchDown()
    }
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        onTouchUp()
    }
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        onTouchUp()
    }
    //-------------------------------------------------------------------------------------
    public var zStyle: MzzStyle!
    //-------------------------------------------------------------------------------------
}

