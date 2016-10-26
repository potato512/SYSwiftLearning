//
//  ViewController.swift
//  DemoSwift112_otherUI
//
//  Created by zhangshaoyu on 16/9/30.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "slider的使用"

        
        let slider = UISlider(frame: CGRectMake(10.0,10.0, (CGRectGetWidth(self.view.bounds) - 10.0 * 2), 20.0))
        self.view.addSubview(slider)
        slider.backgroundColor = UIColor.lightGrayColor()
        
        // 设置值（默认值为0.0，且值区间为0.0~1.0）
        slider.minimumValue = 1.0
        slider.maximumValue = 100.0
        slider.setValue(20.0, animated: true)
        
        // 注意：滑动条大小值（minimumTrackTintColor、maximumTrackTintColor）颜色与大小值左右两端图标（minimumValueImage、maximumValueImage）不能同时设置，否则图标设置无效
        slider.minimumValueImage = UIImage(named: "normalImage")
        slider.maximumValueImage = UIImage(named: "hightImage")
        
        // 注意：滑动条大小值颜色（minimumTrackTintColor、maximumTrackTintColor）与滑动条大小值图标（setMinimumTrackImage、setMaximumTrackImage）不能同时设置，否则先设置的无效
//        slider.setMinimumTrackImage(UIImage(named: "normalImage"), forState: UIControlState.Normal)
//        slider.setMaximumTrackImage(UIImage(named: "hightImage"), forState: UIControlState.Normal)
        
        slider.minimumTrackTintColor = UIColor.yellowColor()
        slider.maximumTrackTintColor = UIColor.redColor()
        
        // 滑动块颜色、或图标设置（注意：两者不能同时设置，否则先设置的无效。另外，默认thumb块比较大，可通过设置thumbImage的方法改变thumb大小）
        slider.thumbTintColor = UIColor.greenColor()
        slider.setThumbImage(UIImage(named: "hightImage"), forState: UIControlState.Normal)
        slider.setThumbImage(UIImage(named: "hightImage"), forState: UIControlState.Highlighted)
        
        // 滑块滑动停止后才触发ValueChanged事件
        slider.continuous = false
        // 响应事件
        slider.addTarget(self, action: Selector("sliderValueChange:"), forControlEvents: UIControlEvents.ValueChanged)
        
        
        let label = UILabel(frame: CGRectMake(10.0, (CGRectGetMinY(slider.frame) + CGRectGetHeight(slider.bounds) + 10.0), (CGRectGetWidth(self.view.frame) - 10.0 * 2), 30.0))
        self.view.addSubview(label)
        label.backgroundColor = UIColor.yellowColor()
        label.textColor = UIColor.redColor()
        label.tag = 1000
        let value = slider.value
        label.text = String(format: "slider当前值是：%.2f", arguments: [value])
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
    
    // MARK: - sliderValueChange
    func sliderValueChange(slider:UISlider)
    {
        let value = slider.value
        let label:UILabel = self.view.viewWithTag(1000) as! UILabel
        label.text = String(format: "slider当前值是：%.2f", arguments: [value])
        print("slider当前值是：\(value)")
    }
    
}

