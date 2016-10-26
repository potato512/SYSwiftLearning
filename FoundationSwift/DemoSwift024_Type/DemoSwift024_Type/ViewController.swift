//
//  ViewController.swift
//  DemoSwift024_Type
//
//  Created by zhangshaoyu on 16/9/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        Swift 类型转换
        Swift 语言类型转换可以判断实例的类型，也可以用于检测实例类型是否属于其父类或者子类的实例，类型转换也可以用来检查一个类是否实现了某个协议。
        Swift 中类型检测使用关键字is，类型转换使用关键字as。
        

        
        */
        
        
        class Marks
        {
            var chinese: String
            init(chinese: String)
            {
                self.chinese = chinese
            }
        }
        
        class Grade0ne: Marks
        {
            var maths: String
            init(chinese: String, maths: String)
            {
                self.maths = maths
                super.init(chinese: chinese)
            }
        }
        
        class GradeTwo: Marks
        {
            var english: String
            init(chinese: String, english: String)
            {
                self.english = english
                super.init(chinese: chinese)
            }
        }
        
        let studentMark = [Grade0ne(chinese: "86", maths: "66"), GradeTwo(chinese: "78", english: "92")]
        print(studentMark)
        
        let xiaoMingMark = Grade0ne(chinese: "44", maths: "54")
        print("语文成绩是: \(xiaoMingMark.chinese)")
        print("数学成绩是: \(xiaoMingMark.maths)")
        
        
        let xiaoHongMark = GradeTwo(chinese: "98", english: "94")
        print("语文成绩是: \(xiaoHongMark.chinese)")
        print("英语成绩是: \(xiaoHongMark.english)")
        
        // 判断类型
        if xiaoHongMark is GradeTwo
        {
            print("二年级的成绩")
        }
        else
        {
            print("不是二年级的成绩")
        }

        // 类型转换（注意使用关键字as，及关键字符?）
        for item in studentMark
        {
            if let xiaoWangMark = item as? Grade0ne
            {
                print(xiaoWangMark)
            }
            else if let xiaoZhangMark = item as? GradeTwo
            {
                print(xiaoZhangMark)
            }
        }

        /*
        Any和AnyObject的类型转换
        Swift为不确定类型提供了两种特殊类型别名：
        1 AnyObject可以代表任何class类型的实例。
        2 Any可以表示任何类型，包括方法类型（function types）。
        注意：只有当你明确的需要它的行为和功能时才使用Any和AnyObject。
        */
        
        // 可以存储Any类型的数组 exampleany
        var arrayAny01 = [Any]()
        print(arrayAny01)
        arrayAny01 = Array<Any>()
        print(arrayAny01)
        
        arrayAny01.append(12)
        arrayAny01.append(3.14159)
        arrayAny01.append("Any 实例")
        arrayAny01.append(Grade0ne(chinese: "56", maths: "95"))
        arrayAny01.append(GradeTwo(chinese: "69", english: "78"))
        print(arrayAny01)
        
        for item in arrayAny01
        {
            // 方法1
//            switch item
//            {
//                case let itemInt as Int: print("整型值为 \(itemInt)")
//                case let itemDouble as Double where itemDouble > 0: print("Pi 值为 \(itemDouble)")
//                case let itemString as String: print("\(itemString)")
//                case let itemGradeOne as Grade0ne: print("语文数学 '\(itemGradeOne.chinese)', \(itemGradeOne.maths)")
//                case let itemGradeTwo as GradeTwo: print("语文英语 '\(itemGradeTwo.chinese)', \(itemGradeTwo.english)")
//                default: print("None")
//            }
            
            // 方法2
            if let itemInt = item as? Int
            {
                print("整型值为 \(itemInt)")
            }
        }

        // 方法selector
        func buttonClick() -> Void
        {
            print("点击")
        }
        print(buttonClick)
        
        // AnyObject任意类型元素的数组（不包含方法selector）
        let arrayAnyObject01:Array<AnyObject> = [Grade0ne(chinese: "86", maths: "66"), GradeTwo(chinese: "78", english: "92"), "DevZhang", 30]
        print(arrayAnyObject01)

        // Any任意类型元素的数组（包含方法selector）
        let arrayAnyObject02:Array<Any> = [Grade0ne(chinese: "86", maths: "66"), GradeTwo(chinese: "78", english: "92"), "DevZhang", 30, buttonClick()]
        print(arrayAnyObject02)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

