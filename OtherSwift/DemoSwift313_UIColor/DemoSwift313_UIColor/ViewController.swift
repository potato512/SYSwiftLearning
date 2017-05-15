//
//  ViewController.swift
//  DemoSwift313_UIColor
//
//  Created by zhangshaoyu on 17/5/15.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "UIColor";
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "test", style: .Done, target: self, action: Selector("setUI"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func setUI()
    {
        for (var index: Int = 0; index < self.view.subviews.count; index++)
        {
            let subView: UIView = self.view.subviews[index];
            subView.removeFromSuperview()
        }
        
        let randomView = UIView.init(frame: CGRectMake(10.0, 80.0, 60.0, 20.0))
        self.view.addSubview(randomView);
        randomView.backgroundColor = UIColorTools.UIColorRandom()
        
        let hexAlphaView = UIView.init(frame: CGRectMake(10.0, 120.0, 60.0, 60.0))
        self.view.addSubview(hexAlphaView);
        hexAlphaView.backgroundColor = UIColorTools.UIColorHex_Alpha(0xadaddf, alpha: 0.3)
        
        let hexView = UIView.init(frame: CGRectMake(80.0, 120.0, 60.0, 60.0))
        self.view.addSubview(hexView);
        hexView.backgroundColor = UIColorTools.UIColorHex(0x663215)
        
        let rgbAlphaView = UIView.init(frame: CGRectMake(10.0, 200.0, 30.0, 30.0))
        self.view.addSubview(rgbAlphaView);
        rgbAlphaView.backgroundColor = UIColorTools.UIColorRGB_Alpha(200.0, G: 230.0, B: 25.0, alpha: 0.5);
        
        let rgbView = UIView.init(frame: CGRectMake(50.0, 200.0, 30.0, 30.0))
        self.view.addSubview(rgbView);
        rgbView.backgroundColor = UIColorTools.UIColorRGB(20.0, G: 15.3, B: 55.0)
        
        
    }
}

