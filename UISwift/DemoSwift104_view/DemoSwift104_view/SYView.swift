//
//  SYView.swift
//  DemoSwift104_view
//
//  Created by zhangshaoyu on 16/9/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class SYView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = UIColor.clearColor()
//        
//        let number:CGFloat = 5.0
//        let width = CGRectGetWidth(self.bounds) / number
//        
//        for index in 0..<5
//        {
//            let rect = CGRectMake((CGFloat(index) * width),0.0,width,CGRectGetHeight(self.bounds))
//            
//            let view = UIView(frame: rect)
//            self.addSubview(view)
//            view.backgroundColor = UIColor.init(red: CGFloat(random() % 255), green: CGFloat(random() % 255), blue: CGFloat(random() % 255), alpha: 1.0)
//        }
        
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
