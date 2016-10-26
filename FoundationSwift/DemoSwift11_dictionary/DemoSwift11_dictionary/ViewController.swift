//
//  ViewController.swift
//  DemoSwift11_dictionary
//
//  Created by zhangshaoyu on 16/9/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        Swift 字典
        Swift 字典用来存储无序的相同类型数据的集合，Swift 字典会强制检测元素的类型，如果类型不同则会报错。
        Swift 字典每个值（value）都关联唯一的键（key），键作为字典中的这个值数据的标识符。
        和数组中的数据项不同，字典中的数据项并没有具体顺序。我们在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样。
        Swift 字典的key没有类型限制可以是整型或字符串，但必须是唯一的。
        如果创建一个字典，并赋值给一个变量，则创建的字典就是可以修改的。这意味着在创建字典后，可以通过添加、删除、修改的方式改变字典里的项目。如果将一个字典赋值给常量，字典就不可修改，并且字典的大小和内容都不可以修改。
        
        */
        
        // 创建字典
        // 创建一个特定类型的空字典，格式为：var dict = [KeyType: ValueType]()
        // 创建一个空字典，键的类型为 Int，值的类型为 String 的简单语法：
        var dict01 = [Int: String]()
        print(dict01)
        
        // 创建一个字典的实例：
        var dict02 :[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        print(dict02)
        
        var dict03 = ["name":"DevZhang", "job":"iOSDev", "company":"VSTECS"]
        print(dict03)
        
        // 访问字典
        // 我们可以根据字典的索引来访问数组的元素，语法如下：var value = dict[key]
        let value01 = dict02[1]
        print(value01)
        
        let value02 = dict03["name"]
        print(value02)
        
        // 添加数据
        let value03 = dict02.updateValue("Four", forKey: 4)
        print(value03)
        print(dict02)
        
        // 修改字典
        // 方法1 使用 updateValue(forKey:) 增加或更新字典的内容。如果 key 不存在，则添加值，如果存在则修改 key 对应的值。格式为：dict.updateValue(value, forKey:key)方法返回Optional值。
        var value04 = dict02.updateValue("TwoTmp", forKey: 2)
        print(dict02)
        print(value04)
 
        // 方法2 通过指定的 key 来修改字典的值
        var value05 = dict02[3]
        print(value05)
        value05 = "ThreeTmp" // 修改无效
        print(dict02)
        dict02[3] = "ThreeTmp" // 修改有效
        print(dict02)
        
        
        
        // 移除 Key-Value 对
        // 1 使用 removeValueForKey() 方法来移除字典 key-value 对。如果 key 存在该方法返回移除的值，如果不存在返回 nil 。
        let valueRemove01 = dict02.removeValueForKey(2)
        print(valueRemove01)
        print(dict02)
        
        // 2 通过指定键的值为 nil 来移除 key-value（键-值）对。
        dict02[1] = nil
        print(dict02)
        
        
        // 遍历字典
        // 1 使用 for-in 循环来遍历某个字典中的键值对。
        for (key, value) in dict03
        {
            print("字典 key \(key) -  字典 value \(value)")
        }
        
        // 2 使用enumerate()方法来进行字典遍历，返回的是字典的索引及 (key, value) 对
        for (key, value) in dict03.enumerate()
        {
            print("字典 key \(key) -  字典 (key, value) 对 \(value)")
        }

        // 3 
        for key in dict03.keys
        {
            let value = dict03[key]
            print("key = \(key), value = \(value)")
        }
        
        
        // 字典转换为数组
        // 提取字典的键值(key-value)对，并转换为独立的数组。
        let dictKeys = [String](dict03.keys)
        for (key) in dictKeys
        {
            print("\(key)")
        }
        
        let dictValues = [String](dict03.values)
        for (value) in dictValues
        {
            print("\(value)")
        }

        
        
        // 其他属性
        // count 属性
        let count01 = dict03.count
        print(count01)

        // isEmpty 属性
        let empty01 = dict01.isEmpty
        print("dict01 is \(empty01)")
        
        let empty02 = dict03.isEmpty
        print("dict03 is \(empty02)")
    


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

