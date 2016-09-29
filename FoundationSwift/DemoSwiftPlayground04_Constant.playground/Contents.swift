//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
常量一旦设定，在程序运行时就无法改变其值。
常量可以是任何的数据类型如：整型常量，浮点型常量，字符常量或字符串常量。同样也有枚举类型的常量：
常量类似于变量，区别在于常量的值一旦设定就不能改变，而变量的值可以随意更改。
常量声明：常量使用关键字 let 来声明，而变量使用关键字 var 来声明

常量的命名
1、可以由字母，数字和下划线组成。
2、常量需要以字母或下划线开始。
3、区分大小写，所以字母大写与小写是不一样的。

*/

// 定义整型常量
let age:Int = 30
print("age = \(age)")

// 定义浮点型常量
let money = 199.34
print(money)

for i in 1...10
{
    print(i)
}