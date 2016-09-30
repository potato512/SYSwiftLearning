//
//  ViewController.swift
//  DemoSwift113_switch
//
//  Created by zhangshaoyu on 16/9/30.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "switch的使用"
        
        // 实例化（注意：默认宽高是 51 x 31。指定大小无效）
        let switchview = UISwitch(frame: CGRectMake(10.0, 10.0, 0.0, 0.0))
        self.view.addSubview(switchview)
        switchview.backgroundColor = UIColor.yellowColor()
        
        // 打开时背景色
        switchview.onTintColor = UIColor.brownColor()
        // 开关块颜色
        switchview.thumbTintColor = UIColor.blueColor()
        // 关闭时边框颜色
        switchview.tintColor = UIColor.orangeColor()
        
        // 开关图标设置（设置后无效？？）
        switchview.onImage = UIImage(named: "normalImage")
        switchview.offImage = UIImage(named: "hightImage")
        
        // 初始化开，或关
        switchview.setOn(false, animated: true)
        
        // 响应事件
        switchview.addTarget(self, action: Selector("switchValueChange:"), forControlEvents: UIControlEvents.ValueChanged)
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
    
    // MARK: - switchValueChange
    func switchValueChange(sender:UISwitch)
    {
        let openStatus = sender.on
        if openStatus
        {
            self.view.backgroundColor = UIColor.cyanColor()
        }
        else
        {
            self.view.backgroundColor = UIColor.whiteColor()
        }
    }

}

