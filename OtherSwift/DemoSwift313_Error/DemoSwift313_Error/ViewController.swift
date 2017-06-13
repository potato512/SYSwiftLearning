//
//  ViewController.swift
//  DemoSwift313_Error
//
//  Created by herman on 2017/6/8.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "error异常处理"
        
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
        let nextVC = ErrorVC()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}


/*
 错误处理（Error handling）是响应错误以及从错误中恢复的过程。
 Swift 提供了在运行时对可恢复错误的抛出、捕获、传递和操作的支持。
 
 使用步骤
 1 定义异常
 2 抛出异常
 3 处理异常
 
 */
