//
//  File.swift
//  
//
//  Created by 张丰 on 2021/6/27.
//

import Foundation
import UIKit
extension UIView {
    public func viewStyle(
        bgColor:UIColor? = nil,
        radius:CGFloat? = nil,
        borderW:CGFloat? = nil,
        borderColor:UIColor? = nil,
        supView:UIView? = nil) -> Self {
        
        
        
        return self.styleHelp(bgColor: bgColor, radius: radius, borderW: borderW, borderColor: bgColor,supView: supView)
    }
    
    private func styleHelp<T:UIView>(
        bgColor:UIColor? = nil,
        radius:CGFloat? = nil,
        borderW:CGFloat? = nil,
        borderColor:UIColor? = nil,
        supView:UIView? = nil) -> T {
        
        
        if bgColor != nil {
            self.backgroundColor = bgColor
        }
        if radius != nil {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = radius!
            
            if borderW != nil && borderColor != nil {
                self.layer.borderWidth = borderW!
                self.layer.borderColor = borderColor?.cgColor
            }
        }
        
        if supView != nil {
            supView?.addSubview(self)
        }
        
        let view = self as! T
        
        return view
    }
    
    
    
    
   
    
    
    
    
}

extension UILabel{
    public func style(
        text:String? = nil,
        textColor:UIColor? = nil,
        font:UIFont? = nil,
        alignment:NSTextAlignment? = nil,
        numberOfLines: Int? = nil) -> UILabel {
        
        if text != nil {
            self.text = text
        }
        
        if textColor != nil {
            self.textColor = textColor
        }
        if font != nil {
            self.font = font!
        }
        if alignment != nil {
            self.textAlignment = alignment!
        }
        if numberOfLines != nil {
            self.numberOfLines = numberOfLines!
        }
        return self
    }
}
extension UIButton{
    
    public func style(
        text:String? = nil,
        textColor:UIColor? = nil,
        font:UIFont? = nil) -> UIButton  {
        
        
        if text != nil {
            self.setTitle(text, for: .normal)
        }
        
        if textColor != nil {
            self.setTitleColor(textColor, for: .normal)
        }
        if font != nil {
            self.titleLabel?.font = font!
        }
        return self
    }
    
    public func styleImg(
        _ img:String? = nil,
        _ state:UIControl.State) -> UIButton  {
        
        
        if img != nil {
            self.setImage(IMG(img!), for: state)
        }
        return self
    }
}
extension UIImageView{
    public func style(
        _ img:String? = nil) -> UIImageView  {
        
        
        if img != nil {
            self.image = IMG(img!)
        }
        return self
    }
}
// MARK: - 颜色
extension UIColor{
    
    public class func rgb(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat)->UIColor{
        return UIColor.init(red: r, green: g, blue: b, alpha: 1);
    }
    public class func rgba(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat)->UIColor{
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    /// 16进制颜色
    public class func hex(_ hex: Int) -> (UIColor) {
        
        return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(hex & 0xFF)) / 255.0,alpha: 1.0)
    }
    /// 16进制颜色
    public class func hexa(_ hex: Int,a:CGFloat) -> (UIColor) {
        
        return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0,blue: ((CGFloat)(hex & 0xFF)) / 255.0,alpha: a)
    }
    
}

extension Int {
    
    public var font_n:UIFont{
        
        get {
            guard let font = UIFont.init(name: "PingFangSC-Regular", size: CGFloat.init(self)) else {
                return UIFont.systemFont(ofSize: CGFloat.init(self))
            }
            return font
        }
    }
    
    
    
    
    public var font_m:UIFont{
        
        get {
            guard let font = UIFont.init(name: "PingFangSC-Medium", size: CGFloat.init(self)) else {
                return UIFont.systemFont(ofSize: CGFloat.init(self))
            }
            return font
        }
    }
    public var font_b: UIFont{
        get {
            guard let font = UIFont.init(name: "PingFangSC-Semibold", size: CGFloat.init(self)) else {
                return UIFont.systemFont(ofSize: CGFloat.init(self))
            }
            return font
        }
    }
    
    
    public var w:CGFloat {
        return CGFloat(self)*ZF_ScaleW
    }
    public var h:CGFloat {
        return CGFloat(self)*ZF_ScaleH
    }
}
