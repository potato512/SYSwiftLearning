//
//  ViewController.swift
//  DemoSwift07_condition
//
//  Created by zhangshaoyu on 16/9/12.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        条件语句主要有以下类型
        1、if语句
        2、if...else..语句
        3、if...else if...else语句
        4、switch语句
        5、(A ? B : C)三目运算符
        */
        
        let num01 = 10
        let num02 = 20
        
        if (num01 > num02)
        {
            print("\(num01) 大于 \(num02)")
        }
        
        if (num01 > num02)
        {
            print("\(num01) 大于 \(num02)")
        }
        else
        {
            print("\(num01) 小于等于 \(num02)")
        }
        
        if (num01 > num02)
        {
            print("\(num01) 大于 \(num02)")
        }
        else if (num01 == num02)
        {
            print("\(num01) 等于 \(num02)")
        }
        else
        {
            print("\(num01) 小于 \(num02)")
        }
        
        switch (num01)
        {
            case 5:print("等于 5 吗？")
                break;
            case 10:print("等于 10 呀！！！")
                break;
            default:print("不知道值是多少")
                break;
        }
        
        let isBigger:Bool = (num01 > num02 ? true : false)
        print("(\(num01) > \(num02) ? YES : NO ) = \(isBigger)")
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

