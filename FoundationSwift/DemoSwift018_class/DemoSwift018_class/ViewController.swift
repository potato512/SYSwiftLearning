//
//  ViewController.swift
//  DemoSwift018_class
//
//  Created by zhangshaoyu on 16/9/22.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        Swift 类是构建代码所用的一种通用且灵活的构造体。
        我们可以为类定义属性（常量、变量）和方法。
        与其他编程语言所不同的是，Swift 并不要求你为自定义类去创建独立的接口和实现文件。
        你所要做的是在一个单一文件中定义一个类，系统会自动生成面向其它代码的外部接口。
        
        类和结构体对比
        Swift 中类和结构体有很多共同点。共同处在于：
        1 定义属性用于存储值
        2 定义方法用于提供功能
        3 定义附属脚本用于访问值
        4 定义构造器用于生成初始化值
        5 通过扩展以增加默认实现的功能
        6 符合协议以对某类提供标准功能
        与结构体相比，类还有如下的附加功能：
        1 继承允许一个类继承另一个类的特征
        2 类型转换允许在运行时检查和解释一个类实例的类型
        3 解构器允许一个类实例释放任何其所被分配的资源
        4 引用计数允许对一个类的多次引用
        
        语法：类似于结构体，关键字使用Class
        Class classname 
        {
            let Definition1:类型 = 初始化值
            var Definition2
            ……
            DefinitionN
        
            // 未初始化值时，必须进行实例化
            init(Definition1:类型, Definition2:类型, ..., DefinitionN:类型)
            {
                self.Definition1 = Definition1
                ...
                self.DefinitionN = DefinitionN
            }
        }
        
        */
        
        
        class MarksStruct
        {
            var mark: Int
            // 未初始化值时，必须进行实例化
            init(mark: Int)
            {
                self.mark = mark
            }
        }
        let marksStruct = MarksStruct(mark: 100)
        print(marksStruct.mark)
        
        
        class person
        {
            let name:String = "DevZhang"
            let job:String = "iOS Dev"
        }
        let person01 = person()
        print(person01.name, person01.job)
        
        class person02
        {
            var name:String
            var job:String
            init(name:String, job:String)
            {
                self.name = name
                self.job = job
            }
        }
        let person03 = person02(name:"1236321", job:"test")
        print(person03.name, person03.job)
        
        class student
        {
            var name:String = "xiaoming"
            var markChinese:Int = 90
            var markMaths:Int = 87
            var markEnglish:Int = 67
        }
        let student01 = student()
        print(student01.name, student01.markChinese, student01.markMaths, student01.markEnglish)
        
        
        /*
        恒等运算符
        因为类是引用类型，有可能有多个常量和变量在后台同时引用某一个类实例。
        为了能够判定两个常量或者变量是否引用同一个类实例，Swift 内建了两个恒等运算符：
        1 恒等运算符
        （1）运算符为：===
        （2）如果两个常量或者变量引用同一个类实例则返回 true
        2 不恒等运算符
        （1）运算符为：!==
        （2）如果两个常量或者变量引用不同一个类实例则返回 true
        */
        class SampleClass
        {
//            let property:String
//            init(s:String)
//            {
//                property = s
//            }
            
            // 或
            let property:String
            init(property:String)
            {
                self.property = property
            }
        }
        
//        let spClass1 = SampleClass(s: "Hello")
//        let spClass2 = SampleClass(s: "Hello")
        // 或
        let spClass1 = SampleClass(property: "Hello")
        let spClass2 = SampleClass(property: "Hello")
        
        if spClass1 === spClass2
        {
            // false
            print("引用相同的类实例 \(spClass1)")
        }
        
        if spClass1 !== spClass2
        {
            // true
            print("引用不相同的类实例 \(spClass2)")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

