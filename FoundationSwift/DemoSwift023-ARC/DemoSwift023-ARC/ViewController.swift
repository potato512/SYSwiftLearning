//
//  ViewController.swift
//  DemoSwift023-ARC
//
//  Created by zhangshaoyu on 16/9/23.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        Swift 使用自动引用计数（ARC）这一机制来跟踪和管理应用程序的内存
        通常情况下我们不需要去手动释放内存，因为 ARC 会在类的实例不再被使用时，自动释放其占用的内存。
        但在有些时候我们还是需要在代码中实现内存管理。
        
        ARC 功能
        1 当每次使用 init() 方法创建一个类的新的实例的时候，ARC 会分配一大块内存用来储存实例的信息。
        2 内存中会包含实例的类型信息，以及这个实例所有相关属性的值。
        3 当实例不再被使用时，ARC 释放实例所占用的内存，并让释放的内存能挪作他用。
        4 为了确保使用中的实例不会被销毁，ARC 会跟踪和计算每一个实例正在被多少属性，常量和变量所引用。
        5 实例赋值给属性、常量或变量，它们都会创建此实例的强引用，只要强引用还在，实例是不允许被销毁的。
        
        
        */
        
        
        class Person
        {
            let name: String
            init(name: String)
            {
                self.name = name
                print("\(name) 开始初始化")
            }
            
            deinit
            {
                print("\(name) 被析构")
            }
        }
        
        // 值会被自动初始化为nil，目前还不会引用到Person类的实例
        var reference1: Person? = Person(name: "111")
        // 断开第一个强引用
        reference1 = nil

        
        /*
        循环强引用
        这种情况发生在两个类实例互相保持对方的强引用，并让对方不被销毁。这就是所谓的循环强引用。
        循环引用类型
        1 类之间的强引用（通过弱引用解决，或无主引用解决）
        2 block闭包引用的强引用（可以通过无主引用解决）
        
        
        解决循环强引用
        即允许循环引用中的一个实例引用另外一个实例而不保持强引用
        1 弱引用
        （1）对于生命周期中会变为nil的实例使用弱引用
        （2）使用关键字weak修饰类
        2 无主引用
        （1）对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用
        （2）使用关键字unowned类
        （3）闭包中时，使用[unowned self] in

        */
        
        // 类循环强引用（）
        class Student
        {
            let name: String
            var marks: Marks?
            
            init(name: String)
            {
                self.name = name
            }
            
            deinit
            {
                print("\(name) 被析构")
            }
        }
        
        class Marks
        {
            let number: Int
            
            // 循环引用、弱引用时
//            init(number: Int)
//            {
//                self.number = number
//            }
//
//            // 循环引用时的定义
////            var student: Student?
//            // 弱引用时的定义
//            weak var student: Student?
            
            // 无主引用时的定义
            unowned let student: Student
            init(student:Student, number:Int)
            {
                self.number = number;
                self.student = student;
            }
            
            deinit
            {
                print("Grade #\(number) 被析构")
            }
        }
        
        // 循环引用、弱引用时
//        // 两个变量都被初始化赋值
//        var student01: Student? = Student(name: "DevZhang")
//        var marks01: Marks? = Marks(number: 2)
//        // 循环强引用被创建，感叹号是用来展开和访问可选变量
//        student01!.marks = marks01
//        marks01!.student = student01
//        // 循环强引用时没有信息显示，即析构函数没执行，且在造成了内存泄漏
//        student01 = nil
//        marks01 = nil
        
        // 无主引用时
        var student02:Student? = Student(name: "DevZhang")
        student02!.marks = Marks(student: student02!, number: 87)
        student02 = nil
        
        
        
        // 闭包block循环强引用
        // 创建实例并打印信息，强引用时没有执行析构函数
        var company: Company? = Company(name: "VST", address: "深圳福田")
        print(company!.companyAddress())

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // 闭包block循环强引用
    class Company
    {
        let name: String
        let address: String?
        
        lazy var companyAddress: () -> String = {
            
            // 无主引用时
            [unowned self] in
            
            if let addressTmp = self.address
            {
                return "\(self.name),\(addressTmp)"
            }
            else
            {
                return "\(self.name)"
            }
        }
        
        init(name: String, address: String? = nil)
        {
            self.name = name
            self.address = address
        }
        
        deinit
        {
            print("\(self) is being deinitialized")
        }
    }
}

