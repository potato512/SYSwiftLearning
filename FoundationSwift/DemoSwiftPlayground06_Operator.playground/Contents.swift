//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
运算符是一个符号，用于告诉编译器执行一个数学或逻辑运算。
Swift 提供了以下几种运算符：算术运算符、比较运算符、逻辑运算符、位运算符、赋值运算符、区间运算符
*/


// 算术运算符：
var num011:Int = 10
var num012:Int = 4
var numResult:Int?

// + 加号
numResult = num011 + num012
print(numResult)

// − 减号
numResult = num011 - num012
print(numResult)

// * 乘号
numResult = num011 * num012
print(numResult)

// / 除号
numResult = num011 / num012
print(numResult)

// % 求余
numResult = num011 % num012
print(numResult)

// ++ 自增
print(num011)
num011++
print(num011)
++num011
print(num011)

// -- 自减
print(num012)
num012--
print(num012)
--num012
print(num012)


// 比较运算符：
let num021 = 10
let num022 = 5

// == 等于
print("\(num021) == \(num022) 的结果为：\(num021 == num022)")

// != 不等于
print("\(num021) != \(num022) 的结果为：\(num021 != num022)")

// > 大于
print("\(num021) > \(num022) 的结果为：\(num021 > num022)")

// < 小于
print("\(num021) < \(num022) 的结果为：\(num021 < num022)")

// >= 大于等于
print("\(num021) >= \(num022) 的结果为：\(num021 >= num022)")

// <= 小于等于
print("\(num021) <= \(num022) 的结果为：\(num021 <= num022)")


// 逻辑运算符（参数类型必须为bool布尔值类型）
let num031 = true
let num032 = false

// && 逻辑与，左右两边同时成立
print("\(num031) && \(num032) 的结果为：\(num031 && num032)")

// || 逻辑或，左右两边至少一边成立
print("\(num031) || \(num032) 的结果为：\(num031 || num032)")

// ! 逻辑非，取反
print("!\(num031) 的结果为：\(!num031)")


// 位运算符（对二进制进行操作）
let num041 = 60 // 0011 1100
let num042 = 13 // 0000 1101

// & 按位与
print("\(num041) & \(num042) 的结果为：\(num041 & num042)")

// | 按位或
print("\(num041) | \(num042) 的结果为：\(num041 | num042)")

// ^ 按位异或
print("\(num041) ^ \(num042) 的结果为：\(num041 ^ num042)")

// ~ 按位取反
print("~\(num041) 的结果为：\(~num041)")

// << 左移
print("\(num041) << \(num042) 的结果为：\(num041 << num042)")

// >> 右移
print("\(num041) >> \(num042) 的结果为：\(num041 >> num042)")


// 赋值运算符
var num051 = 5
var num052 = 3
var num053:Int

// = 简单的赋值运算，指定右边操作数赋值给左边的操作数
num053 = num051 + num052
print("num053 = \(num053)")

// += 相加后再赋值，将左右两边的操作数相加后再赋值给左边的操作数
num053 += num051
print("num053 = \(num053)")

// -= 相减后再赋值，将左右两边的操作数相减后再赋值给左边的操作数
num053 -= num052
print("num053 = \(num053)")

// *= 相乘后再赋值，将左右两边的操作数相乘后再赋值给左边的操作数
num053 *= num051
print("num053 = \(num053)")

// /= 相除后再赋值，将左右两边的操作数相除后再赋值给左边的操作数
num053 /= num052
print("num053 = \(num053)")

// %= 求余后再赋值，将左右两边的操作数求余后再赋值给左边的操作数
num053 %= num051
print("num053 = \(num053)")

// <<= 按位左移后再赋值
num053 <<= num051
print("num053 = \(num053)")

// >>= 按位右移后再赋值
num053 >>= num051
print("num053 = \(num053)")

// &= 按位与运算后赋值
num053 &= num051
print("num053 = \(num053)")

// ^= 按位异或运算符后再赋值
num053 ^= num051
print("num053 = \(num053)")

// |= 按位或运算后再赋值
num053 |= num051
print("num053 = \(num053)")



// 区间运算符
// 闭区间运算符：(a...b)，如(1...5)，表示区间值1,2,3,4,5
for i in 1...10
{
    print("index = \(i)")
}

// 半开区间运算符：(a..<b)，如(1..<5)，表示区间值1,2,3,4
for i in 1..<5
{
    print("index = \(i)")
}


// 其他运算符
var num071 = 5
var num072:Int

//（1）一元减：(-n)，如(-1)
num072 = -num071
print("num072 = \(num072)")

//（2）一元加：(+n)，如(+1)
num072 = +num071
print("num072 = \(num072)")

//（3）三元运算符：(条件?语句1:语句2)，如(1 > 0 ? yes : no)
print("(\(num071) > 0 ? YES : NO) = \(num071 > 0 ? "YES" : "NO")")


// 运算符优先级
// 1、指针最优，单目运算优于双目运算。如正负号。
// 2、先乘除（模），后加减。
// 3、先算术运算，后移位运算，最后位运算。
// 请特别注意：1 << 3 + 2 & 7 等价于 (1 << (3 + 2)) & 7
// 4、逻辑运算最后计算












