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



#### 元组
* 独立的值组合起来的一种数据类型
* 元组中每一种值的类型不一定相同
* 

~~~ javascript
let httpError = (404, "Not Found")

// 或
var serverStatus = (true, "connected")
serverStaus = (false, "can't connected")
~~~