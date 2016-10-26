//
//  ViewController.swift
//  DemoSwift016_emum
//
//  Created by zhangshaoyu on 16/9/22.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

/*
枚举
枚举简单的说也是一种数据类型，只不过是这种数据类型只包含自定义的特定数据，它是一组有共同特性的数据的集合。
Swift 的枚举类似于 Objective C 和 C 的结构，枚举的功能为:
1、它声明在类中，可以通过实例化类来访问它的值。
2、枚举也可以定义构造函数（initializers）来提供一个初始成员值；可以在原始的实现基础上扩展它们的功能。
3、可以遵守协议（protocols）来提供标准的功能。

语法：Swift 中使用 enum 关键词来创建枚举并且把它们的整个定义放在一对大括号内
enum enumname:类型
{
    // 枚举定义放在这里
    value1(String)
    value2(String,Int)
    ...
    valueN
}
*/



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // 定义
        enum httpStatus
        {
            case error
            case success
            case timeout
        }
        
        // 使用
        let network = httpStatus.error
        switch network
        {
            case httpStatus.error:
                print("网络错误")

            case httpStatus.success:
                print("成功")

            case httpStatus.timeout:
                print("网络超时")
        }
        
        // 枚举可分为相关值与原始值。
        /*
        相关值，或叫关联值
        （1）不同数据类型，如：enum {10,0.8,"Hello"}
        （2）值的创建基于常量或变量
        （3）相关值是当你在创建一个基于枚举成员的新常量或变量时才会被设置，并且每次当你这么做得时候，它的值可以是不同的
        */
        enum Student
        {
            case Name(String)
            case Mark(Int, Int, Int)
        }
        
        var StudentZhang = Student.Name("Runoob")
        StudentZhang = Student.Mark(98, 97, 95)
        switch StudentZhang
        {
            case Student.Name(let studName):
                print("1 学生的名字是: \(studName)。")
            case Student.Mark(let English, let Maths, let Chinese):
                print("1 学生的成绩是: \(English),\(Maths),\(Chinese)。")
        }
        
        
        let studDetails = Student.Name("Runoob")
        let studMarks = Student.Mark(98, 97, 95)
        print("2 学生的名字是: \(studDetails)。")
        print("2 学生的成绩是: \(studMarks)。")
        switch studDetails
        {
            case Student.Name(let studName):
                print("3 学生的名字是: \(studName)。")
            case Student.Mark(let English, let Maths, let Chinese):
                print("3 学生的成绩是: \(English),\(Maths),\(Chinese)。")
        }
        switch studMarks
        {
            case Student.Name(let studName):
            print("4 学生的名字是: \(studName)。")
            case Student.Mark(let English, let Maths, let Chinese):
            print("4 学生的成绩是: \(English),\(Maths),\(Chinese)。")
        }
        
        /*
        原始值
        （1）相同数据类型，如：enum {10,35,50}
        （2）预先填充的值
        （3）原始值始终是相同的
        */
        enum Month:Int
        {
            case January = 1
            case February
            case March
            case April
            case May
            case June
            case July
            case August
            case September
            case October
            case November
            case December
        }
        
        let yearMonth = Month.May.rawValue
        print("数字月份为: \(yearMonth)。")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

