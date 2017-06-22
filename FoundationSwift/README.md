# Foundation

#### 常量与变量
* 常量：初始化之后不能改变
~~~ javascript
let age = 10

// 添加数据类型
let age:Int = 10

// 或
let age = 10 as Int
~~~
* 变量：可以在任何时候随时改变其值
~~~ javascript
var age = 10
age = 11

// 添加数据类型
var age:Int = 10

// 或
var age = 10 as Int
~~~

> 注意：定义变量，或常量时，可使用特殊字符定义变量名称，如中文名称、表情等。
> 
> let 年龄 = 10

###### 基本数据类型：整数类型（Int8/16/32/64、UInt8/16/32/64）、小数类型（Double/Float）

~~~ javascript
let age:Int64 = 10
let class:UInt32 = 3
let hight:Double = 1.64
~~~ 

* 类型转换：格式为"类型(变量)"
~~~ javascript
let age:Int = Int(hight)
let height:Double = Double(age)
~~~

* 类型判断和类型安全：相同类型才能操作
~~~ javascript 

~~~

###### 布尔类型：Bool（true、false；或1、0）

~~~ javascript 
let isValid = true
if isValie
{
    print("是否有效：\(isValid)")
}

let isWront = false

let success = 1
let error = 0

~~~

###### 元组
* 1、元组(tuples)把多个值组合成一个复合值，且元组内的值可以使任意类型，并不要求是相同类型。
* 2、元组的内容可以分解(decompose)成单独的常量和变量
* 3、如果只需要一部分元组值，分解的时候可以把要忽略的部分用下划线(_)标记
* 4、元组中元素的访问，既可以通过定义的变量名称来访问，又可以通过下标来访问（下标：0~N）
* 5、元组为变量时，可以修改该元组的元素值，但元素的类型一定要一致
* 

~~~ javascript
// 定义方法1 未声明参数名称，未声明数据类型
let student = ("devZhang", 65, 98,62)
// 定义方法2 声明参数名称，未声明数据类型
let student2 = (name:"devZhang", math:53, english:82, chinese:65)
// 定义方法3 声明参数名称，声明数据类型
let student3:(String, Int, Int, Int) = (name:"devZhang", math:53, english:82, chinese:65)
// 定义方法4 使用下划线"_"忽略未使用参数
let (name, _, _, _):(String, Int, Int, Int) = ("DevZhang", 45, 91, 71)
~~~
~~~ javascript
// 获取信息
print("\(student), \(student2), \(student3)")

// 方法1 使用下标
print("1 name is \(student.0), math = \(student.1), english = \(student.2), chinese = \(student.3)")
// 方法2 使用参数名称（已声明参数名称，如定义方法2、3）
print("2 name is \(student2.name), math = \(student2.math), english = \(student2.english), chinese = \(student2.chinese)")
// 方法3 使用参数名称（已声明参数名称，但未声明元组变量名称，如定义方法4）
print(name)
~~~

###### 可选值：optionals（两种状态：有值、没有值nil）
* 关键字？表示可选类型，可以有值，也可以没有值
~~~ javascript
let className:String? = "class 8"
if (className != nil)
{
    print("class name is \(className)")
}

// 可选值可以使用有感叹号!进行强制解析，强制解析时必须有值（如果可选值没有值时，强制解包会出现编译进行时异常crash）
let subClassName:String = className!
print("sub class name is \(subClassName)")

// 使用可选绑定（即不声明变量的数据类型），避免强制解包时的异常
if let subClassName2 = className
{
    print(subClassName2)
}
~~~
* 关键字！表示隐式可选类型，避免解包；也可以用来对可选值进行强制解析，必须有值
~~~ javascript
let gladeName:String! = "glade 3"
print(gladeName)

let subGladeName:String = gladeName
print(subGladeName)
~~~

###### 字符和字符串
* 字符类型
* 字符串类型


###### 数学运算：+、-、*、/、%、++、--
~~~ javascript
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

~~~

###### 赋值运算：=、+=、-=、*=、/=、%=
~~~ javascript
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
~~~

###### 关系运算符：>、<、>=、<=、==、!=、?:
~~~ javascript
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

// ?: 三目运算符
let maxNum = num021 > num022 ? num021 : num022
print(maxNum)
~~~

