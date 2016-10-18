//
//  PopViewController2.swift
//  DemoSwift201_UIViewController
//
//  Created by zhangshaoyu on 16/10/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class PopViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 标题
        self.navigationItem.title = "PopViewController2"
        
        // 视图自适度
        self.autoSize()
        
        // 返回按钮
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "back", style: UIBarButtonItemStyle.Done, target: self, action: Selector("backClick"))
        
        // 进入下个视图控制器
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "push", style: UIBarButtonItemStyle.Done, target: self, action: Selector("pushClick"))
        
        
        // 是否是根视图控制器
        let isRoot = self.isRootViewController
        print("\(self) 是根视图控制器吗？(\(isRoot))")
        
        // 视图控制器索引下标
        let index = self.indexViewController
        print("\(self) 是第 \(index) 个视图控制器")

        self.setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor.yellowColor()
    }
    
    func setUI()
    {
        let label = UILabel(frame: CGRectMake(10.0,10.0,200.0,20.0))
        label.backgroundColor = UIColor.greenColor()
        label.text = "view controller 2"
        self.view.addSubview(label)
    }
    
    func backClick()
    {
        print("back Click")
        
        // 返回上一个视图控制器
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    func pushClick()
    {
        print("push Click")
        
        // 进入下个视图控制器
        let nextVC = PopViewController3()
        self.navigationController!.pushViewController(nextVC, animated: true)
    }

}
