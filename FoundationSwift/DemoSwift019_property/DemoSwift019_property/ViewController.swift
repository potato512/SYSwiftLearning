//
//  ViewController.swift
//  DemoSwift019_property
//
//  Created by zhangshaoyu on 16/9/22.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        Swift 属性将值跟特定的类、结构或枚举关联。
        属性可分为存储属性和计算属性:
        1 存储属性，即一个存储属性就是存储在特定类或结构体的实例里的一个常量或变量
        （1）存储常量或变量作为实例的一部分，即可以是常量存储属性，也可以是变量存储属性；在定义时即可指定默认值，也可以在设置时修改值。
        （2）用于类和结构体
        2 计算属性，即不直接存储值，而是提供一个 getter 来获取值，一个可选的 setter 来间接设置其他属性或变量的值。
        （1）计算（而不是存储）一个值
        （2）用于类、结构体和枚举
        
        存储属性和计算属性通常用于特定类型的实例。
        属性也可以直接用于类型本身，这种属性称为类型属性。
        另外，还可以定义属性观察器来监控属性值的变化，以此来触发一个自定义的操作。
        属性观察器可以添加到自己写的存储属性上，也可以添加到从父类继承的属性上。
        
        
        */
        
        // 存储属性
        struct marks
        {
            var grade:Int
            var maths:Float
            var english:Float = 77.6
            let chinese = 82.5
        }
        
        var marks01 = marks(grade: 19201, maths: 62.2, english: 79.5)
        print(marks01.grade, marks01.maths, marks01.english)
        
        marks01.grade = 67
        print(marks01.grade, marks01.maths, marks01.english)

        
        /*
        延迟存储属性：是指当第一次被调用的时候才会计算其初始值的属性。
        在属性声明前使用 lazy 来标示一个延迟存储属性。
        注意：必须将延迟存储属性声明成变量（使用var关键字），因为属性的值在实例构造完成之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
        延迟存储属性一般用于：延迟对象的创建；当属性的值依赖于其他未知类
        */
        
        class number
        {
            // `var` 关键字是必须的，延迟对象的创建
            lazy var name = "学号：1"
        }
        
        let number01 = number()
        print(number01.name)
        
        class student
        {
            // `var` 关键字是必须的，属性值依赖于其他类
            lazy var no = number()
        }
        
        var student01 = student()
        print(student01.no.name)
        
        
        
        // 计算属性
        class markTotal
        {
            var markChinese = 70.0, markMaths = 60.0
            
            var total:(Double)
            {
                get
                {
                    // 只读getter
                    return (markChinese + markMaths)
                }
            }
        }
        
        var result = markTotal()
        print(result.markChinese, result.markMaths, result.total)
        
        result.markChinese = 89.6
        result.markMaths = 78.5
        print(result.markChinese, result.markMaths, result.total)
        
        
        /*
        属性观察器：监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，甚至新的值和现在的值相同的时候也不例外。
        可以为除了延迟存储属性之外的其他存储属性添加属性观察器，也可以通过重载属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器。
        注意：不需要为无法重载的计算属性添加属性观察器，因为可以通过 setter 直接监控和响应值的变化。
        
        可以为属性添加如下的一个或全部观察器：
        1 willSet在设置新的值之前调用
        2 didSet在新的值被设置之后立即调用
        3 willSet和didSet观察器在属性初始化过程中不会被调用
        */
        class Samplepgm
        {
            var counter:Int = 0
            {
                willSet(valueNew)
                {
                    print("计数器: \(valueNew)")
                }
                
                didSet
                {
                    if counter > oldValue
                    {
                        print("新增数 \(counter - oldValue)")
                    }
                }
            }
        }
        
        let NewCounter = Samplepgm()
        print(NewCounter.counter)
        
        NewCounter.counter = 100
        print(NewCounter.counter)
        
        NewCounter.counter = 800
        print(NewCounter.counter)
        
        NewCounter.counter = 10
        print(NewCounter.counter)

        
        
        /*
        全局变量和局部变量：计算属性和属性观察器所描述的模式也可以用于全局变量和局部变量。
        局部变量：在函数、方法或闭包内部定义的变量
        全局变量：函数、方法、闭包或任何类型之外定义的变量
        作用：
        1 用于存储和检索值
        2 存储属性用于获取和设置值
        3 也用于计算属性
        */
        
       // 类型属性是作为类型定义的一部分写在类型最外层的花括号（{}）内。使用关键字 static 来定义值类型的类型属性，关键字 class 来为类定义类型属性。
        struct Structname
        {
            static var storedTypeProperty = " "
            static var computedTypeProperty:Int
            {
                // 这里返回一个 Int 值
                return 10
            }
        }
        
        enum Enumname
        {
            static var storedTypeProperty = " "
            static var computedTypeProperty:Int
            {
                // 这里返回一个 Int 值
                return 10
            }
        }
        
        class Classname
        {
            class var computedTypeProperty:Int
            {
                // 这里返回一个 Int 值
                return 10
            }
        }
        
        // 类型属性的访问也是通过点运算符(.)来进行。但是，类型属性是通过类型本身来获取和设置，而不是通过实例
        struct StudMarks
        {
            static let markCount = 97
            static var totalCount = 0
            var InternalMarks:Int = 0
            {
                didSet
                {
                    if InternalMarks > StudMarks.markCount
                    {
                        InternalMarks = StudMarks.markCount
                    }
                    if InternalMarks > StudMarks.totalCount
                    {
                        StudMarks.totalCount = InternalMarks
                    }
                }
            }
        }
        
        var stud1Mark1 = StudMarks()
        var stud1Mark2 = StudMarks()
        
        stud1Mark1.InternalMarks = 98
        print(stud1Mark1.InternalMarks) 
        
        stud1Mark2.InternalMarks = 87
        print(stud1Mark2.InternalMarks)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

