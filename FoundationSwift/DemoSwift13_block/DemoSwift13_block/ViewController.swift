//
//  ViewController.swift
//  DemoSwift13_block
//
//  Created by zhangshaoyu on 16/9/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

// block定义
typealias BlockTarget = (String) -> (Void)


class ViewController: UIViewController {

    // 定义成变量
    var blockTarget:BlockTarget?
    var blockAction:((String) -> (Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        闭包(Closures)是自包含的功能代码块，可以在代码中使用或者用来作为参数传值。
        Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的 匿名函数比较相似。
        全局函数和嵌套函数其实就是特殊的闭包。
        闭包的形式有：
        1 全局函数：有名字但不能捕获任何值
        2 嵌套函数：有名字，也能捕获封闭函数内的值
        3 闭包表达式：无名闭包，使用轻量级语法，可以根据上下文环境捕获值

        Swift中的闭包有很多优化的地方:
        1 根据上下文推断参数和返回值类型
        2 从单行表达式闭包中隐式返回（也就是闭包体只有一行代码，可以省略return）
        3 可以使用简化参数名，如$0, $1(从0开始，表示第i个参数...)
        4 提供了尾随闭包语法(Trailing closure syntax)
        
        闭包的语法格式
        1 以下定义了一个接收参数并返回指定类型的闭包语法：
        {
            (parameters) -> return type in
            statements
        }
        
        2 尾随闭包
        (parameters) -> return type in {
            statements
        }
        
        */
        
        
        let studname = {
            () -> () in
            print("Swift 闭包实例。")
        }
        studname()
        
        let studname02 = {
            print("swift 闭包实例。尾随闭包")
        }
        studname02()
        
//        let studname03 = (Void -> Void in) {
//            print("swift 闭包实例。尾随闭包")
//        }
//        studname03()
        
        
        // 闭包形式接收两个参数并返回布尔值
        let divide = {
            (val1: Int, val2: Int) -> Int in
            
            let value = val1 / val2
            return value
        }
        let result = divide(200, 20)
        print (result)
        
        // sort 函数。
        /*
        Swift 标准库提供了名为sort的函数，会根据您提供的用于排序的闭包函数将已知类型数组中的值进行排序。排序完成后，sort(_:)方法会返回一个与原数组大小相同,包含同类型元素且元素已正确排序的新数组，原数组不会被sort(_:)方法修改。
        sort(_:)方法需要传入两个参数：
        已知类型的数组
        闭包函数，该闭包函数需要传入与数组元素类型相同的两个值，并返回一个布尔类型值来表明当排序结束后传入的第一个参数排在第二个参数前面还是后面。如果第一个参数值出现在第二个参数值前面，排序闭包函数需要返回true，反之返回false。
        */
        
        
        // 使用普通函数(或内嵌函数)提供排序功能,闭包函数类型需为(String, String) -> Bool。
        func backwards(s1: String, s2: String) -> Bool
        {
            var result:Bool
            
            // 从大到小
//            result = s1 > s2
            
            // 从小到大
            result = s1 < s2
            
            return result
        }
        let names = ["AT", "AE", "D", "S", "BE"]
        let reversed = names.sort(backwards)
        print(reversed)
        
        
        // 参数名称缩写，可以直接通过$0,$1,$2来顺序调用闭包的参数
        // $0和$1表示闭包中第一个和第二个String类型的参数。在闭包表达式中使用参数名称缩写, 也可以在闭包参数列表中省略对其定义, 并且对应参数名称缩写的类型会通过函数类型进行推断。in 关键字同样也可以被省略
        let reversed02 = names.sort( {
            $0 > $1
        })
        print(reversed02)
        
        
        // 运算符函数。Swift 的String类型定义了关于大于号 (>) 的字符串实现，其作为一个函数接受两个String类型的参数并返回Bool类型的值。 而这正好与sort(_:)方法的第二个参数需要的函数类型相符合。 因此，您可以简单地传递一个大于号，Swift可以自动推断出您想使用大于号的字符串函数实现：
        let reversed03 = names.sort(>)
        print(reversed03)
        
        // 尾随闭包，即{}部分放在()之后。
        let reversed04 = names.sort() {
            $0 > $1
        }
        print(reversed04)
        
        
        // 捕获值？？没有搞清楚
        /*
        闭包可以在其定义的上下文中捕获常量或变量。
        即使定义这些常量和变量的原域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
        Swift最简单的闭包形式是嵌套函数，也就是定义在其他函数的函数体内的函数。
        嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。
        */
        func makeIncrementor(forIncrement amount:Int) -> () -> Int
        {
            var runningTotal = 0
            func incrementor() -> Int
            {
                runningTotal += amount
                return runningTotal
            }
            return incrementor
        }
        
        let resversed05 = makeIncrementor(forIncrement: 10)
        print(resversed05)
        
        
        // block 函数
        self.blockHandle {
            () -> Void in
            print("block方法：没有参数的……")
        }

        self.resultImageUrl(url: "http://www.hao123.com") {
            (url:NSURL) -> Void in
            print("url is \(url)")
        }
        
        // block属性
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "block", style: .Done, target: self, action: Selector("blockClick"))
        self.blockTarget = {
            text -> Void in
            print("text = \(text)")
        }
        self.blockAction = {
            text -> Void in
            print("action = \(text)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {

    }
    
    
    // MARK: - block函数
    // 传入两个整形数，输出这个两个数之和，加上这两个数之积，得到的结果
//    func resultNumber(number1 a:Int, number2 b:Int, handle:() -> Int)
//    {
//        return a + b + (a * b)
//    }
    
    // 无参数
    func blockHandle(handle:(Void) -> Void)
    {
        print("block方法：没有参数的……")
        handle()
    }
    
    // 带参数
    func resultImageUrl(url url:String, handle:(NSURL) -> Void)
    {
        let nsurl = NSURL(string: url)
        print("NSURL = \(nsurl)")
        handle(nsurl!)
    }
    
    // 属性
    func blockClick()
    {
        self.blockTarget?("block click")
        
        self.blockAction?("black action")
    }

}

