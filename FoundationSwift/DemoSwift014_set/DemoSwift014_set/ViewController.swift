//
//  ViewController.swift
//  DemoSwift014_set
//
//  Created by zhangshaoyu on 16/9/19.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        集合（Sets）
        
        集合(Set)用来存储相同类型并且没有确定顺序的值，且每个值只出现一次。
        
        为了存储在集合中，该类型必须是可哈希化的。也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是Int类型的，它和其他的对象相同，其被用来比较相等与否，比如a==b，它遵循的是a.hashValue == b.hashValue。
        Swift 的所有基本类型(比如String,Int,Double和Bool)默认都是可哈希化的，它可以作为集合的值或者字典的键值类型。没有关联值的枚举成员值(在枚举有讲述)默认也是可哈希化的。
        
        使用自定义的类型作为集合的值或者是字典的键值类型时，需要使自定义类型服从Swift标准库中的Hashable协议。服从Hashable协议的类型需要提供一个类型为Int的取值访问器属性hashValue。这个由类型的hashValue返回的值不需要在同一程序的不同执行周期或者不同程序之间保持相同。 因为hashable协议服从于Equatable协议，所以遵循该协议的类型也必须提供一个”是否等”运算符(\==)的实现。这个Equatable协议需要任何遵循的\==的实现都是一种相等的关系。也就是说，对于a,b,c三个值来说，\==的实现必须满足下面三种情况：
        1 a\==a(自反性)
        2 a\==b 可推出 b\==a(对称性)
        3 a\==b&&b\==c 可推出 a\==c(传递性)
        
        */
        
        
        // 初始化集合（Initializing An Empty Set）
        // 1 空集合
        var emptySet = Set<Int>()
        print(emptySet)
        // 2
        emptySet = []
        print(emptySet)
        // 3 用数组构造集合
        let set01:Set<String> = ["1", "2"]
        print(set01)
        // 4 如果元素都是相同类型，带有初始化，可以省略类型
        let set02:Set = ["101", "102"]
        print(set02)
        // 5 重复的数据会被自动去重
        var set03:Set<String> = ["1", "2", "3", "1"]
        print(set03)
        
        
        
        // 集合的操作
        
        // 1 添加元素
        set03.insert("10")
        print(set03)
        
        // 2 修改元素
        
        // 3 获取元素
        let value01 = set03[set03.startIndex.advancedBy(1)]
        print(value01)
        
        let value02 = set03.maxElement()
        print("最大值 \(value02)")
        let value03 = set03.minElement()
        print("最小值 \(value03)")

        // 4 删除元素
        set03.removeFirst()
        print("删除第一个元素")
        
        set03.remove("1")
        print("删除元素 1")
        print(set03)
        
        set03.removeAll()
        print("删除全部元素")
        
        set03 = ["1", "2", "3", "1", "4", "5", "6"]

        
        
        // 集合的其他属性
        
        // 1 是否包含其他元素
        let isContant = set03.contains("1")
        print(isContant)
        
        // 2 集合的个数
        let count = set03.count
        print(count)
        
        // 3 是否空集合
        let isEmptyTrue = set03.isEmpty
        print(isEmptyTrue)
        
        let isEmptyTrue02 = emptySet.isEmpty
        print(isEmptyTrue02)
        
        print("set01 = \(set01)")
        print("set03 = \(set03)")
        
        
        
        
        // 集合的集操作
        // 1 交集：使用intersect(_:)方法根据两个集合中都包含的值创建的一个新的集合
        let set04 = set01.intersect(set03)
        print("交集 \(set04)")
        
        // 2 非交集：使用exclusiveOr(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合
        let set05 = set01.exclusiveOr(set03)
        print("非交集 \(set05)")
        
        // 3 并集：使用union(_:)方法根据两个集合的值创建一个新的集合
        let set06 = set01.union(set03)
        print("并集 \(set06)")
        
        // 4 差集：使用subtract(_:)方法根据不在该集合中的值创建一个新的集合
        let set07 = set01.subtract(set03)
        print("差集 \(set07)")
        
        // 5 两个集合是否相等，使用\==来判断
        var isTrue01 = (set01 == set03)
        print(isTrue01)
        
        // 6 是否为子集，使用isSubsetOf(_:)方法来判断
        isTrue01 = set03.isSubsetOf(set01)
        print(isTrue01)
        
        // 7 是否为超集，使用isSupersetOf(_:)方法来判断
        isTrue01 = set03.isSupersetOf(set01)
        print(isTrue01)
        
        // 8 使用isStrictSubsetOf(_:)或者isStrictSupersetOf(_:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
        isTrue01 = set03.isStrictSubsetOf(set01)
        print(isTrue01)
        
        isTrue01 = set03.isStrictSupersetOf(set01)
        print(isTrue01)
        
        // 9 使用isDisjointWith(_:)方法来判断两个集合是否不含有相同的值。
        isTrue01 = set03.isDisjointWith(set01)
        print(isTrue01)
        
        
        
        
        // 集合的遍历
        // 1 遍历 for-in 语法
        for value in set03
        {
            print(value)
        }

        // 2 有序 指定排序sort方法
        for value in set03.sort({
            (value1, value2) -> Bool in
            
            // 由我们指定排序类型desc（降序）
            return value1 > value2
        })
        {
            print(value)
        }
        
        // 3 直接使用sort无参数（默认为asc升序）
        for value in set03.sort()
        {
            print(value)
        }

        for var i = set03.startIndex; i != set03.endIndex; i = i.successor()
        {
            print("for-i-in" + set03[i])
        }
        
        
        
        // set与array的转换
        // array转换成set
        let array10:Array<String> = ["1","1","1","2"];
        print(array10)
        let set10:Set<String> = Set(array10)
        print(set10)
        // set转换成array
        let set11:Set<String> = ["1","2","3","4"];
        print(set11)
        let array11 = Array(set11)
        print(array11)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

