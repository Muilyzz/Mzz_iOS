
import UIKit

open class MzzLabel : UILabel {
    
    public init(_ vc: MzzViewController?, _ frame: MzzRect) {
        super.init(frame: frame)
        font = UIFont.systemFont(ofSize: CGFloat(zH*0.75))
        //adjustsFontSizeToFitWidth = true
        //adjustsFontForContentSizeCategory = true
        //zTextAlignment = .center
        textAlignment = .center; baselineAdjustment = .alignCenters
        //baselineAdjustment = .alignBaselines
    }
    public required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    public var mFrame:MzzRect {
        get { return frame }
        set(value) { frame = value }
    }
    public var zX:Float { return Float(frame.minX) }
    public var zY:Float { return Float(frame.minY) }
    public var zW:Float { return Float(frame.width) }
    public var zH:Float { return Float(frame.height) }
    
    public enum Align {
        case left
        case center
        case right
    }
    
    public var zTextAlignment: Align = Align.center {
        didSet {
            switch zTextAlignment {
            case .left : textAlignment = .left; baselineAdjustment = .alignCenters
            case .center : textAlignment = .center; baselineAdjustment = .alignCenters
            case .right : textAlignment = .right; baselineAdjustment = .alignCenters
            }
        }
    }
    
    public var zText: String? {
        get { return self.text }
        set(value) { self.text = value }
    }
    public var zFont: MzzFont? = nil {
        didSet {
            if zFont != nil {
                font = Utils.loadFont(zFont!.bundle, zFont!.name, CGFloat(zFont!.size))
            }
            else {
                setDefaultFont()
            }
        }
    }
    private func setDefaultFont() {
        font = UIFont.systemFont(ofSize: CGFloat(zH*0.75))
    }
    
    public var zTextColor: MzzColor? = nil {
        didSet {
            textColor = (zTextColor ?? MzzColor.BLACK).toUIColor()
        }
    }
    
}
