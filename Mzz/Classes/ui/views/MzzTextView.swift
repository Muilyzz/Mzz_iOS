
import UIKit

open class MzzTextView : UILabel, MzTextView {
    //-------------------------------------------------------------------------------------
    public required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    public init(_ vc: MzzViewController?, _ frame: MzzRect) {
        super.init(frame: frame)
        zVC = vc
        
        font = UIFont.systemFont(ofSize: CGFloat(zF.h*0.75))
        textAlignment = .center
        baselineAdjustment = .alignCenters
    }
    public var zVC: MzzViewController?
    //-------------------------------------------------------------------------------------
    public var zParent: MzView? {
        get { return superview as? MzView }
    }
    //-------------------------------------------------------------------------------------
    public var zF: MzzRect {
        get { return frame }
        set(value) { frame = value }
    }
    //-------------------------------------------------------------------------------------
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
        font = UIFont.systemFont(ofSize: CGFloat(zF.h*0.75))
    }
    
    public var zTextColor: MzzColor? = nil {
        didSet {
            textColor = (zTextColor ?? MzzColor.BLACK).toUIColor()
        }
    }
    public var zTextAlignment: MzzAlign = MzzAlign.center {
        didSet {
            switch zTextAlignment {
            case .left : textAlignment = .left; baselineAdjustment = .alignCenters
            case .center : textAlignment = .center; baselineAdjustment = .alignCenters
            case .right : textAlignment = .right; baselineAdjustment = .alignCenters
            }
        }
    }
}
