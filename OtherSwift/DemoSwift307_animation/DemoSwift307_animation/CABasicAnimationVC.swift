//
//  CABasicAnimationVC.swift
//  DemoSwift307_animation
//
//  Created by zhangshaoyu on 2017/7/14.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class CABasicAnimationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "CABasicAnimation"
        
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
        let view = UILabel(frame: CGRectMake((self.view.frame.size.width - 200.0) / 2, 10.0, 200.0, 40.0))
        self.view.addSubview(view)
        view.text = "缩放/淡入淡出"
        view.textAlignment = .Center
        view.adjustsFontSizeToFitWidth = true
        view.backgroundColor = UIColor.lightGrayColor()
        //
        let layer = view.layer
        // 开始动画
        // 缩放
        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 1.0
        scaleAnimate.toValue = 1.5
        scaleAnimate.autoreverses = true
        scaleAnimate.repeatCount = MAXFLOAT
        scaleAnimate.duration = 1.0
        // 淡入淡出
        let opaqueAnimate = CABasicAnimation(keyPath: "opacity")
        opaqueAnimate.fromValue = 0.1
        opaqueAnimate.toValue = 1
        opaqueAnimate.autoreverses = true
        opaqueAnimate.repeatCount = MAXFLOAT
        opaqueAnimate.duration = 1.0
        layer.addAnimation(scaleAnimate, forKey: "scaleAnimate")
        layer.addAnimation(opaqueAnimate, forKey: "opacityAnimate")
        
        
        var currentView = view
        
        
        let view2 = UILabel(frame: CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), 120.0, 40.0))
        self.view.addSubview(view2)
        view2.text = "移动位置"
        view2.textAlignment = .Center
        view2.adjustsFontSizeToFitWidth = true
        view2.backgroundColor = UIColor.lightGrayColor()
        //
        let layer2 = view2.layer
        // 移动位置
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = NSValue(CGPoint: layer2.position)
        animation.toValue = NSValue(CGPoint: CGPointMake(200.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0)))
        animation.duration = 3
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.repeatCount = MAXFLOAT
        // 添加动画
        layer2.addAnimation(animation, forKey: "position")
        
        
        currentView = view2
        
        
        let view3 = UILabel(frame: CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), 120.0, 40.0))
        self.view.addSubview(view3)
        view3.text = "组合动画"
        view3.textAlignment = .Center
        view3.adjustsFontSizeToFitWidth = true
        view3.backgroundColor = UIColor.lightGrayColor()
        //
        let layer3 = view3.layer
        // CAAnimationGroup组合动画效果
        let rotate: CABasicAnimation = CABasicAnimation()
        rotate.keyPath = "tranform.rotation"
        rotate.toValue = M_PI
        let scale: CABasicAnimation = CABasicAnimation()
        scale.keyPath = "transform.scale"
        scale.toValue = 0.0
        let move: CABasicAnimation = CABasicAnimation()
        move.keyPath = "transform.translation"
        move.toValue = NSValue(CGPoint: CGPoint(x: 217, y: 230))
        let animationGroup:CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = [rotate, scale, move]
        animationGroup.duration = 2.0
        animationGroup.fillMode = kCAFillModeForwards
        animationGroup.removedOnCompletion = false
        animationGroup.repeatCount = MAXFLOAT
        //
        layer3.addAnimation(animationGroup, forKey: nil)
        
        
        currentView = view3
    }

    /*
    1、CABasicAnimation类只有三个属性：
    fromValue：开始值
    toValue：结束值
    Duration：动画的时间
    repeatCount：重复次数
    
    2、通过animationWithKeyPath键值对的方式设置不同的动画效果
    transform.scale
    transform.scale.x
    transform.scale.y
    transform.rotation.z
    opacity
    margin
    zPosition
    backgroundColor
    cornerRadius
    borderWidth
    bounds
    contents
    contentsRect
    cornerRadius
    frame
    hidden
    mask
    masksToBounds
    opacity
    position
    shadowColor
    shadowOffset
    shadowOpacity
    shadowRadius
    */
}
