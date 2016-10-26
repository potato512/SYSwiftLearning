//
//  ViewController.swift
//  DemoSwift015_tuples
//
//  Created by zhangshaoyu on 16/9/21.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        元组是swift中特有一种数据类型
        1、元组(tuples)把多个值组合成一个复合值，且元组内的值可以使任意类型，并不要求是相同类型。
        2、元组的内容可以分解(decompose)成单独的常量和变量
        3、如果只需要一部分元组值，分解的时候可以把要忽略的部分用下划线(_)标记
        4、元组中元素的访问，既可以通过定义的变量名称来访问，又可以通过下标来访问（下标：0~N）
        5、元组为变量时，可以修改该元组的元素值，但元素的类型一定要一致
        
        */
        
        
        // 实例化
        // 方法1 未指定元素变量名称、元素变量类型
        let penson = ("DevZhang", 4, "iOSDev", "shenzhen")
        
        
        let (name, year, job, address) = ("DevZhang", 4, "iOSDev", "shenzhen")
        // 使用下划线"_"忽略未使用参数
        let (name01, _, _, _):(String, Int, String, String) = ("DevZhang", 4, "iOSDev", "shenzhen")
        
        // 方法2 未指定元素变量名称，指定元素变量类型
        let person01:(String, Int, String, String) = ("DevZhang", 4, "iOSDev", "shenzhen")
        
        // 方法3 指定元素变量名称，未指定元素变量类型
        let person02 = (name:"DevZhang", year:4, job:"iOSDev", address:"shenzhen");
        
        // 方法4 指定元素变量名称，指定元素变量类型
        var person03:(String, Int, String, String) = (name:"DevZhang", year:4, job:"iOSDev", address:"shenzhen");
        
        // 读取
        // 方法1 通过下标法读取参数值
        print(penson.0, penson.1, penson.2, penson.3)
        print(person01.0, person01.1, person01.2, person01.3)
        
        // 方法2 通过变量名称读取参数值
        print("\(name), \(year), \(job), \(address)")
        print("\(name01)")
        print(person02.name, person02.year, person02.job, person02.address)
        print(person02.name, person02.year, person02.job, person02.address)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

