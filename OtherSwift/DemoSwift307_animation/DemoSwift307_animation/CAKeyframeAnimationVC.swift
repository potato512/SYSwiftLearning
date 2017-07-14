//
//  CAKeyframeAnimationVC.swift
//  DemoSwift307_animation
//
//  Created by zhangshaoyu on 2017/7/14.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class CAKeyframeAnimationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   
        self.title = "CAKeyframeAnimation"
        
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
        view.text = "CAKeyframeAnimation动画"
        view.backgroundColor = UIColor.lightGrayColor()
        //
        let layer = view.layer
        // 位移
        let keyAnimate = CAKeyframeAnimation(keyPath: "position")
        // 设定关键帧
        let value0 = NSValue(CGPoint: layer.position)
        let value1 = NSValue(CGPoint: CGPointMake(layer.position.x, layer.position.y + 200))
        let value2 = NSValue(CGPoint: CGPointMake(layer.position.x - 150, layer.position.y + 200))
        let value3 = NSValue(CGPoint: CGPointMake(layer.position.x - 150, layer.position.y))
        let value4 = NSValue(CGPoint: layer.position)
        // 速度曲线
        let tf0 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let tf1 = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        let tf2 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        let tf3 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        keyAnimate.timingFunctions = [tf0, tf1, tf2, tf3]
        // 每段执行的时间
        keyAnimate.keyTimes = [0.0, 0.5, 0.6, 0.7, 1]
        //
        keyAnimate.values = [value0, value1, value2, value3, value4]
        keyAnimate.autoreverses = false
        keyAnimate.repeatCount = 3
        keyAnimate.duration = 6.0
        //
        keyAnimate.delegate = self
        //
        layer.addAnimation(keyAnimate, forKey: "position")
        
        
        var currentView = view
        
        
        let view2 = UILabel(frame: CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), 200.0, 40.0))
        self.view.addSubview(view2)
        view2.text = "动画"
        view2.backgroundColor = UIColor.lightGrayColor()
        //
        let layer2 = view2.layer
        //
        let animationPosition = CAKeyframeAnimation(keyPath: "position")
        animationPosition.path = UIBezierPath(ovalInRect: CGRect(x: 100.0, y: (currentView.frame.origin.y + currentView.frame.size.height + 10.0), width: 10.0, height: 10.0)).CGPath
        animationPosition.duration = 3
        animationPosition.additive = true
        animationPosition.repeatCount = MAXFLOAT
        /*
        kCAAnimationLinear     :   默认差值
        kCAAnimationDiscrete   :   逐帧显示
        kCAAnimationPaced      :   匀速 无视keyTimes
        kCAAnimationCubic      :   keyValue之间曲线平滑 可用 tensionValues,continuityValues,biasValues 调整
        kCAAnimationCubicPaced :   keyValue之间平滑差值 无视keyTimes
        */
        animationPosition.calculationMode   =   kCAAnimationPaced //无视keytimes
        /*
        kCAAnimationRotateAuto         :   自动
        kCAAnimationRotateAutoReverse  :   自动翻转
        不设置则不旋转
        */
        animationPosition.rotationMode  =   kCAAnimationRotateAuto
        //
        layer2.addAnimation(animationPosition, forKey: "position")
        
        
        currentView = view2
        
        
        
        let view3 = UILabel(frame: CGRectMake(10.0, (currentView.frame.origin.y + currentView.frame.size.height + 10.0), 60.0, 60.0))
        self.view.addSubview(view3)
        view3.text = "抖动"
        view3.backgroundColor = UIColor.lightGrayColor()
        //
        let layer3 = view3.layer
        // 抖动
        let animation3 = CAKeyframeAnimation()
        animation3.keyPath = "transform.rotation"
        // (-M_PI_4 /90.0 * 5)表示-5度 。
        let value31 = NSValue(CGPoint: CGPointMake(CGFloat(-M_PI_4 / 90.0 * 5.0), 0.0))
        let value32 = NSValue(CGPoint: CGPointMake(CGFloat(M_PI_4 / 90.0 * 5.0), 0.0))
        let value33 = NSValue(CGPoint: CGPointMake(CGFloat(-M_PI_4 / 90.0 * 5.0), 0.0))
        animation3.values = [value31, value32, value33];
        animation3.removedOnCompletion = false
        animation3.fillMode = kCAFillModeForwards
        animation3.duration = 0.2
        animation3.repeatCount = MAXFLOAT
        //
        layer3.addAnimation(animation3, forKey: nil)
        
        
        currentView = view3
    }
    
    override func animationDidStart(anim: CAAnimation) {
        print("开始")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("结束")
    }

    

}


/*
主要属性:
keyPath : 要设置的属性
path : 路径 可用UIBezierPath（设置了path，将忽略values）
duration : 动画时长
repeatCount : 重复次数
calculationMode : 动画计算方式
values：每一个关键帧（设置了path，将忽略values）
removedOnCompletion：执行完之后不删除动画
fillMode：执行完之后保存最新的状态


*/




