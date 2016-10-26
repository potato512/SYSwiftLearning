//
//  ViewController.swift
//  DemoSwift026_protocol
//
//  Created by zhangshaoyu on 16/9/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

// 协议
protocol classa
{
    // 协议属性变量
    var marks: Int { get set }
    var result: Bool { get }
    
    // 协议方法
    func attendance() -> String
    func markssecured() -> String
    
    // 构造规定
    init(userName: String)
}

// 子协议
protocol classb: classa
{
    // 协议属性变量
    var present: Bool { get set }
    var subject: String { get set }
    var stname: String { get set }
    
//    // 构造规定
//    init(userName: String)
}

// 类，且继承协议b
class classc: classb
{
    // 类初始化协议属性变量
    var marks = 96
    let result = true
    var present = false
    var subject = "Swift 协议"
    var stname = "Protocols"
    
    // 类实现协议方法
    func attendance() -> String
    {
        return "The \(stname) has secured 99% attendance"
    }
    
    func markssecured() -> String
    {
        return "\(stname) has scored \(marks)"
    }
    
    // 构造规定
    required init(userName: String)
    {
        
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        Swift 协议
        协议规定了用来实现某一特定功能所必需的方法和属性。
        任意能够满足协议要求的类型被称为遵循(conform)这个协议。
        类，结构体或枚举类型都可以遵循协议，并提供具体实现来完成协议定义的方法和功能。
        
        协议的语法格式如下：
        protocol SomeProtocol 
        {
            // 协议内容
        }
        
        要使类遵循某个协议，需要在类型名称后加上协议名称，中间以冒号:分隔，作为类型定义的一部分。遵循多个协议时，各协议之间用逗号,分隔。
        struct SomeStructure: FirstProtocol, AnotherProtocol 
        {
            // 结构体内容
        }
        
        如果类在遵循协议的同时拥有父类，应该将父类名放在协议名之前，以逗号分隔。
        class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol 
        {
            // 类的内容
        }
        
        对属性的规定
        协议用于指定特定的实例属性或类属性，而不用指定是存储型属性或计算型属性。此外还必须指明是只读的还是可读可写的。
        协议中的通常用var来声明变量属性，在类型声明后加上{ set get }来表示属性是可读可写的，只读属性则用{ get }来表示。
        
        
        
        协议可以要求它的遵循者实现指定的构造器。
        你可以像书写普通的构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体，语法如下：
        protocol SomeProtocol
        {
            init(someParameter: Int)
        }
        
        */
        
        
        // 实例会类
//        let studdet = classc()
        
        // 构造规定
        let studdet = classc(userName: "DevZhang")
        
        print(studdet.marks)
        print(studdet.result)
        print(studdet.present)
        print(studdet.subject)
        print(studdet.stname)
        print(studdet.attendance())
        print(studdet.markssecured())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

