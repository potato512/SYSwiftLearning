//
//  CustomHeader.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/10/24.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

let CustomHeaderHeight:CGFloat = 40.0
let CustomHeaderIdentifier = "CustomHeader"
let CustomHeaderWidth:CGFloat = UIScreen.mainScreen().bounds.width

class CustomHeader: UITableViewHeaderFooterView {

    // 标题按钮
    var headerButton:UIButton!
    
    
    // 必须实现的方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 实例化
    override init(reuseIdentifier: String?)
    {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setUI()
    }
    
    // 让单元格宽度始终为屏幕宽
    override var frame: CGRect
    {
        get
        {
            return super.frame
        }
        set (newFrame)
        {
            var frame = newFrame
            frame.size.width = CustomHeaderWidth
            super.frame = frame
        }
    }

    
    
    // 视图
    private func setUI()
    {
        if self.headerButton == nil
        {
            self.headerButton = UIButton(frame: CGRectMake(0.0, 0.0, CustomHeaderWidth, CustomHeaderHeight))
            self.contentView.addSubview(self.headerButton)
            
            self.headerButton.backgroundColor = UIColor.greenColor()
            self.headerButton.contentHorizontalAlignment = .Center
            self.headerButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            self.headerButton.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        }
    }

}
