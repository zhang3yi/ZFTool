//
//  File.swift
//  
//
//  Created by 张丰 on 2021/6/27.
//

import UIKit
import Foundation
extension String {
    /// 获取label宽度
    /// - Parameter str: str
    /// - Parameter font: UIFont
    public func getLableWidth(_ font:UIFont) -> CGFloat{
        let string = self as NSString
        let size =  CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: 10)
        let options:NSStringDrawingOptions = .usesLineFragmentOrigin
        let boundingRect =  string.boundingRect(with:size, options: options, attributes: [ NSAttributedString.Key.font:font], context: nil)
        
        return boundingRect.size.width
        
        
        
    }
    
    /// 获取label高度
    public func getLableHeight( _ font:UIFont , _ width:CGFloat) -> CGFloat {
        
        let string = self as NSString
        let size =  CGSize.init(width:width , height: CGFloat.greatestFiniteMagnitude)
        let options:NSStringDrawingOptions = .usesLineFragmentOrigin
        let boundingRect =  string.boundingRect(with:size, options: options, attributes: [ NSAttributedString.Key.font:font], context: nil)
        
        return boundingRect.size.height
    }
}


















