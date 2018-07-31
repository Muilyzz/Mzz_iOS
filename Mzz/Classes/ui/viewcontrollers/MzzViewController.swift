
import UIKit

open class MzzViewController : UIViewController {
    
    open override func preferredScreenEdgesDeferringSystemGestures() -> UIRectEdge { return [.bottom,.top,.left,.right] }
    open override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    open override var prefersStatusBarHidden: Bool { return true }
    
    public var zU: Float { return zRootView.zU }
    public var zM: Float { return zRootView.zM }
    
    public var zW: Float {
        return Float(view.bounds.width)
    }
    public var zH: Float {
        return Float(view.bounds.height)
    }
    
    public var zRootView: MzContainerView {
        get { return view as! MzContainerView }
        set { }
    }
    
    
    /*public func map(_ view: MzView, _ vc: MzSubViewController) {
        
    }*/
    open override func viewDidLoad() {
        super.viewDidLoad()
        //view = MzzView(self)
        //onLoad()
    }
    
    public var mInstalled:Bool = false
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if mInstalled {
            return
        }
        else {
            //installViews()
            view = MzzContainerView(self)
            onLoad()
            mInstalled = true
        }
    }
    
    open func onLoad() { }
    
    func popover(_ view: MzzContainerView, _ vc: MzzPopoverViewController, _ size: MzzSize) {
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = size
        
        let ppc = vc.popoverPresentationController
        ppc?.permittedArrowDirections = .up // UIPopoverArrowDirection.init(rawValue: 0)
        ppc?.sourceView = view
        ppc?.sourceRect = view.bounds
        ppc?.backgroundColor = vc.zPopoverViewControllerBackgroundColor.toUIColor() //MzzColor.BLACK.toUIColor() //MzzColor.BROWN.toUIColor() //ColorUtil.darkGray.withAlphaComponent(0.5)
        present(vc, animated: false, completion: {
            //vc.view.superview?.layer.cornerRadius = 0
            //vc.onLoad()
        })
    }
}
