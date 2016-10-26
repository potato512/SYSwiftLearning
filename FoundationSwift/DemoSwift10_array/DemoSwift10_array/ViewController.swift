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
        */
        
        
        // 创建数组
        // 空数组
        let arrayTmp01 = Array<String>()
        print(arrayTmp01)
        
        let arrayTmp02 = [String]()
        print(arrayTmp02)
        
        let arrayTmp03:Array<String> = []
        print(arrayTmp03)
        
        
        // 数组清空
        var arrayTmp04 = ["1", "2"]
        print(arrayTmp04)
        
        arrayTmp04 = []
        print(arrayTmp04)
        
        arrayTmp04 = ["1", "2"]
        print(arrayTmp04)
        
        arrayTmp04 = Array<String>()
        print(arrayTmp04)
        
        
        // 带初始值的数组
        let array01:[Int] = [1,2,3,4,5]
        print(array01)
        
        let array02 = ["1", "2", "3"]
        print(array02)
        
        let array03 = [array01, array02]
        print(array03)
        
        
        
        
        
        // 读取数组元素值
        let value01 = array01[0]
        print(value01)
        
        let value02 = array01.indexOf(1)
        print(value02)
        
        for value in array01
        {
            print("value = \(value)")
        }
        
        for var index = 0; index < array01.count; index++
        {
            let value = array01[index]
            print("index = \(index), value = \(value)")
        }
        
        for i in 0..<array01.count
        {
            print(array01[i])
        }
        
        for (index, item) in array01.enumerate()
        {
            print("在 index = \(index) 位置上的值为 \(item)")
        }
        
        
        // 修改数组
        var array04 = [10,20,30]
        // 添加元素（添加到最后）
        array04.append(100) // 单个元素
        print(array04)
        array04 = array04 + [200] // 元素数组
        print(array04)
        array04.appendContentsOf([201,202]) // 元素集合
        print(array04)
        array04.appendContentsOf(203...210) // 元素序列
        print(array04)
        // 添加元素（添加到指定位置）
        array04.insert(500, atIndex: 2)
        print(array04)
        
        // 修改元素
        array04[4] = 300
        print(array04)
        
        // 删除元素
        array04.removeFirst()
        print(array04)
        
        array04.removeLast()
        print(array04)
        
        array04.removeAtIndex(0)
        print(array04)
        
        array04.removeAll()
        print(array04)
        
        // 合并数组（注意：数组类型必须一致）
        array04 = array01 + [100,200,300]
        print(array04)
        
        
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
        
        // 第一个元素
        let item01 = array04.first
        print(item01)
        
        // 最后一个元素
        let item02 = array04.last
        print(item02)
        
        // 是否包含某个元素
        let contant1:Bool = array01.contains(1)
        print("array01 \(contant1) 包含 1")
        
        // 数组转字符串
//        let string01 = array01.joinWithSeparator(":")
//        print(string01)
        
        
//        let swiftStringArr: String[] = ["1", "2"]
//        let nsArray: NSArray = swiftStringArr
//        let objArray: AnyObject[] = nsArray as Array //as Array会转换为AnyObject数组
//        let strArray: String[] = objArray as String[]
        
        
        
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

