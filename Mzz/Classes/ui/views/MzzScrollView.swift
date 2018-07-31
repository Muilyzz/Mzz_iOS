
import UIKit

open class MzzScrollView : UIScrollView, MzScrollView {
    //-------------------------------------------------------------------------------------
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    public init(_ vc: MzzViewController?, _ frame: MzzRect) {
        super.init(frame: frame)
        zVC = vc
        indicatorStyle = .white
        showsVerticalScrollIndicator = true
        
        zStyle = MzzStyle(self)
        zContentSize = MzzSize(zB.w, zB.h)
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
    public var zIsUserInteractionEnabled: Bool = true
    public func onTouchDown() { }
    public func onTouchUp() { }
    //-------------------------------------------------------------------------------------
    public var zStyle: MzzStyle!
    //-------------------------------------------------------------------------------------
    public var zContentSize: MzzSize! {
        didSet { contentSize = zContentSize }
    }
    //-------------------------------------------------------------------------------------
}
