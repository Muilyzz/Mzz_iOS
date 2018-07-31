
import UIKit

open class MzzIconButton : MzzRoundedView {
    
    private var mImageView: MzzImageView!
    
    public var zIcon: MzzImage! {
        didSet { mImageView.zImage = zIcon }
    }
    
    public init(_ vc: MzzViewController?, _ frame: MzzRect) {
        super.init(vc, frame, MzzColor.WHITE.getAlphaColor(0.2))
        zStyle.zCornerRadius = zH*0.2
        zAlphaHightlightOff = 0
        
        mImageView = MzzImageView(zVC, zB.reduce(zH*0.1, zH*0.1))
        add(mImageView)
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    public var zOnClick: (()->())? = nil
    override open func onTouchUp() {
        super.onTouchUp()
        zOnClick?()
    }
    
}
