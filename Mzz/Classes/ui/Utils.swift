
import UIKit

public class Utils {
    
    static private var loadedFonts:[String:UIFont] = [:]
    static public func loadFont(_ bundleID: String?, _ fontName: String, _ fontSize: CGFloat) -> UIFont? {
        let key = "\(fontName)|\(fontSize)"
        let value = loadedFonts[key]
        if value != nil {
            return value
        }
        else {
            var bundle: Bundle? = nil
            if bundleID == nil {
                bundle = Bundle.main
            }
            else {
                bundle = Bundle.init(identifier: bundleID!)!
            }
            let name = String(fontName.split(separator: ".").first!)
            let ext = String(fontName.split(separator: ".").last!)
            let url = bundle!.url(forResource: name, withExtension: ext)
            let dp = CGDataProvider(url: url! as CFURL)!
            let font:CGFont? = CGFont(dp)
            if font == nil { return nil }
            CTFontManagerRegisterGraphicsFont(font!, nil)
            let newValue = UIFont.init(name: name, size: fontSize)
            loadedFonts[key] = newValue
            return newValue
        }
    }
    
    static private var loadedImages:[String:UIImage] = [:]
    static public func loadImage(_ bundleID: String?, _ imageName: String) -> UIImage? {
        let key = "\(imageName)"
        let value = loadedImages[key]
        if value != nil {
            return value
        }
        else {
            var bundle: Bundle? = nil
            if bundleID == nil {
                bundle = Bundle.main
            }
            else {
                bundle = Bundle.init(identifier: bundleID!)!
            }
            let name = String(imageName.split(separator: ".").first!)
            let ext = String(imageName.split(separator: ".").last!)
            let newValue = UIImage.init(named: name, in: bundle, compatibleWith: nil)
            loadedImages[key] = newValue
            return newValue
        }
    }
    
    
}
