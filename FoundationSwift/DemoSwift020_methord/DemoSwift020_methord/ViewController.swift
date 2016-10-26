//
//  ViewController.swift
//  DemoSwift020_methord
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
        Swift 方法是与某些特定类型相关联的函数
        在 Objective-C 中，类是唯一能定义方法的类型。但在 Swift 中，你不仅能选择是否要定义一个类/结构体/枚举，还能灵活的在你创建的类型（类/结构体/枚举）上定义方法。
        
        实例方法
        在 Swift 语言中，实例方法是属于某个特定类、结构体或者枚举类型实例的方法。
        实例方法提供以下方法：
        可以访问和修改实例属性
        提供与实例目的相关的功能
        实例方法要写在它所属的类型的前后大括号({})之间。
        实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。
        实例方法只能被它所属的类的某个特定实例调用。
        实例方法不能脱离于现存的实例而被调用。
        
        语法格式
        func funcname(Parameters) -> returntype
        {
            Statement1
            Statement2
            ……
            Statement N
            return parameters
        }
        
        */
        
        
        class Counter
        {
            var count = 0
            
            func increment()
            {
                count++
            }
            
            func incrementBy(amount: Int)
            {
                count += amount
            }
            
            func reset()
            {
                count = 0
            }
        }
        
        // 初始计数值是0
        let counter = Counter()
        print("初始值 \(counter.count)")
        
        // 计数值现在是1
        counter.increment()
        print("+1后的值 \(counter.count)")
        
        // 计数值现在是6
        counter.incrementBy(5)
        print("+5后的值 \(counter.count)")
        
        // 计数值现在是0
        counter.reset()
        print("重置后值 \(counter.count)")
        
        
        
        // self 属性 类型的每一个实例都有一个隐含属性叫做self，self 完全等同于该实例本身。
        class calculations
        {
            let a: Int
            let b: Int
            let res: Int
            
            init(a: Int, b: Int)
            {
                self.a = a
                self.b = b
                res = a + b
                
                print("Self 内: \(res)")
            }
            
            func tot(c: Int) -> Int
            {
                return res - c
            }
            
            func result()
            {
                print("结果为: \(tot(20))")
                print("结果为: \(tot(50))")
            }
        }
        
        let pri = calculations(a: 600, b: 300)
        let sum = calculations(a: 1200, b: 300)
        
        pri.result()
        sum.result()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

