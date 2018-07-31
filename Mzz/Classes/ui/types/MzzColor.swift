
import UIKit

public class MzzColor {
    
    var hex: String!
    var alpha: Float = 1
    
    public init(_ hex: String, _ alpha: Float) {
        self.hex = hex
        self.alpha = alpha
    }
    public convenience init(_ hex: String) {
        self.init(hex, 1)
    }
    public convenience init(_ R: Float, _ G: Float, _ B: Float) {
        self.init(String(format: "#%02X%02X%02X", lroundf(R*255.0), lroundf(G*255.0), lroundf(B*255.0)), 1)
    }
    
    public func getAlphaColor(_ alpha: Float) -> MzzColor {
        let newAlpha = self.alpha * alpha
        return MzzColor(hex, newAlpha)
    }
    public func getBlackBasedOpaqueColor() -> MzzColor {
        let oldR = Int(hex[1...2], radix: 16)!
        let newR = lroundf(Float(oldR) * self.alpha)
        
        let oldG = Int(hex[3...4], radix: 16)!
        let newG = lroundf(Float(oldG) * self.alpha)
        
        let oldB = Int(hex[5...6], radix: 16)!
        let newB = lroundf(Float(oldB) * self.alpha)
        return MzzColor(String(format: "#%02X%02X%02X", newR, newG, newB), 1)
    }
    
    public static var CLEAR = MzzColor("#000000", 0)
    public static var BLACK = MzzColor("#000000")
    public static var WHITE = MzzColor("#FFFFFF")
    public static var BROWN = MzzColor(0.6, 0.4, 0.2)
    
    public func toUIColor() -> UIColor {
        var cString:String = hex!.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.clear
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
