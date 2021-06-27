//
//  File.swift
//  
//
//  Created by 张丰 on 2021/6/27.
//
import Foundation
import UIKit

public class ZFToast:UIView {
    private static let toast = ZFToast.init()
    private var _fadeOutTimer:Timer?
    private var fadeOutTimer:Timer?{
        set{
            if _fadeOutTimer != nil {
                _fadeOutTimer?.invalidate()
                _fadeOutTimer = nil
            }
            if newValue != nil {
                _fadeOutTimer = newValue;
            }
            
            
        }
        get{
            return _fadeOutTimer
        }
        
        
    }
    private var titlelb:UILabel?
    
    init() {
        super.init(frame: CGRect.zero)
        _ = self.style(bgColor: UIColor.rgba(0, 0, 0, 0.8), radius: 5)

        self.isHidden = true
        titlelb = UILabel.init().style(textColor: .white,font: 15.font_n , alig:NSTextAlignment.center,number: 0,supView: self)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public class func showMsg(_ msg:String?){
        
        if msg == nil && msg!.count > 0  {
            return
        }
        var view = (UIApplication.shared.delegate?.window)!
        let windows = UIApplication.shared.windows
        for win in windows{

            let viewName = NSStringFromClass(win.self.classForCoder)
            if viewName == "UIRemoteKeyboardWindow" {
                view = win
                break
            }
        }

        view!.addSubview(toast)
        toast.showInfo(status: msg, dur: toast.displayDurationFor(msg!))
        
    }
    
    private func showInfo(status:String?, dur:TimeInterval) {
        if status == nil && status!.count > 0  {
            return
        }
        self.titlelb?.text = status
        
        var width = status!.getLableWidth(15.font_n) + 20
        if width > ZF_ScreenW - 100 {
            width = ZF_ScreenW - 100
        }
        
        let height = status!.getLableHeight(15.font_n, ZF_ScreenW-100)+20
        self.frame = CGRect.init(x: (ZF_ScreenW - width)/2, y: (ZF_ScreenH - height)/2, width: width, height: height)
        self.titlelb?.frame = self.bounds
        if self.isHidden {
            self.viewAnimationBlowWithDuration(0.5)
        }
        self.isHidden = false
        DispatchQueue.main.async {
            self.fadeOutTimer = Timer.init(timeInterval: dur, repeats: false, block: { (timer) in
                self.diss()
            })
            RunLoop.main.add(self.fadeOutTimer!, forMode: .common)
        }
//
    }

  
    private func diss()  {
        self.isHidden = true
        self.removeFromSuperview()
    }
    //返回出现时间
    private func displayDurationFor(_ string:String) -> TimeInterval {

        let minDuration = max(Double(string.count) * 0.06 + 0.5, 1.5)
        return min(minDuration, 8.0)
    }
   
   
    
}


