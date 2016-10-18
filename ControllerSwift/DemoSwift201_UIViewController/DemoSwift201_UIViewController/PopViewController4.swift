//
//  PopViewController4.swift
//  DemoSwift201_UIViewController
//
//  Created by zhangshaoyu on 16/10/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class PopViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 标题
        self.navigationItem.title = "PopViewController4"
        
        // 视图自适度
        self.autoSize()
        
        // 返回指定视图控制器
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back2", style: UIBarButtonItemStyle.Done, target: self, action: Selector("backClick"))
        
        // 是否是根视图控制器
        let isRoot = self.isRootViewController
        print("\(self) 是根视图控制器吗？(\(isRoot))")
        
        // 视图控制器索引下标
        let index = self.indexViewController
        print("\(self) 是第 \(index) 个视图控制器")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor.greenColor()
    }
    
    func backClick()
    {
        print("back Click")
        
        // 返回指定视图控制器
        let indexVC = self.navigationController!.viewControllers[2]
        self.navigationController!.popToViewController(indexVC, animated: true)
    }

}
