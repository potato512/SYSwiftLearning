//
//  ErrorVC.swift
//  DemoSwift313_Error
//
//  Created by herman on 2017/6/9.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ErrorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "异常"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "click", style: .Done, target: self, action: Selector("buttonClick"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
    }

    func buttonClick()
    {
        let person = Person.init(name: "xiaoMing")
        
        // 方法1 使用try?通过将错误转换成一个可选值来处理错误。如果在评估try?表达式时一个错误被抛出，那么表达式的值就是nil
//        let result = try? person.buyDrinks(itemNamed: "milk", price: 135.21, count: 10)
//        print(result)
        
        // 方法2 try!来禁用错误传递，这会把调用包装在一个不会有错误抛出的运行时断言中。如果真的抛出了错误，你会得到一个运行时错误。
//        let result = try! person.buyDrinks(itemNamed: "milk", price: 135.21, count: 10)
//        print(result)
        
        // 方法3 Do-Catch处理错误，在do子句中的代码抛出了一个错误，这个错误会与catch子句做匹配，从而决定哪条子句能处理它。
        do {
            try person.buyDrinks(itemNamed: "milk", price: 135.21, count: 10)
            print("买到饮料了...")
        } catch BuyDrinksError.moneyError {
            print("\(person.name)买饮料的钱不够...")
        } catch BuyDrinksError.selectionError {
            print("\(person.name)要买的饮料没有了...")
        } catch BuyDrinksError.strokError {
            print("\(person.name)要买的饮料没有那么多了...")
        }
        
        // 方法4

    }

    
    
}
