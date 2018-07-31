
import UIKit

open class MzzPopoverViewController : MzzViewController {
    
    public var zPopoverViewControllerBackgroundColor: MzzColor = MzzColor.BLACK {
        didSet { popoverPresentationController?.backgroundColor = zPopoverViewControllerBackgroundColor.toUIColor() }
    }
    public var zContainerColor: MzzColor? = MzzColor.BLACK {
        didSet { mContainer.zStyle.zBorderColor = zContainerColor ?? MzzColor.CLEAR }
    }
    
    private var mTitle: MzzTextView!
    private var mIconButton: MzzIconButton!
    
    public var mContainer: MzzRoundedView!
    func createContainer(_ title: String?, _ buttonIcon: MzzImage?, _ onClick: ((MzzIconButton)->())?) {
        
        let s:Float = Float(UIScreen.main.bounds.height * 0.04)
        let m:Float = s*0.14
        if title != nil {
            mTitle = MzzTextView(nil, MzzRect(m*3, m, zRootView.zW-s, s-m*2))
            zRootView.add(mTitle)
            mTitle.zText = title ?? ""
            mTitle.zTextColor = MzzColor.WHITE.getAlphaColor(0.8)
            mTitle.zTextAlignment = .left
        }
        if buttonIcon != nil {
            mIconButton = MzzIconButton(nil, MzzRect(zRootView.zW-s, m, s-m*2, s-m*2))
            zRootView.add(mIconButton)
            mIconButton.zIcon = buttonIcon
            mIconButton.zOnClick = {
                onClick?(self.mIconButton)
            }
        }
        let th = ( (title != nil || buttonIcon != nil) ? s : s*0.15 )
        mContainer = MzzRoundedView(nil, MzzRect(s*0.15, th, zRootView.zW-s*0.15*2, zRootView.zH-(th)-s*0.15), MzzColor.BLACK)
        zRootView.add(mContainer)
        
        mContainer.zStyle.zCornerRadius = s*0.33
        mContainer.zOverallColor = MzzColor.BLACK
        mContainer.zIsHightlightOn = true
        mContainer.zIsUserInteractionEnabled = false
    }
    
    public func map(_ containerV: MzzContainerView, _ childVC: UIViewController) {
        addChildViewController(childVC)
        containerV.addSubview(childVC.view)
        childVC.view.frame = containerV.bounds
        
        containerV.layer.cornerRadius = CGFloat(containerV.zStyle.zCornerRadius)
        containerV.clipsToBounds = true
        //childVC.view.clipsToBounds = true
    }
    
}
