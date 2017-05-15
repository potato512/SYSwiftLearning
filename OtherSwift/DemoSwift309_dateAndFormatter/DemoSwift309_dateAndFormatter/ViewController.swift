//
//  ViewController.swift
//  DemoSwift309_dateAndFormatter
//
//  Created by zhangshaoyu on 17/5/15.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

// 宏定义（变量）
let timeDefault = String("yyyy-MM-dd HH:mm:ss")

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "NSDate时间"
        
        self.setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func setUI()
    {
        let label = UILabel.init(frame: CGRectMake(10.0, 80.0, (self.view.frame.size.width - 10.0 * 2), 25.0))
        self.view.addSubview(label)
        label.layer.borderColor = UIColor.redColor().CGColor
        label.layer.borderWidth = 0.5
        label.textColor = UIColor.blackColor()
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(12.0)
        
        // 指定格式时间
        var date = NSDate()
        let format = NSDateFormatter.init()
//        format.dateFormat = timeDefault
        format.dateFormat = TimeFormat.format_yyyyMdHmsS.rawValue
        var time = format.stringFromDate(date)
        label.text = time
        
        
        let label2 = UILabel.init(frame: CGRectMake(10.0, 110.0, (self.view.frame.size.width - 10.0 * 2), 25.0))
        self.view.addSubview(label2)
        label2.layer.borderColor = UIColor.redColor().CGColor
        label2.layer.borderWidth = 0.5
        label2.textColor = UIColor.blackColor()
        label2.textAlignment = .Center
        label2.font = UIFont.systemFontOfSize(12.0)
        
        // 指定时间格式
        time = "2017-12-28 11:11:11"
        date = format.dateFromString(time)!
        label2.text = date.description
    }
    
    // MARK: - 时间格式
    
    
    enum TimeFormat:String
    {
        case format_default            = "yyyy-MM-dd HH:mm:ss"
        case format_yyMdHm             = "yy-MM-dd HH:mm"
        case format_yyyyMdHm           = "yyyy-MM-dd HH:mm"
        case format_yMd                = "yyyy-MM-dd"
        case format_MdHms              = "MM-dd HH:mm:ss"
        case format_MdHm               = "MM-dd HH:mm"
        case format_Hms                = "HH:mm:ss"
        case format_Hm                 = "HH:mm"
        case format_Md                 = "MM-dd"
        case format_yyMd               = "yy-MM-dd"
        case format_YYMMdd             = "yyyyMMdd"
        case format_yyyyMdHms          = "yyyyMMddHHmmss"
        case format_yyyyMdHmsS         = "yyyy-MM-dd HH:mm:ss.SSS"
        case format_yyyyMMddHHmmssSSS  = "yyyyMMddHHmmssSSS"
        case format_yMdWithSlash       = "yyyy/MM/dd"
        case format_yM                 = "yyyy-MM"
        case format_yMdChangeSeparator = "yyyy.MM.dd"
    }
}

