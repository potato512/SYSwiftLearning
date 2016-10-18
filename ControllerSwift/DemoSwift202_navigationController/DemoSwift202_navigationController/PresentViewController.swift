//
//  PresentViewController.swift
//  DemoSwift202_navigationController
//
//  Created by zhangshaoyu on 16/10/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        self.navigationItem.title = "presentViewController"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancel", style: .Done, target: self, action: Selector("cancelClick"))
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

    func cancelClick()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
