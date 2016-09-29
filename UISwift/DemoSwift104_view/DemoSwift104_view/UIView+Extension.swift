//
//  UIView+Extension.swift
//  DemoSwift104_view
//
//  Created by zhangshaoyu on 16/9/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import Foundation
import UIKit

private var newHeight:CGFloat = 0.0

///// 无参无返回值
//typealias funcBlock = () -> () //或者 () -> Void
///// 返回值是String
//typealias funcBlockA = (Int,Int) -> String
///// 返回值是一个函数指针，入参为String
//typealias funcBlockB = (Int,Int) -> (String)->()
///// 返回值是一个函数指针，入参为String 返回值也是String
//typealias funcBlockC = (Int,Int) -> (String)->String

/// 点击事件
typealias touchClickBlock = () -> Void

extension UIView
{
    // MARK: - left/right/top/bottom/width/height属性
    /*
    /// 左间距
    var left:CGFloat { return self.frame.origin.x }
    
    /// 右间距
    var right:CGFloat { return (self.frame.origin.x + self.frame.size.width) }
    
    /// 顶端间距
    var top:CGFloat { return self.frame.origin.y }
    
    /// 底端间距
    var bottom:CGFloat { return (self.frame.origin.y + self.frame.size.height) }
    
    /// 长度
    var width:CGFloat { return self.frame.size.width }
    
    /// 宽度
    var height:CGFloat { return self.frame.size.height }
    */
    
    /// 左间距
    var left:CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    /// 右间距
    var right:CGFloat {
        get {
            return (self.frame.origin.x + self.frame.size.width)
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.x = (newValue - self.frame.size.width)
            self.frame = rect
        }
    }
    
    /// 顶端间距
    var top:CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    /// 底端间距
    var bottom:CGFloat {
        get {
            return (self.frame.origin.y + self.frame.size.height)
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.y = (newValue - self.frame.size.height)
            self.frame = rect
        }
    }
    
    /// 长度
    var width:CGFloat {
        get {
            return self.frame.size.width
        }
        set(newValue) {
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    /// 宽度
    var height:CGFloat {
        get {
            return self.frame.size.height
//            return (objc_getAssociatedObject(self, &newHeight) as! CGFloat)
        }
        set(newValue)
        {
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
//            objc_setAssociatedObject(self, &newHeight, newValue as CGFloat, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: - 点击事件
//    var clickBlockA:touchClickBlock?  // 初始时为nil了,因为生命周其中，(理想状态)可能为nil所以用?
//    var clickBlockB:touchClickBlock!  // 初始时为nil了,因为生命周其中，(理想状态)认为不可能为nil,所以用!
//    
//    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        print("touchesBegan")
//        
//        let block = clickBlockA
//    }

}