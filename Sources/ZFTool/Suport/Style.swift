//
//  File.swift
//  
//
//  Created by 张丰 on 2021/6/27.
//

import Foundation
import UIKit
extension UIView {
    public func style(
        text:String? = nil,
        textColor:UIColor? = nil,
        font:UIFont? = nil,
        alig:NSTextAlignment? = nil,
        number:Int? = nil,
        bgColor:UIColor? = nil,
        radius:CGFloat? = nil,
        borderW:CGFloat? = nil,
        borderColor:UIColor? = nil,
        supView:UIView? = nil) -> Self {
        
        
        
        return self.styleHelp(text:text,textColor: textColor,font: font,alignment: alig,numberOfLines: number,bgColor: bgColor, radius: radius, borderW: borderW, borderColor: bgColor,supView: supView)
    }
    
    private func styleHelp<T:UIView>(
        text:String? = nil,
        textColor:UIColor? = nil,
        font:UIFont? = nil,
        alignment:NSTextAlignment? = nil,
        numberOfLines: Int? = nil,
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
        if self.isKind(of: UILabel.self) {
            
            self.styleLable(text: text, textColor: textColor, font: font,alignment: alignment,numberOfLines: numberOfLines)
        }else if self.isKind(of: UIButton.self){
            self.styleButton(text: text, textColor: textColor, font: font)
        }
        
        if supView != nil {
            supView?.addSubview(self)
        }
        
        let view = self as! T
        
        return view
    }
    
    private func styleLable(
        text:String? = nil,
        textColor:UIColor? = nil,
        font:UIFont? = nil,
        alignment:NSTextAlignment? = nil,
        numberOfLines: Int? = nil)  {
        
        let lb = self as! UILabel
        if text != nil {
            lb.text = text
        }
        
        if textColor != nil {
            lb.textColor = textColor
        }
        if font != nil {
            lb.font = font!
        }
        if alignment != nil {
            lb.textAlignment = alignment!
        }
        if numberOfLines != nil {
            lb.numberOfLines = numberOfLines!
        }
    }
    
    private func styleButton(
        text:String? = nil,
        textColor:UIColor? = nil,
        font:UIFont? = nil)  {
        
        let btn = self as! UIButton
        if text != nil {
            btn.setTitle(text, for: .normal)
        }
        
        if textColor != nil {
            btn.setTitleColor(textColor, for: .normal)
        }
        if font != nil {
            btn.titleLabel?.font = font!
        }
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
}
