//
//  ViewController.swift
//  DemoSwift115_activityIndicatorView
//
//  Created by zhangshaoyu on 16/9/30.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "activityIndicatorView的使用"
        
        // 实例化
        let activityview = UIActivityIndicatorView(frame: CGRectMake(10.0, 10.0, 50.0, 50.0))
        self.view.addSubview(activityview)
        
        activityview.backgroundColor = UIColor.yellowColor()        
        activityview.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        activityview.color = UIColor.redColor()
        
        // 停止转圈圈时，隐藏
        activityview.hidesWhenStopped = true
        activityview.startAnimating()
        
        activityview.tag = 1000
        
        
        let swithch = UISwitch(frame: CGRectMake(100.0, 10.0, 0.0, 0.0))
        self.view.addSubview(swithch)
        swithch.on = false
        swithch.addTarget(self, action: Selector("switchValueChange:"), forControlEvents: UIControlEvents.ValueChanged)
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
        let activityview = self.view.viewWithTag(1000) as! UIActivityIndicatorView
        
        let openStatus = sender.on
        if openStatus
        {
            if !activityview.isAnimating()
            {
                activityview.startAnimating()
            }
        }
        else
        {
            activityview.stopAnimating()
        }
    }
}

