//
//  ViewController.swift
//  DemoSwift10_array
//
//  Created by zhangshaoyu on 16/9/13.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        Swift 数组
        数组使用有序列表存储同一类型的多个值，且相同的值可以多次出现在一个数组的不同位置中。
        数组会强制检测元素的类型，如果类型不同则会报错，Swift 数组应该遵循像Array<Element>这样的形式，其中Element是这个数组中唯一允许存在的数据类型。
        如果创建一个数组，并赋值给一个变量，则创建的集合就是可以修改的。这意味着在创建数组后，可以通过添加、删除、修改的方式改变数组里的项目。如果将一个数组赋值给常量，数组就不可更改，并且数组的大小和内容都不可以修改。
        
        使用注意事项：
        1、数组的元素类型必须是统一的
        2、数组的元素是有序的，即有顺序
        
        */
        
        
        // 创建数组
        // 初始化 无值
        let arrayTmp01 = Array<String>()
        print(arrayTmp01)
        
        let arrayTmp02 = [String]()
        print(arrayTmp02)
        
        let arrayTmp03:Array<String> = []
        print(arrayTmp03)
        
        let arrayTmp04:[String] = []
        print(arrayTmp04)
        
        // 初始化 有值
        let array01:[Int] = [1,2,3,4,5]
        print(array01)
        
        let array02 = ["1", "2", "3"]
        print(array02)
        
        let array03 = [array01, array02]
        print(array03)
        
        let array04 = Array(count: 3, repeatedValue: 0)
        print("array04 = \(array04)")
        
        
        // 数组清空
        var arrayTmp05:[String] = ["1", "2"]
        print(arrayTmp05)
        // 1 赋空值
        arrayTmp05 = []
        arrayTmp05 = Array<String>()
        // 2 删除所有值
        arrayTmp05.removeAll()
        
        print(arrayTmp04)
        
        

        
        // 数组的操作
        
        // 读取数组元素值
        
        // 第一个元素
        let item01 = array01.first
        print(item01)
        
        // 最后一个元素
        let item02 = array01.last
        print(item02)
        
        // 1 使用下标
        let value01 = array01[0]
        print(value01)
        
        let value02 = array01.indexOf(1)
        print(value02)
        
        // 数组的遍历
        // 1 遍历
        for value in array01
        {
            print("value = \(value)")
        }
        
        // 2 遍历+下标
        for var index = 0; index < array01.count; index++
        {
            let value = array01[index]
            print("index = \(index), value = \(value)")
        }
        
        // 3 闭区间遍历
        for i in 0..<array01.count
        {
            print(array01[i])
        }
        
        // 4 元组遍历
        for (index, item) in array01.enumerate()
        {
            print("在 index = \(index) 位置上的值为 \(item)")
        }
        
        
        
        // 可变数组的操作
        var array05 = [10, 20, 30]
        // 添加元素（添加到最后）
        array05.append(100) // 单个元素
        print(array05)
        array05 = array05 + [200, 200, 200] // 元素数组
        print(array05)
        array05 += [200, 200, 200] // 元素数组
        print(array05)
        array05.appendContentsOf([201,202]) // 元素集合
        print(array05)
        array05.appendContentsOf(203...210) // 元素序列
        print(array04)
        // 添加元素（添加到指定位置）
        array05.insert(500, atIndex: 2)
        print(array05)
        
        
        // 修改元素
        array05[4] = 300
        print(array05)
        
        
        // 删除元素
        array05.removeFirst() // 删除首个元素
        print(array05)
        
        array05.removeLast() // 删除尾部元素
        print(array05)
        
        array05.removeAtIndex(0) // 删除指定下标元素
        print(array05)
        
        array05.removeAll() // 删除所有元素
        print(array05)
        
        array05.removeAll(keepCapacity: true) // 保持数组容量
        print(array05.capacity)
        
        
        // 合并数组（注意：数组类型必须一致）
        array05 = array01 + [100,200,300]
        print(array05)
        
        
        // 其他属性
        
        // 类型判断
        var isArray:Bool = array01 is Array
        if isArray
        {
            print("array01 is array class")
        }
        else
        {
            print("array01 is not array class")
        }
        
        
        // 数组元素个数
        let count01 = array04.count
        print(count01)
        
        // 判断数组是否为空
        let isValid = array04.isEmpty
        print(isValid)
        
        
        
        // 是否包含某个元素
        let contant1:Bool = array01.contains(1)
        print("array01 \(contant1) 包含 1")
        
        // 数组转字符串
        let string01Mark:String = "-";
        let string01:String = array02.joinWithSeparator(string01Mark)
        print("数组转字符串：\(string01)")
        let arrayString:Array = string01.componentsSeparatedByString(string01Mark)
        print("字符串转数组：\(arrayString)")
        
   
        
        
        
        
        // 数组排序（注意：$0, $1(从0开始，表示第i个参数...)）
        let arraySort = array04.sort({(n1:Int, n2:Int) -> Bool in
            // 从小到大
//            return n2 > n1
            
            // 从大到小
            return n2 < n1
        })
        print(arraySort)
        
        let arraySort02 = array04.sort({
            // 从小到大
//            return $1 > $0
            
            // 从大到小
            return $1 < $0
        })
        print(arraySort02)
        
        let arraySort03 = array04.sort(){
            // 从小到大
//            $1 > $0
            
            // 从大到小
            $1 < $0
        }
        print(arraySort03)
        
        
        
        // 数组批量操作
        var arrayBatch01 = [1,2,3,4,5]
        print("1 批量修改：\(arrayBatch01)")
        arrayBatch01[1...2] = [8,8]
        print("2 批量修改：\(arrayBatch01)")
        arrayBatch01.replaceRange(Range(start: 3, end: 4), with: [10,10])
        print("3 批量修改：\(arrayBatch01)")
        
        
        
        // 补充：Any类型元素，或AnyObject类型元素的数组
        // 方法selector
        func buttonClick() -> Void
        {
            print("点击")
        }
        print(buttonClick)
        
        // AnyObject任意类型元素的数组（不包含方法selector）
        let arrayAnyObject01:Array<AnyObject> = [[1,2,3,4], "DevZhang", 30]
        print(arrayAnyObject01)
        
        // Any任意类型元素的数组（包含方法selector）
        let arrayAnyObject02:Array<Any> = [["name":"devZhang", "age":30, "job":"iOSDev"], "DevZhang", 30, buttonClick()]
        print(arrayAnyObject02)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

