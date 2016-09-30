//
//  ViewController.swift
//  DemoSwift117_segmentControl
//
//  Created by zhangshaoyu on 16/9/30.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "segmentControl的使用"
        
        let segment = UISegmentedControl(frame: CGRectMake(10.0, 10.0, (CGRectGetWidth(self.view.bounds) - 10.0 * 2), 40.0))
        self.view.addSubview(segment)
        
        segment.backgroundColor = UIColor.lightGrayColor()

        // 设置按钮（图标样式）
        segment.insertSegmentWithImage(UIImage(named: "image01"), atIndex: 0, animated: true)
        segment.insertSegmentWithImage(UIImage(named: "image02"), atIndex: 1, animated: true)
        segment.insertSegmentWithImage(UIImage(named: "image03"), atIndex: 2, animated: true)
        segment.insertSegmentWithImage(UIImage(named: "image04"), atIndex: 3, animated: true)
        segment.insertSegmentWithImage(UIImage(named: "image05"), atIndex: 4, animated: true)

        // 移除按钮
        segment.removeAllSegments()
        
        // 设置按钮（标题样式）
        segment.insertSegmentWithTitle("红色", atIndex: 0, animated: true)
        segment.insertSegmentWithTitle("绿色", atIndex: 1, animated: true)
        segment.insertSegmentWithTitle("白色", atIndex: 2, animated: true)
        segment.insertSegmentWithTitle("橙色", atIndex: 3, animated: true)
        segment.insertSegmentWithTitle("segmentControl", atIndex: 4, animated: true)
        
        segment.insertSegmentWithImage(UIImage(named: "image05"), atIndex: 5, animated: true)
        
        // 设置某个按钮宽度
        segment.setWidth(110.0, forSegmentAtIndex: 4)
        
        // 设置某个按钮不可用
        segment.setEnabled(false, forSegmentAtIndex: 4)
        segment.setEnabled(true, forSegmentAtIndex: 5)
        
        // 设置后没有选中高亮效果，默认false
        segment.momentary = false
        
        // 初始化选中按钮，默认0
        segment.selectedSegmentIndex = 1
        
        // 按钮边框及字体颜色
        segment.tintColor = UIColor.greenColor()

        // 响应事件
        segment.addTarget(self, action: Selector("segmentValueChange:"), forControlEvents: UIControlEvents.ValueChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView()
    {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        
        // UI适配
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    // MARK: - segmentValueChange
    func segmentValueChange(sender:UISegmentedControl)
    {
        let index = sender.selectedSegmentIndex
        let text = String(format: "你点击了第%ld个按钮", arguments: [index])
        print(text)
        
        switch index
        {
            case 0:self.view.backgroundColor = UIColor.redColor()
            case 1:self.view.backgroundColor = UIColor.greenColor()
            case 2:self.view.backgroundColor = UIColor.whiteColor()
            case 3:self.view.backgroundColor = UIColor.orangeColor()
            default : self.view.backgroundColor = UIColor.yellowColor()
        }
    }
}

