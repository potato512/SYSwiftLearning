//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
变量输出
变量和常量可以使用 print（swift 2 将 print 替换了 println） 函数来输出。
在字符串中可以使用括号" () "与反斜线" \ "来插入变量，即" \(变量名称) "

变量输出有两种格式
1、直接使用变量名称
2、在字符串中结合" \(变量名称) "，以参数的形式

*/

// 直接使用变量名称输出
var lastName = "shaoyu"
print(lastName)

var firstName = "zhang"
print(firstName)

// 在字符串中以参数形式输出
print("你的名称是：\(firstName)\(lastName)")

var myAge:Int = 33
print("我的年龄是 \(myAge) 岁")
