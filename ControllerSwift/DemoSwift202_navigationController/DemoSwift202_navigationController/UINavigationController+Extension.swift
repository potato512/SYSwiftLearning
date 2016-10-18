//
//  UINavigationController+Extension.swift
//  DemoSwift202_navigationController
//
//  Created by zhangshaoyu on 16/10/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import Foundation
import UIKit

let sizeButton:CGFloat = 20.0

extension UINavigationController
{
    // MARK: - 导航栏样式设置
    /// 设置默认导航栏样式
    func setNavigationStyleDefault()
    {
        self.setNavigationStyle(UIColor.whiteColor(), textFont: UIFont.boldSystemFontOfSize(18.0), textColor: UIColor.blackColor())
    }
    
    /// 导航栏样式设置（自定义背景颜色、字体）
    func setNavigationStyle(backgroundColor:UIColor, textFont:UIFont, textColor:UIColor)
    {
        if self.navigationBar.respondsToSelector(Selector("barTintColor"))
        {
            // 背景色
            self.navigationBar.barTintColor = backgroundColor
            self.navigationBar.translucent = false
            self.navigationBar.tintColor = UIColor.whiteColor()
            
            // 字体
            self.navigationBar.titleTextAttributes = [NSFontAttributeName:textFont, NSForegroundColorAttributeName:textColor];
            
            // 导航底部1px的阴影颜色-修改
            /*
            self.navigationBar.shadowImage = UIImage(named: "")
            [self.navigationBar setShadowImage:kImageWithColor(kColorSeparatorline)];
            */
            
            // 导航底部1px的阴影-遮住
            let maskLayer = CAShapeLayer.init()
            maskLayer.backgroundColor = UIColor.redColor().CGColor;
            let maskRect = CGRectMake(0, -20.0, CGRectGetWidth(self.navigationBar.frame), (20.0 + CGRectGetHeight(self.navigationBar.frame)));
            maskLayer.path = CGPathCreateWithRect(maskRect, nil);
            self.navigationBar.layer.mask = maskLayer;
        }
    }
}