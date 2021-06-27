//
//  File.swift
//  
//
//  Created by 张丰 on 2021/6/27.
//

import Foundation
import UIKit

// MARK: - 屏幕尺寸
public let ZF_Screen = UIScreen.main
public let ZF_ScreenW = UIScreen.main.bounds.size.width
public let ZF_ScreenH = UIScreen.main.bounds.size.height
public let ZF_ScaleW  = ZF_ScreenW/375.0
public let ZF_ScaleH  = ZF_ScreenH/667.0

// MARK: - 各机型状态栏、导航栏、标签栏的高度
public let ZF_StatusH = UIApplication.shared.statusBarFrame.size.height
public let ZF_NavH    = CGFloat.init(44)
public let ZF_NaviBarH = (ZF_StatusH + ZF_NavH)
public let ZF_IS_IPHONEX:Bool = ZF_StatusH > CGFloat.init(20)
public let ZF_TabbarH = ZF_IS_IPHONEX ? CGFloat.init(83):CGFloat.init(49)
public let ZF_ContentH = ZF_ScreenH - ZF_NaviBarH - ZF_TabbarH
public let ZF_H = ZF_ScreenH - ZF_NaviBarH
public let ZF_Safe_H = ZF_IS_IPHONEX ? CGFloat.init(34):CGFloat.init(0)
public let ZF_One_Pixel = 1.0/UIScreen.main.scale


