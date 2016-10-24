//
//  CustomFooter.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/10/24.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

let CustomFooterHeight:CGFloat = 40.0
let CustomFooterIdentifier = "CustomFooter"
let CustomFooterWidth:CGFloat = UIScreen.mainScreen().bounds.width

class CustomFooter: UITableViewHeaderFooterView {

    var label:UILabel!
    
    // 必须实现
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 实例化
    override init(reuseIdentifier: String?)
    {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.setUI()
    }

    
    
    // 视图
    private func setUI()
    {
        if self.label == nil
        {
            self.label = UILabel(frame: CGRectMake(0.0, 0.0, CustomFooterWidth, CustomFooterHeight))
            self.contentView.addSubview(self.label)
            
            self.label.font = UIFont.systemFontOfSize(10.0)
            self.label.textAlignment = .Center
            self.label.backgroundColor = UIColor.yellowColor()
        }
    }
}