###### 逻辑运算：!、&&、||
~~~ javascript
et num031 = true
let num032 = false

// && 逻辑与，左右两边同时成立
print("\(num031) && \(num032) 的结果为：\(num031 && num032)")

// || 逻辑或，左右两边至少一边成立
print("\(num031) || \(num032) 的结果为：\(num031 || num032)")

// ! 逻辑非，取反
print("!\(num031) 的结果为：\(!num031)")
~~~

###### 区间运算符
* 闭区间运算符：(a...b)，如(1...5)，表示区间值1,2,3,4,5
~~~ javascript
for i in 1...10
{
    print("index = \(i)")
}
~~~
* 半开区间运算符：(a..<b)，如(1..<5)，表示区间值1,2,3,4
~~~ javascript
for i in 1..<10
{
    print("index = \(i)")
}
~~~

###### 位运算符（对二进制进行操作）：&、|、^、<<、>>
~~~ javascript
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
~~~


###### 数组
* 初始化：空值、有初始值
* 数组的遍历
* 数组的操作：
  * 添加元素：添加到尾部、添加到指定下标位置
  * 修改元素：修改指定下标位置
  * 删除元素：删除第一个、删除最后一个、删除指定下标位置、删除全部
  * 读取元素值：获取第一个、获取第二个、获取指定下标位置
* 批量操作：修改元素
* 其他属性：数组个数、数组是否为空
* 数组排序
* 数组与字条串的转换
  * 数组转字符串：componentsSeparatedByString
  * 字符串转数组：joinWithSeparator


###### set
* 初始化：有值（字面量）、无值
* 集合的遍历：有序（指定排序方法）遍历、无序遍历
* 集合的操作：
  * 添加元素：如set.insert(value)
  * 删除元素：如set.removeFirst()、或set.remove(value)、或set.removeAll()
  * 获取元素：如let value = set[set.startIndex.advancedBy(1)]、或let value = set.maxElement()、或let value = set.minElement()
* 集合的集操作：
  * 交集：如let C = A.intersect(B)
  * 非交集：如let C = A.exclusiveOr(B)
  * 并集：如let C = A.union(B)
  * 差集：如let C = A.subtract(B)
  * 是否相等：如let isTrue = (A == B)
  * 是否是子集：如let isTrue = A.isSubsetOf(B)
  * 是否超集：如let isTrue = A.isSupersetOf(B)
  * 一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等：如let isTrue = A.isStrictSubsetOf(B)
  * 含有不同的值：如let isTrue = A.isDisjointWith(B)
* 集合与数组的相互转换
* 集合的其他属性：是否为空、集合元素个数、是否包含某个元素



###### 字典
* 初始化：空值（不可修改）、字面量初始化有值（可修改）
* 字典的遍历
* 字典的操作：
  * 添加元素：通过key添加，如let value = dict.updateValue(value, forKey:key)
  * 修改元素：通过key修改，如dict[key] = value，或let value = dict.updateValue(value, forKey:key)
  * 删除元素：删除指定key对应的值，如let value = dict.removeValueForKey(key)，或dict[key] = nil;
  * 读取元素值：通过key来获取，如let value = dict[key]
* 其他属性：字典个数、字典是否为空



###### 结构语句
* 条件语句
  * if () {}
  * if () {} else {}
  * if () {} else if () {}
  * if () {} else if () {} else {}
* 选择语句：
  * 通常用switch语句替换if语句
  * 判断值既可以是基本数据型，也可以是字符，或字符串
  * 可以不以break结束
  * 可以区间匹配"case n1...n2:"，或"case n1..<n2:"；以及复合匹配"case n1,n2,n3:"
  * switch () {case n1:xxx case:n2,n3,n4:xxx case n5...n7:xxx case n8..<n10:xxx default:xxx}
* 值绑定，同时可结合where判断额外条件，如：
~~~ javascript
let anotherPoint = (2, 0)
switch anotherPoint
{
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
    
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
}
~~~
* 循环语句
  * for语句
  * for (index in n1...n2) {}
  * for (index in n1..<n2) {}
  * for (index in nn) {}
  * for ((n1,n2) in nn) {}
* while语句
  * while () {}
  * repeat {} while ()


###### 基本数据类型：整数类型、小数类型

###### 基本数据类型：整数类型、小数类型


