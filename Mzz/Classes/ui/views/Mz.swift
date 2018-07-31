
import UIKit

public protocol MzStyle {
    var zCornerRadius: Float { get set }
    var zBackgroundColor: MzzColor { get set }
    var zBorderWidth: Float { get set }
    var zBorderColor: MzzColor { get set }
}

public protocol MzView {
    var zVC: MzzViewController? { get set }
    var zParent: MzView? { get }
    var zF: MzzRect { get set }
    func getCenterSquareFrame() -> MzzRect
    func getCenterSquareFrame(_ scale: Float) -> MzzRect
}
public extension MzView {
    public var zU: Float { return /*UIScreen.main.bounds.h*0.05*/Float(UIFont.labelFontSize)*2 }
    public var zM: Float { return zU*0.1 }
    
    public var zB: MzzRect { return MzzRect(0, 0, zW, zH) }
    public var zX: Float   { return Float(zF.minX) }
    public var zY: Float   { return Float(zF.minY) }
    public var zW: Float   { return Float(zF.width) }
    public var zH: Float   { return Float(zF.height) }
    
    public func getCenterSquareFrame() -> MzzRect {
        if zW > zH {
            let cx = zW/2
            let h = zH
            let w = h
            let x = cx - w/2
            return MzzRect(x, 0, w, h)
        }
        else {
            let cy = zH/2
            let w = zW
            let h = w
            let y = cy - h/2
            return MzzRect(0, y, w, h)
        }
    }
    public func getCenterSquareFrame(_ ratio:Float) -> MzzRect {
        let f = getCenterSquareFrame()
        return f.reduce(f.w*(1.0-ratio)/2, f.h*(1.0-ratio)/2)
    }
}
public protocol MzContainerView : MzView {
    func add(_ view: MzView)
    func clear()
    func clear<T:MzView>(_ type:T.Type)
    
    var zIsUserInteractionEnabled: Bool { get set }
    func onTouchDown()
    func onTouchUp()
    
    var zStyle: MzzStyle! { get set }
}
public protocol MzScrollView : MzContainerView {
    var zContentSize: MzzSize! { get set }
}

public enum MzzAlign {
    case left
    case center
    case right
}
public protocol MzTextView : MzView {
    var zText: String? { get set }
    var zFont: MzzFont? { get set }
    var zTextColor: MzzColor? { get set }
    var zTextAlignment: MzzAlign { get set }
}
public protocol MzImageView : MzView {
    var zImage: MzzImage? { get set }
}
