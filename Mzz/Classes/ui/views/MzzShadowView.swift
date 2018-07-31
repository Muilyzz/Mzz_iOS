
import UIKit

/*open class MzzShadowView : MzzView {
    
    public init(_ vc: MzzViewController?, _ frame: MzzRect, _ shadowColor: MzzColor) {
        super.init(vc, frame)
        for sl in layer.sublayers! {
            sl.removeFromSuperlayer()
        }
        
        let rgl = RadialGradientLayer(zVC, MzzRect(0, 0, zW, zH), shadowColor.getAlphaColor)
        add(rgl)
        //layer.addSublayer(rgl)
        //rgl.frame = bounds
        
        //rgl.colors = [shadowColor.toUIColor(), shadowColor.getAlphaColor(0.35).toUIColor(), UIColor.clear]

    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}*/

open class MzzShadowView: MzzImageView {
    
    private var mCGColors: [CGColor]!
    public init(_ vc: MzzViewController?, _ frame: MzzRect, _ shadowColor: MzzColor) {
        super.init(vc, frame)
        mCGColors = [shadowColor.toUIColor().cgColor, shadowColor.getAlphaColor(0.35).toUIColor().cgColor, UIColor.clear.cgColor]
        draw()
        
        self.alpha = 0
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draw() {
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        self.image?.draw(in: self.bounds)
        
        //let context = getContext(lineWidth: lineWidth, lineColor: lineColor)
        let context = UIGraphicsGetCurrentContext()
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 0.5, 1.0]
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: mCGColors as CFArray, locations: locations) else {
            return
        }
        let center = CGPoint(x: CGFloat(zF.w/2), y: CGFloat(zF.h/2))
        let radius = CGFloat(zF.w/2)
        context?.drawRadialGradient(gradient, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: radius, options: CGGradientDrawingOptions(rawValue: 0))
        
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    public func show() {
        self.alpha = 1
    }
    public func hide(alpha: Float = 0.0) {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        })
    }
    
}

