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
        
        
        // if语句
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
        
        
        // switch语句 通常用switch语句替换if语句，判断值既可以是基本数据型，也可以是字符，或字符串
        switch (num01)
        {
            case 5:print("等于 5 吗？")
                break;
            case 10:print("等于 10 呀！！！")
                break;
            default:print("不知道值是多少")
                break;
        }
        
        // 可以不以break结束，同时可以区间匹配"case n1...n2:"，以及复合匹配"case n1,n2,n3:"
        switch (num01)
        {
            case 0:print("\(num01) 等于0")
            case 1:print("\(num01) 等于1")
            case 2:print("\(num01) 等于2")
            case 3,4:print("\(num01) 等于3，或4")
            case 5...7:print("\(num01) 大于5，小于8")
            case 7..<20:print("\(num01) 大于7，小于20")
            default:print("\(num01) 值未知")
        }
        
        // 值绑定
        print("值绑定")
        let anotherPoint = (2, 0)
        switch anotherPoint
        {
            case (let x, 0):
                print("on the x-axis with an x value of \(x)")
            case (0, let y):
                print("on the y-axis with a y value of \(y)")
            case let (x, y):
                print("somewhere else at (\(x), \(y))")
        }
        
        // Where case 分支的模式可以使用where语句来判断额外的条件。
        print("值绑定 Where")
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint
        {
            case let (x, y) where x == y:
                print("(\(x), \(y)) is on the line x == y")
            case let (x, y) where x == -y:
                print("(\(x), \(y)) is on the line x == -y")
            case let (x, y):
                print("(\(x), \(y)) is just some arbitrary point")
        }
        
        
        
        // 三目运算
        let isBigger:Bool = (num01 > num02 ? true : false)
        print("(\(num01) > \(num02) ? YES : NO ) = \(isBigger)")
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

