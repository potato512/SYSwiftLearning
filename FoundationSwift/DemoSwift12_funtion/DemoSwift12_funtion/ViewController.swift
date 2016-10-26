//
//  ViewController.swift
//  DemoSwift12_funtion
//
//  Created by zhangshaoyu on 16/9/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        Swift 函数用来完成特定任务的独立的代码块。
        Swift使用一个统一的语法来表示简单的C语言风格的函数到复杂的Objective-C语言风格的方法。
        1 函数声明: 告诉编译器函数的名字，返回类型及参数。
        2 函数定义: 提供了函数的实体。
        
        Swift 函数包含了参数类型及返回值类型：
        1 函数定义，Swift 定义函数使用关键字 func。
        2 定义函数的时候，可以指定一个或多个输入参数和一个返回值类型。参数，返回值必须指明类型，多个参数以" , "隔开。
        3 每个函数都有一个函数名来描述它的功能。通过函数名以及对应类型的参数值来调用这个函数。函数的参数传递的顺序必须与参数列表相同。
        4 函数的实参传递的顺序必须与形参列表相同，-> 后定义函数的返回值类型。
        5 语法格式：
        func funcname(形参) -> returntype
        {
            Statement1
            Statement2
            ……
            Statement N
            return parameters
        }
        6 函数调用，直接使用定义的函数名称使用
        
        */
        
        // 没有返回值
        func showName(name:String) -> Void
        {
            print("Your name is \(name)")
        }
        
        showName("zhangshaoyu")
        
        // 没有参数，没有返回值
        func showHelloWorld() -> Void
        {
            print("hello world")
        }
        showHelloWorld()
        
        // 有返回值
        func addNum(num1:Int, num2:Int) -> Int
        {
            let num = num1 + num2
            return num
        }
        
        let num = addNum(10, num2: 20)
        print(num)
        
        
        // 元组作为函数返回值（为了安全地处理"空数组，或nil数组"问题，将元组返回类型设置为可选，即添加" ? "）
        func minMax(array:[Int]) -> (min: Int, max: Int)?
        {
            if array.isEmpty
            {
                return nil
            }
            
            var intMin = array[0]
            var intMax = array[0]
            
            for value in array[1..<array.count]
            {
                if value < intMin
                {
                    intMin = value
                }
                else if value > intMax
                {
                    intMax = value
                }
            }
            
            return (intMin, intMax)
        }
        
        let array = [8, -6, 2, 109, 3, 71]
        let bounds = minMax([])
        if bounds != nil
        {
            print("最小值为 \(bounds!.min) ，最大值为 \(bounds!.max)")
        }
        else
        {
            print("没有结果")
        }
        
        
        
        // 可变参数。可变参数可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数，其数量是不确定的。可变参数通过在变量类型名后面加入（...）的方式来定义。
        func showNumber<N> (numbers:N...)
        {
            for i in numbers
            {
                print(i)
            }
        }
        showNumber(1,2,3,4,4,3,4,1)
        


        showInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func showInfo() -> ()
    {
        print("zhangshaoyu is an iOSDev，he is from meizhou.People call him DevZhang")
    }
}

