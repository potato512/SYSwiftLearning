//
//  ViewController.swift
//  DemoSwift017_struck
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
        Swift 结构体是构建代码所用的一种通用且灵活的构造体。
        我们可以为结构体定义属性（常量、变量）和添加方法，从而扩展结构体的功能。
        与 C 和 Objective C 不同的是：
        1 结构体不需要包含实现文件和接口。
        2 结构体允许我们创建一个单一文件，且系统会自动生成面向其它代码的外部接口。
        3 结构体总是通过被复制的方式在代码中传递，因此它的值是不可修改的。
        
        语法：通过关键字 struct 来定义结构体
        struct nameStruct 
        {
            var Definition1:类型
            var Definition2
            ……
            var DefinitionN
        }
        
        结构体的使用场景
        首先需要明确的是：
        1、使用结构体来定义开发者的自定义数据类型。
        2、通过值传递来定义你的自定义数据类型。
        
        按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
        1、结构体的主要目的是用来封装少量相关简单数据值。
        2、有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
        3、任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
        4、结构体不需要去继承另一个已存在类型的属性或者行为。
        
        举例来说，以下情境中适合使用结构体：
        1、几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
        2、一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
        3、三维坐标系内一点，封装x，y和z属性，三者均为Double类型。
        4、结构体实例是通过值传递而不是通过引用传递。
        
        */
        
        // 定义
        struct marks
        {
            var chinese:Int
            var maths:Int
            var english:Int
        }
        
        // 使用
        let studentMarks = marks(chinese: 100, maths: 92, english: 88)
        print("学生成绩是：语文\(studentMarks.chinese)，数学\(studentMarks.maths)，英语\(studentMarks.english)")
        
        
        struct SizeScreen
        {
            let width:Float = 320.0
            let height:Float = 568.0
        }
        
        let size = SizeScreen()
        print(size.width, size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

