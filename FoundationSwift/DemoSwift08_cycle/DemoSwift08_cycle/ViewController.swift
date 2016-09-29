//
//  ViewController.swift
//  DemoSwift08_cycle
//
//  Created by zhangshaoyu on 16/9/12.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*
        swift中的循环语句主要有以下几种类型
        1、for语句，遍历一个集合里面的所有元素，例如由数字表示的区间、数组中的元素、字符串中的字符。
        2、for...in语句，用来重复执行一系列语句直到达成特定条件达成，一般通过在每次循环完成后增加计数器的值来实现。
        3、while语句，运行一系列语句，如果条件为true，会重复运行，直到条件变为false。
        4、repeat...while语句，类似 while 语句区别在于判断循环条件之前，先执行一次循环的代码块。
        
        注意事项：在循环语句中，可以通过continue语句，或break语句，或fallthrough语句改变代码的执行顺序。
        1、continue语句，告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。
        2、break语句，中断当前循环。
        3、fallthrough语句，如果在一个case执行完后，继续执行下面的case，需要使用fallthrough(贯穿)关键字。
        */
        
        
        for index in 1...5
        {
            print("index = \(index)")
        }
        print("")
        // 或
        for index in 1..<5
        {
            print("index = \(index)")
        }
        print("")
        // 或
        let indexs = ["1", "2", "3", "4"]
        for index in indexs
        {
            print("index = \(index)")
        }
        print("")
        // 或
        let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        for (animalName, legCount) in numberOfLegs
        {
            print("\(animalName)s have \(legCount) legs")
        }
        print("")
        // 或
        let name = "Devzhang"
        for nameChar in name.characters
        {
            print("nameChar = \(nameChar)")
        }
        print("")
        for var index = 1; index < 10; index++
        {
            print("index = \(index)")
            
            if index == 2
            {
                print("index = 2 要重新开始")
                index = 4
                continue;
            }
            
            if index == 8
            {
                print("index = 8 要退出循环")
                break
            }
        }
        print("")
        
        var num = 0
        while num < 20
        {
            print("num = \(num)")
            num++
        }
        print("")
        
        num = 2
        repeat
        {
            print("num = \(num)")
            num++
        }
        while num < 1
        print("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

