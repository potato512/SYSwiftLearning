//
//  ViewController.swift
//  DemoSwift01
//
//  Created by zhangshaoyu on 16/9/8.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

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
        
        // bool布尔值（必须使用true，false，或1，0。不能使用YES，NO）
        let isValid:Bool = true
        print(isValid)
        
        let isTrue = 1
        print(isTrue)
        
        // string字符串
        let name = "DevZhang"
        print(name)
        
        let job:String = "iOS Dev"
        print(job)
        
        // 字符
        let charName:Character = "z"
        print(charName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

