//
//  viewAnimationVC.swift
//  DemoSwift307_animation
//
//  Created by zhangshaoyu on 2017/7/14.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class viewAnimationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "UIVIew的动画"
        
        self.setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView()
    {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = .None
    }
    
    func setUI()
    {
        let view = UIView(frame: CGRectMake(10.0, 10.0, 100.0, 40.0))
        self.view.addSubview(view)
        view.backgroundColor = UIColor.lightGrayColor()
        // 位置改变
        var frame = view.frame
        UIView.animateWithDuration(0.6, delay: 2.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            () -> Void in
            
            frame.origin.x = 200.0
            view.frame = frame
            
            }) {
                (finished:Bool) -> Void in
                
                UIView.animateWithDuration(0.6) {
                    () -> Void in
                    
                    frame.origin.x = 10.0
                    view.frame = frame
                }
        }
        
        
        var currentView = view
        
        
        let view2 = UILabel(frame: CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), 40.0, 40.0))
        self.view.addSubview(view2)
        view2.text = "缩放"
        view2.textAlignment = .Center
        view2.backgroundColor = UIColor.lightGrayColor()
        // 缩放
        UIView.animateWithDuration(3.0, delay:2.0, options:UIViewAnimationOptions.TransitionNone, animations: {
                ()-> Void in
            
                view2.layer.setAffineTransform(CGAffineTransformMakeScale(0.3, 0.3))
            }, completion:{
                (finished:Bool) -> Void in
                
                UIView.animateWithDuration(0.6, animations:{
                    ()-> Void in
                    view2.layer.setAffineTransform(CGAffineTransformIdentity)
                })
        })

        
        currentView = view2
        
        
        let view3 = UILabel(frame: CGRectMake((currentView.frame.origin.x + currentView.frame.size.width + 10.0), currentView.frame.origin.y, 40.0, 40.0))
        self.view.addSubview(view3)
        view3.text = "旋转"
        view3.textAlignment = .Center
        view3.backgroundColor = UIColor.lightGrayColor()
        // 旋转
        UIView.animateWithDuration(0.6, delay:1.0, options:UIViewAnimationOptions.TransitionNone, animations: {
                ()-> Void in

                view3.layer.setAffineTransform(CGAffineTransformMakeRotation(90))
            }, completion:{
                (finished:Bool) -> Void in
                UIView.animateWithDuration(0.6, animations:{
                    ()-> Void in
                    // 完成动画时，数字块复原
                    view3.layer.setAffineTransform(CGAffineTransformIdentity)
                })
        })
        
        
        currentView = view3
        
        
        let view4 = UILabel(frame: CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), 100.0, 40.0))
        self.view.addSubview(view4)
        view4.text = "淡入淡出"
        view4.textColor = UIColor.redColor()
        view4.textAlignment = .Center
        view4.backgroundColor = UIColor.yellowColor()
        // 淡入淡出
        UIView.animateWithDuration(2.0, delay:1.0, options:UIViewAnimationOptions.TransitionNone, animations: {
            ()-> Void in
            
            view4.alpha = 0.0
            }, completion:{
                (finished:Bool) -> Void in
                UIView.animateWithDuration(2.0, animations:{
                    ()-> Void in
                    
                    view4.alpha = 1.0
                })
        })

    }
    
    

}
