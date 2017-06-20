//
//  ViewController.swift
//  DemoSwift05_literals
//
//  Created by zhangshaoyu on 16/9/12.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        /*
        字面量，就是指能够直接了当地指出自己的类型并为变量进行赋值的值
        像特定的数字，字符串或者是布尔值这样。
        包括以下几种：
        1、整型字面量
        整型字面量可以是一个十进制，二进制，八进制或十六进制常量。 二进制前缀为 0b，八进制前缀为 0o，十六进制前缀为 0x，十进制没有前缀
        
        2、浮点型字面量
        浮点型字面量有整数部分，小数点，小数部分及指数部分。
        除非特别指定，浮点型字面量的默认推导类型为 Swift 标准库类型中的 Double，表示64位浮点数。
        浮点型字面量默认用十进制表示（无前缀），也可以用十六进制表示（加前缀 0x）。
        十进制浮点型字面量由十进制数字串后跟小数部分或指数部分（或两者皆有）组成。十进制小数部分由小数点 . 后跟十进制数字串组成。指数部分由大写或小写字母 e 为前缀后跟十进制数字串组成，这串数字表示 e 之前的数量乘以 10 的几次方。例如：1.25e2 表示 1.25 ⨉ 10^2，也就是 125.0；同样，1.25e－2 表示 1.25 ⨉ 10^－2，也就是 0.0125。
        十六进制浮点型字面量由前缀 0x 后跟可选的十六进制小数部分以及十六进制指数部分组成。十六进制小数部分由小数点后跟十六进制数字串组成。指数部分由大写或小写字母 p 为前缀后跟十进制数字串组成，这串数字表示 p 之前的数量乘以 2 的几次方。例如：0xFp2 表示 15 ⨉ 2^2，也就是 60；同样，0xFp-2 表示 15 ⨉ 2^-2，也就是 3.75。
        负的浮点型字面量由一元运算符减号 - 和浮点型字面量组成，例如 -42.5。
        浮点型字面量允许使用下划线 _ 来增强数字的可读性，下划线会被系统忽略，因此不会影响字面量的值。同样地，也可以在数字前加 0，并不会影响字面量的值。
        
        3、字符串型字面量
        字符串型字面量中不能包含未转义的双引号 （"）、未转义的反斜线（\）、回车符或换行符。
        转移字符	含义
        \0	空字符
        \\	反斜线 \
        \b	退格(BS) ，将当前位置移到前一列
        \f	换页(FF)，将当前位置移到下页开头
        \n	换行符
        \r	回车符
        \t	水平制表符
        \v	垂直制表符
        \'	单引号
        \"	双引号
        \000	1到3位八进制数所代表的任意字符
        \xhh...	1到2位十六进制所代表的任意字符
        
        4、布尔型字面量
        关键字：true 表示真；false 表示假；nil 表示没有值。
        
        */
        
        // 整型字面常量
        let age:Int = 10
        print(age)
        
        // 浮点型字面常量
        let money:CGFloat = 103.1231
        print(money)
        
        // 字符串型字面常量
        let name:String = "DevZhang"
        print(name)
        let work:String = "I am \"\(name)\",I am from meizhou"
        print(work)
        
        // 布尔型字面常量
        let isWorking:Bool = false
        print(isWorking)
        let isSleeping:Bool = true
        print(isSleeping)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

