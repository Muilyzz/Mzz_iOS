
import UIKit

open class MzzRoundedView : MzzContainerView {
    
    public var zOverallColor: MzzColor = MzzColor("#ECECEC", 1.0) {
        didSet { updateBorderColor() }
    }
    public var zIsHightlightOn: Bool = false {
        didSet { updateBorderColor() }
    }
    public var zAlphaHightlightOn: Float = 0.7 {
        didSet { updateBorderColor() }
    }
    public var zAlphaHightlightOff: Float = 0.2 {
        didSet { updateBorderColor() }
    }
    public var zRatioFillColorAlpha: Float = 0.6 {
        didSet { updateBorderColor() }
    }
    
    private func updateBorderColor() {
        let alpha = zIsHightlightOn ? zAlphaHightlightOn : zAlphaHightlightOff
        zStyle.zBorderColor = /*MzzColor(zOverallColor.hex, alpha)*/ zOverallColor.getAlphaColor(alpha)
        zStyle.zBackgroundColor = /*MzzColor(zOverallColor.hex, alpha * zRatioFillColorAlpha)*/ zOverallColor.getAlphaColor(alpha * zRatioFillColorAlpha)
    }
    
    public init(_ vc: MzzViewController?, _ frame: MzzRect, _ color: MzzColor) {
        super.init(vc, frame)
        
        zOverallColor = color
        
        //let textSize = Float(UIFont.labelFontSize)
        zStyle.zCornerRadius = zM*1.5
        zStyle.zBorderWidth = zM*0.1
        //zInset = textSize * 0.03
        
        updateBorderColor()
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func onTouchDown() {
        super.onTouchDown()
        zIsHightlightOn = true
    }
    open override func onTouchUp() {
        zIsHightlightOn = false
        print("up")
        super.onTouchUp()
    }
    
}


