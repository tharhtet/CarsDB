//
//  UIViewExtension.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/19/23.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: Bounce and Shake
    
    func shake(){
        let offset = self.bounds.size.width / 30
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - offset, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + offset, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    /** Loads instance from nib with the same name. */
    
    func setShadow(scale: Bool = true) {
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.colorFromHex(value: .Blur).withAlphaComponent(0.3).cgColor
        //        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        
    }
    
    func dropShadow(scale: Bool = true) {
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.colorFromHex(value: .Blur).withAlphaComponent(1.0).cgColor
//        layer.shadowColor = UIColor.red.cgColor
//        layer.shadowOffset = CGSize(width: -8, height: -8)
      
        layer.shadowRadius = 17
        layer.shadowOffset = CGSize.zero
        
        layer.shadowOpacity = 1
        
//        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//        layer.shouldRasterize = true
//        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offset: CGSize, radius: CGFloat = 0, scale: Bool = true) {
        
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func loadNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func getTextField() -> UITextField? {
        
        for view in self.subviews {
            
            if view.tag == 13 {
                
                if let textField = view as? UITextField {
                    
                    return textField
                }
            }
        }
        
        return nil
    }
    
    func getTitleLabel() -> UILabel? {
        
        for view in self.subviews {
            
            if view.tag == 12 {
                
                if let label = view as? UILabel {
                    
                    return label
                }
            }
        }
        
        return nil
    }
    
    func getMessageLabel() -> UILabel? {
        
        for view in self.subviews {
            
            if view.tag == 11 {
                
                if let label = view as? UILabel {
                    
                    return label
                }
            }
        }
        
        return nil
    }
}

extension UIColor {
    
    enum DesignedColors: String {
        case Yellow = "FECF00"
        case Gold = "E8B900"
        case Dark = "333333"
        case Light = "CFCFCF"
        case Black = "565C60"
        case Grey = "9B9B9B"
        case Border = "979797"
        case DarkText = "4A4A4A"
        case LightText = "C3C3C3"
        case TextBlue = "609AD2"
        case Tabbar = "B6B9BB"
        case PasswordStrength = "E4E4E4"
        case Error = "C16057"
        case Normal = "787878"
        case Blur = "CACACA"
        case SearchBar = "F3F3F3"
        case Accepted = "5C89A3"
        case MapBorder = "DDDDDD"
    }
    
    class func colorWith(hex: String) -> UIColor {
        
//        let hex = value.rawValue
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func colorFromHex(value: DesignedColors) -> UIColor {
        
        let hex = value.rawValue
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
