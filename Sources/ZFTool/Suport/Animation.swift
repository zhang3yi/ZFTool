//
//  File.swift
//  
//
//  Created by 张丰 on 2021/6/27.
//

import Foundation
import UIKit

// MARK: - 动画
extension UIView{
    
    /// 弹出效果
    func viewAnimationBlowWithDuration(_ dur:TimeInterval) {
        
        
        let animation = CAKeyframeAnimation.init(keyPath: "transform")
        animation.duration = dur
        let values = NSMutableArray.init()
        values.add(NSValue.init(caTransform3D: CATransform3DMakeScale(0.1, 0.1, 1.0)))
        values.add(NSValue.init(caTransform3D: CATransform3DMakeScale(1.2, 1.2, 1.0)))
        values.add(NSValue.init(caTransform3D: CATransform3DMakeScale(0.9, 0.9, 1.0)))
        
        values.add(NSValue.init(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)))
        animation.values = values as? [Any]
        
        self.layer.add(animation, forKey: nil)
        
    }
}
