//
//  File.swift
//  
//
//  Created by 张丰 on 2021/6/27.
//

import UIKit
///- View Frame
extension UIView {
    
    /// x
    public var x: CGFloat{
        set{
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
        get{
            return self.frame.origin.x
        }
    }
    /// y
    public var y: CGFloat{
        set{
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
        get{
            return self.frame.origin.x
        }
    }
    /// centerX
    public var centerX: CGFloat{
        set{
            var center = self.center
            center.x = newValue
            self.center = center
        }
        get{
            return self.center.x
        }
    }
    /// centerY
    public var centerY: CGFloat{
        set{
            var center = self.center
            center.y = newValue
            self.center = center
        }
        get{
            return self.center.y
        }
    }
    
    /// rightX
    public var rightX: CGFloat{
        set{
            var rect = self.frame
            rect.origin.x = newValue - frame.size.width
            self.frame = rect
        }
        get{
            return self.frame.origin.x + self.frame.size.width
        }
    }
    /// bottomY
    public var bottomY: CGFloat{
        set{
            var rect = self.frame
            rect.origin.y = newValue - frame.size.height
            self.frame = rect
        }
        get{
            return self.frame.origin.y + self.frame.size.height
        }
    }
    /// width
    public var width: CGFloat{
        set{
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
        get{
            return self.frame.size.width;
        }
    }
    /// height
    public var height: CGFloat{
        set{
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
        get{
            
            return self.frame.size.height;
        }
    }
    
}



