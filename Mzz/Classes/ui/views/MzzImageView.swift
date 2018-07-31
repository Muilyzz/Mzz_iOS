
import UIKit

open class MzzImageView : UIImageView, MzImageView {
    //-------------------------------------------------------------------------------------
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    public init(_ vc: MzzViewController?, _ frame: MzzRect) {
        super.init(frame: frame)
        zVC = vc
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
    public var zImage: MzzImage? = nil {
        didSet {
            if zImage == nil {
                image = nil
            }
            else {
                image = Utils.loadImage(zImage!.bundle, zImage!.name)
            }
        }
    }
    //-------------------------------------------------------------------------------------
}
