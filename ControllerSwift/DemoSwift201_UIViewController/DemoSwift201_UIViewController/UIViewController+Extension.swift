//
//  UIViewController+Extension.swift
//  DemoSwift201_UIViewController
//
//  Created by zhangshaoyu on 16/10/17.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import Foundation
import UIKit

let sizeButton:CGFloat = 20.0;

extension UIViewController
{
    // MARK: - 适配
    func autoSize()
    {
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
        
        if self.respondsToSelector(Selector("extendedLayoutIncludesOpaqueBars"))
        {
            self.extendedLayoutIncludesOpaqueBars = false
        }
        
        if self.respondsToSelector(Selector("automaticallyAdjustsScrollViewInsets"))
        {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    // MARK: - 根视图控制器
    var isRootViewController:Bool
    {
        get
        {
            if self.navigationController!.viewControllers.first!.isEqual(self)
            {
                return true
            }
            
            return false
        }
    }
    
    // MARK: - 视图控制器索引下标值
    var indexViewController:Int
    {
        get
        {
            let indexVC = self.navigationController!.viewControllers.indexOf(self)!
            return indexVC
        }
    }
    
    // MARK: - 返回上层视图控制器
    func backPreviousController()
    {
        if self.isRootViewController
        {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else
        {
            if (self.presentedViewController != nil)
            {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            else
            {
                self.navigationController!.popViewControllerAnimated(true)
            }
        }
    }
}

