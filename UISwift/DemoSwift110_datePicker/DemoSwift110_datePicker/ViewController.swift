//
//  ViewController.swift
//  DemoSwift110_datePicker
//
//  Created by zhangshaoyu on 16/9/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "datepicker的使用"
        
        // 实例化UIDatePicker（默认宽高分别是：屏幕的宽度，216的高度）
        let datepicker = UIDatePicker()
        self.view.addSubview(datepicker)
        
        // 属性设置
        datepicker.backgroundColor = UIColor.lightGrayColor()
        
        // 日期显示属性
        datepicker.datePickerMode = UIDatePickerMode.DateAndTime

        // 设置默认时间
        datepicker.setDate(NSDate(), animated: true)
        
        // 最小、最大时间选择设置
        datepicker.minimumDate = NSDate(timeInterval: -93312000, sinceDate: NSDate())
        datepicker.maximumDate = NSDate(timeIntervalSinceNow: 93312000)
        
        // 时间分钟间隔设置
        datepicker.minuteInterval = 5
        
        // 将日期选择器区域设置为中文（默认显示英文）
        datepicker.locale = NSLocale(localeIdentifier: "zh_CN")
        
        // 添加方法
        datepicker.addTarget(self, action:Selector("dateChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        
        let label = UILabel(frame: CGRectMake(10.0, (CGRectGetHeight(self.view.bounds) - 10.0 - 40.0), (CGRectGetWidth(self.view.bounds) - 10.0 * 2), 40.0))
        self.view.addSubview(label)
        label.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin
        label.backgroundColor = UIColor.yellowColor()
        label.textColor = UIColor.redColor()
        label.tag = 1000
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

    // MARK: - 日期选择器响应方法
    func dateChanged(datePicker:UIDatePicker)
    {
        // 更新提醒时间文本框
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        let date = datePicker.date
        let dateText = formatter.stringFromDate(date)

        let label = self.view.viewWithTag(1000) as! UILabel
        label.text = dateText
    }
    
}

