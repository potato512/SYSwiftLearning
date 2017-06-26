//
//  ViewController.swift
//  DemoSwift_2048
//
//  Created by zhangshaoyu on 17/5/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "2048"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "start", style: .Done, target: self, action: Selector("startClick"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = .None
        }
    }

    func startClick()
    {
        let alertView = UIAlertView()
        alertView.title = "开始！"
        alertView.message = "游戏就要开始，你准备好了吗？"
        alertView.addButtonWithTitle("Ready Go!")
        alertView.addButtonWithTitle("Cancel")
        alertView.delegate = self
        alertView.show()
    }

    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        print("click \(buttonIndex)")
        
        let nextVC = MainViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)        
//        self.presentViewController(nextVC, animated: true, completion: nil)
    }
}

