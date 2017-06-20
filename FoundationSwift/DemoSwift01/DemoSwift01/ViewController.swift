//
//  ViewController.swift
//  DemoSwift01
//
//  Created by zhangshaoyu on 16/9/8.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        
        数据类型
        int整型、unint无符号整型、float单精度浮点型、double双精度浮点型、bool布尔型、string字符串、字符、Optional、Array、Dictionary、Struct、和 Class 等
        
        
        类型安全
        Swift 是一个类型安全（type safe）的语言。
        由于 Swift 是类型安全的，所以它会在编译你的代码时进行类型检查（type checks），并把不匹配的类型标记为错误。这可以让你在开发的时候尽早发现并修复错误。
        即变量的类型，根据首次使用时的赋值进行确定，当再次进行赋值时，若值的类型为其他类型则异常，如：
        var name = "zhangshaoyu"
        print(name)
        或直接定义时指定了变量的类型，如：
        var myName:String = "herman"
        print(myName)
        
        
        类型推断
        当你要处理不同类型的值时，类型检查可以帮你避免错误。然而，这并不是说你每次声明常量和变量的时候都需要显式指定类型。
        如果你没有显式指定类型，Swift 会使用类型推断（type inference）来选择合适的类型。
        例如，如果你给一个新常量赋值42并且没有标明类型，Swift 可以推断出常量类型是Int，因为你给它赋的初始值看起来像一个整数：
        
        */
        
        // 数据类型
        
        // int整型
        let age:Int = 30;
        print(age)
        
        // unint无符号整型
        
        // float浮点数
        let money:Float = 125.32
        print(money)
        
        let haha:Int = Int(money)
        print(haha)
        
        
        
        // bool布尔值（必须使用true，false，或1，0。不能使用YES，NO）
        let isValid:Bool = true
        print(isValid)
        
        let isTrue = 1
        print(isTrue)
        
        
        
        
        // 元组
        // 定义方法1 未声明参数名称，未声明数据类型
        let student = ("devZhang", 65, 98,62)
        // 定义方法2 声明参数名称，未声明数据类型
        let student2 = (name:"devZhang", math:53, english:82, chinese:65)
        // 定义方法3 声明参数名称，声明数据类型
        let student3:(String, Int, Int, Int) = (name:"devZhang", math:53, english:82, chinese:65)
        // 定义方法4 使用下划线"_"忽略未使用参数
        let (studentName, _, _, _):(String, Int, Int, Int) = ("DevZhang", 45, 91, 71)

        // 获取信息
        print("\(student), \(student2), \(student3)")
        
        // 方法1 使用下标
        print("1 name is \(student.0), math = \(student.1), english = \(student.2), chinese = \(student.3)")
        // 方法2 使用参数名称（已声明参数名称，如定义方法2、3）
        print("2 name is \(student2.name), math = \(student2.math), english = \(student2.english), chinese = \(student2.chinese)")
        // 方法3 使用参数名称（已声明参数名称，但未声明元组变量名称，如定义方法4）
        print(studentName)
        
        
        
        
        // optionals可选值，即数据类型后添加关键字?表示该变量为可选值。主要用来处理值可能缺失的情况，即两种状态：有值，没有值nil。
        // 可选值可以使用if语句进行判断
        let className:String? = "class 8"
        if (className != nil)
        {
            print("class name is \(className)")
        }
        // 可选值可以使用有感叹号!进行强制解析，强制解析时必须有值（如果可选值没有值时，强制解包会出现编译进行时异常crash）
        let subClassName:String = className!
        print("sub class name is \(subClassName)")
        // 使用可选绑定（即不声明变量的数据类型），避免强制解包时的异常
        if let subClassName2 = className
        {
            print(subClassName2)
        }
        // optionals可选值，数据类型后添加关键字!表示隐式解析，即确保变量总是有值，获取值时无需再进行解析。
        let gladeName:String! = "glade 3"
        print(gladeName)
        
        let subGladeName:String = gladeName
        print(subGladeName)
        
        

        
        

        
        
        
//        var range:Range<Int> = Range(start: 0, end: 5)
//        print(range)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

