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
    
    
    // MARK: - 导航栏标题设置
    
    /// 设置导航栏标题视图
    func setNavigationTitleView(titleView:UIView)
    {
        if let viewTmp:UIView = titleView
        {
            let view = UIView(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(titleView.frame), CGRectGetHeight(titleView.frame)))
            view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleLeftMargin, UIViewAutoresizing.FlexibleRightMargin]
            
            view.addSubview(viewTmp)
            viewTmp.autoresizesSubviews = true;
            viewTmp.center = view.center;
            
            self.navigationItem.titleView = view;
        }
    }
    
    /// 设置导航栏标题
    func setNavigationTitle(title:String, titleFont:UIFont, titleColor:UIColor)
    {
        // 系统方法 张绍裕 20150604
        self.navigationItem.title = title;
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName:titleFont, NSForegroundColorAttributeName:titleColor]
        
        // 自定义label标签方法
        /*
        let label = UILabel(frame: CGRectMake(0.0, 0.0, 200.0, CGRectGetHeight(self.navigationBar.frame)))
        label.font = titleFont
        label.textColor = titleColor
        label.textAlignment = NSTextAlignment.Center
        self.navigationController!.navigationItem.titleView = label;
        */
    }
    
    /// 设置默认导航栏标题
    func setNavigationDefaultFontTitle(title:String)
    {
        self.setNavigationTitle((title.isEmpty ? "未设置标题" : title), titleFont: UIFont.boldSystemFontOfSize(18.0), titleColor: UIColor.whiteColor())
    }
    
    // MARK: - 导航栏左右按钮
    func setNavigationBarButton(title:String, normalColor:UIColor, highlightedColor:UIColor, normalImage:UIImage, highlightedImage:UIImage, action:Selector, leftButton:Bool) -> UIBarButtonItem
    {
        let buttonFrame:CGRect = CGRectMake(0.0, 0.0, (sizeButton * 3.0), sizeButton)
        
        let button = UIButton(frame: buttonFrame)
        
        if !leftButton
        {
            // 右按钮时向右对齐
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        }
        
        // 设置按钮标题
        if !title.isEmpty
        {
            var titleButton:String = title
            // titleButton = "返回"
            
            /*
            if 1 == self.viewControllers.indexOf(self)
            {
            // 始终设置返回按钮的标题为第一个视图控制器名称
            let previousVC = self.viewControllers.first
            titleButton = previousVC!.navigationItem.title!;
            }
            */
            
            button.titleEdgeInsets = UIEdgeInsetsMake(0.0, -15.0, 0.0, 0.0);
            button.titleLabel!.font = UIFont.boldSystemFontOfSize(14.0)
            
            button.setTitle(titleButton, forState: UIControlState.Normal)
            if let normalColorTmp:UIColor = normalColor
            {
                button.setTitleColor(normalColorTmp, forState: UIControlState.Normal)
            }
            if let highlightedColorTmp:UIColor = highlightedColor
            {
                button.setTitleColor(highlightedColorTmp, forState: UIControlState.Highlighted)
            }
        }
        
        // 设置按钮图标
        button.imageEdgeInsets = UIEdgeInsetsMake(0.0, (!title.isEmpty ? -15.0 : -30.0), 0.0, 0.0);
        if let normalImageTmp:UIImage = normalImage
        {
            button.imageView!.contentMode = UIViewContentMode.ScaleAspectFit
            button.setImage(normalImageTmp, forState: UIControlState.Normal)
        }
        if let highlightedImageTmp:UIImage = highlightedImage
        {
            button.imageView!.contentMode = UIViewContentMode.ScaleAspectFit
            button.setImage(highlightedImageTmp, forState: UIControlState.Highlighted)
        }
        
        // 设置响应事件
        if let actionTmp:Selector = action
        {
            button.addTarget(self, action: actionTmp, forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        button.accessibilityLabel = "back"
        
        // 自定义返回按钮
        let item = UIBarButtonItem(customView: button)
        return item;
    }

}

