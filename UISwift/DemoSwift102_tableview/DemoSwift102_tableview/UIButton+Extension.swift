//
//  UIButton+Extension.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/10/21.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import Foundation
import UIKit

import ObjectiveC
private var ButtonIndexPath:NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
extension UIButton
{
    var indexPath:NSIndexPath
        {
        get
        {
            return (objc_getAssociatedObject(self, &ButtonIndexPath) as! NSIndexPath)
        }
        
        set (newValue)
        {
            objc_setAssociatedObject(self, &ButtonIndexPath, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}