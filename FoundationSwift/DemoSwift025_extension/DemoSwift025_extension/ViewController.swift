//
//  ViewController.swift
//  DemoSwift025_extension
//
//  Created by zhangshaoyu on 16/9/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

// 类扩展
extension Int
{
    // 属性
    var add: Int
    {
        return self + 10
    }
    var sub: Int
    {
        return self - 10
    }
    var mul: Int
    {
        return self * 10
    }
    var div: Int
    {
        return self / 10
    }
    
    // 方法
    func topics(summation: () -> ())
    {
        for _ in 0..<self
        {
            summation()
        }
    }
    
    // 可变实例方法
    mutating func square()
    {
        self = self * self
    }
    
    // 下标
    subscript(var multtable: Int) -> Int
    {
        var no1 = 1
        while multtable > 0
        {
            no1 *= 10
            --multtable
        }
        
        return (self / no1) % 10
    }
    
    // 嵌套类型1
    enum calc
    {
        case add
        case sub
        case mult
        case div
        case anything
    }
    
    var print: calc
    {
        switch self
        {
            case 0:return .add
            case 1:return .sub
            case 2:return .mult
            case 3:return .div
            default:return .anything
        }
    }
}

// 嵌套类型2
func result(numb: [Int])
{
    for i in numb
    {
        switch i.print
        {
            case .add:print(" 10 ")
            case .sub:print(" 20 ")
            case .mult:print(" 30 ")
            case .div:print(" 40 ")
            default:print(" 50 ")
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        Swift 扩展
        扩展就是向一个已有的类、结构体或枚举类型添加新功能。
        扩展可以对一个类型添加新的功能，但是不能重写已有的功能。
        
        Swift 中的扩展可以：
        1 添加计算型属性和计算型静态属性
        2 定义实例方法和类型方法
        3 提供新的构造器
        4 定义下标
        5 定义和使用新的嵌套类型
        6 使一个已有类型符合某个协议
        
        语法：扩展声明使用关键字 extension
        extension SomeType 
        {
            // 加到SomeType的新功能写到这里
        }
        
        一个扩展可以扩展一个已有类型，使其能够适配一个或多个协议，语法格式如下：
        extension SomeType: SomeProtocol, AnotherProctocol 
        {
            // 协议实现写到这里
        }
        
        */
        
        
        // 属性
        let addition = 5.add
        print("加法运算后的值：\(addition)")
        let subtraction = 5.sub
        print("减法运算后的值：\(subtraction)")
        let multiplication = 5.mul
        print("乘法运算后的值：\(multiplication)")
        let division = 5.div
        print("除法运算后的值: \(division)")
        let mix = 5.add + 5.sub
        print("混合运算结果：\(mix)")
        
        
        // 方法
        5.topics(){
            print("方法")
        }
        
        var squareCation = 5
        squareCation.square()
        print(squareCation)
        
        // 下标
        let script = 5[1]
        print("下标 \(script)")
        
        // 嵌套类型
        let nested = result([1,2,3,4,5])
        print("嵌套类型 \(nested)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

