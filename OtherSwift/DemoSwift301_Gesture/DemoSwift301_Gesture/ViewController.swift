//
//  ViewController.swift
//  DemoSwift301_Gesture
//
//  Created by zhangshaoyu on 2017/7/13.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pointValue:CGPoint! = CGPointZero // 移动
    var scaleValue:CGFloat! = 1.0  // 缩放
    var rotationValue:CGFloat! = 1.0 // 旋转
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "手势操作"
        
        self.setUI()
        
//        http://blog.csdn.net/jwzhangjie/article/details/40147933
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setUI()
    {
        let scrollview = UIScrollView(frame: CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height))
        scrollview.autoresizingMask = .FlexibleHeight
        self.view.addSubview(scrollview)
        
        var height = self.tapUI(scrollview, originY: 10.0)
        height = self.swipeUI(scrollview, originY: height)
        height = self.panUI(scrollview, originY: height)
        height = self.rotationUI(scrollview, originY: height)
        height = self.pinchUI(scrollview, originY: height)
        height = self.pressUI(scrollview, originY: height)
        
        scrollview.contentSize = CGSizeMake(self.view.frame.size.width, height)
    }
    
    // MARK: - 点击手势
    
    func tapUI(view:UIScrollView, originY:CGFloat) -> CGFloat
    {
        var origin = originY
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("tapClick:"))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        
        let labelTap = UILabel(frame: CGRectMake(10.0, origin, (view.frame.size.width - 10.0 * 2), 60.0))
        view.addSubview(labelTap)
        labelTap.backgroundColor = UIColor.lightGrayColor()
        labelTap.text = "手势操作-单指单击手势";
        labelTap.adjustsFontSizeToFitWidth = true
        labelTap.textAlignment = .Center;
        // 添加手势
        labelTap.userInteractionEnabled = true
        labelTap.addGestureRecognizer(tapRecognizer)
        
        
        origin = labelTap.frame.origin.y + labelTap.frame.size.height + 10.0
        
        
        let tapRecognizer2 = UITapGestureRecognizer(target: self, action: Selector("tapClick2:"))
        tapRecognizer2.numberOfTapsRequired = 2
        tapRecognizer2.numberOfTouchesRequired = 1
        
        let labelTap2 = UILabel(frame: CGRectMake(10.0, origin, (view.frame.size.width - 10.0 * 2), 60.0))
        view.addSubview(labelTap2)
        labelTap2.backgroundColor = UIColor.lightGrayColor()
        labelTap2.text = "手势操作-单指双击手势";
        labelTap2.adjustsFontSizeToFitWidth = true
        labelTap2.textAlignment = .Center;
        // 添加手势
        labelTap2.userInteractionEnabled = true
        labelTap2.addGestureRecognizer(tapRecognizer2)
        
        origin = labelTap2.frame.origin.y + labelTap2.frame.size.height + 10.0
        return origin
    }
    
    func tapClick(recognizer:UITapGestureRecognizer)
    {
        let label:UILabel = recognizer.view as! UILabel
        label.textColor = UIColor.redColor()
    }
    
    func tapClick2(recognizer:UITapGestureRecognizer)
    {
        let label:UILabel = recognizer.view as! UILabel
        label.textColor = UIColor.greenColor()
    }
    
    // MARK: - 滑动手势
    func swipeUI(view:UIScrollView, originY:CGFloat) -> CGFloat
    {
        var origin = originY
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipeLeftClick:"))
        swipeLeftRecognizer.direction = .Left
        swipeLeftRecognizer.numberOfTouchesRequired = 1
        
        let labelLeft = UILabel(frame: CGRectMake(10.0, origin, (view.frame.size.width - 10.0 * 2), 60.0))
        view.addSubview(labelLeft)
        labelLeft.backgroundColor = UIColor.lightGrayColor()
        labelLeft.text = "手势操作-左滑手势";
        labelLeft.adjustsFontSizeToFitWidth = true
        labelLeft.textAlignment = .Center;
        // 添加手势
        labelLeft.userInteractionEnabled = true
        labelLeft.addGestureRecognizer(swipeLeftRecognizer)
        
        
        origin = labelLeft.frame.origin.y + labelLeft.frame.size.height + 10.0
        
        
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipeRightClick:"))
        swipeRightRecognizer.direction = .Right
        swipeRightRecognizer.numberOfTouchesRequired = 1
        
        let labelRight = UILabel(frame: CGRectMake(10.0, origin, (view.frame.size.width - 10.0 * 2), 60.0))
        view.addSubview(labelRight)
        labelRight.backgroundColor = UIColor.lightGrayColor()
        labelRight.text = "手势操作-右滑手势";
        labelRight.adjustsFontSizeToFitWidth = true
        labelRight.textAlignment = .Center;
        // 添加手势
        labelRight.userInteractionEnabled = true
        labelRight.addGestureRecognizer(swipeRightRecognizer)
        
        
        origin = labelRight.frame.origin.y + labelRight.frame.size.height + 10.0
        return origin
    }
    
    func swipeLeftClick(recognizer:UISwipeGestureRecognizer)
    {
        let label = recognizer.view
        label!.backgroundColor = UIColor.orangeColor()
    }
    
    func swipeRightClick(recognizer:UISwipeGestureRecognizer)
    {
        let label = recognizer.view
        label!.backgroundColor = UIColor.greenColor()
    }
    
    // MARK: - 拖动手势
    
    func panUI(view:UIScrollView, originY:CGFloat) -> CGFloat
    {
        var origin = originY
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: Selector("panClick:"))
        
        let label = UILabel(frame: CGRectMake(10.0, origin, 100.0, 100.0))
        view.addSubview(label)
        label.backgroundColor = UIColor.lightGrayColor()
        label.text = "手势操作-拖动手势";
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .Center;
        // 添加手势
        label.userInteractionEnabled = true
        label.addGestureRecognizer(panRecognizer)
        
        origin = label.frame.origin.y + label.frame.size.height + 10.0
        return origin
    }
    
    func panClick(recognizer:UIPanGestureRecognizer)
    {
        let label:UILabel = recognizer.view as! UILabel
        
        let point = recognizer.translationInView(label)
        print("pan point = \(point)")
        
        // 移动
        label.transform = CGAffineTransformMakeTranslation(point.x + self.pointValue.x, point.y + self.pointValue.y)
        
        if recognizer.state == .Began
        {
            label.backgroundColor = UIColor.yellowColor()
            self.view.bringSubviewToFront(label)
        }
        else if recognizer.state == .Ended
        {
            label.backgroundColor = UIColor.lightGrayColor()
            
            self.pointValue.x += point.x
            self.pointValue.y += point.y
        }
    }
    
    // MARK: - 旋转手势
    
    func rotationUI(view:UIScrollView, originY:CGFloat) -> CGFloat
    {
        var origin = originY
        
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: Selector("ratotionClick:"))
        
        let label = UILabel(frame: CGRectMake(10.0, origin, (view.frame.size.width - 10.0 * 2), (view.frame.size.width - 10.0 * 2)))
        view.addSubview(label)
        label.backgroundColor = UIColor.lightGrayColor()
        label.text = "手势操作-旋转手势";
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .Center;
        // 添加手势
        label.userInteractionEnabled = true
        label.addGestureRecognizer(rotationRecognizer)
        
        origin = label.frame.origin.y + label.frame.size.height + 10.0
        return origin
    }
    
    func ratotionClick(recognizer:UIRotationGestureRecognizer)
    {
        let label:UILabel = recognizer.view as! UILabel
        
        let rotation = recognizer.rotation
        label.transform = CGAffineTransformMakeRotation(rotation + self.rotationValue)
        
        if recognizer.state == .Began
        {
            label.backgroundColor = UIColor.greenColor()
            self.view.bringSubviewToFront(label)
        }
        else if recognizer.state == .Ended
        {
            label.backgroundColor = UIColor.lightGrayColor()
            
            self.rotationValue = self.rotationValue + rotation
        }
    }
    
    // MARK: - 拿捏手势
    
    func pinchUI(view:UIScrollView, originY:CGFloat) -> CGFloat
    {
        var origin = originY
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: Selector("pinchClick:"))
        
        let label = UILabel(frame: CGRectMake(10.0, origin, (view.frame.size.width - 10.0 * 2), (view.frame.size.width - 10.0 * 2)))
        view.addSubview(label)
        label.backgroundColor = UIColor.lightGrayColor()
        label.text = "手势操作-捏合手势";
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .Center;
        // 添加手势
        label.userInteractionEnabled = true
        label.addGestureRecognizer(pinchRecognizer)
        
        origin = label.frame.origin.y + label.frame.size.height + 10.0
        return origin
    }
    
    func pinchClick(recognizer:UIPinchGestureRecognizer)
    {
        let label:UILabel = recognizer.view as! UILabel

        let scale = recognizer.scale;
        if scale > 1.0
        {
            // 放大
            label.transform = CGAffineTransformMakeScale(self.scaleValue + scale - 1.0, self.scaleValue + scale - 1.0)
        }
        else
        {
            // 缩小
            label.transform = CGAffineTransformMakeScale(self.scaleValue * scale, self.scaleValue * scale)
        }
        
        if recognizer.state == .Began
        {
            label.backgroundColor = UIColor.greenColor()
            self.view.bringSubviewToFront(label)
        }
        else if recognizer.state == .Ended
        {
            label.backgroundColor = UIColor.lightGrayColor()
            
            if scale > 1.0
            {
                self.scaleValue = self.scaleValue + scale - 1.0;
            }
            else
            {
                self.scaleValue = self.scaleValue * scale
            }
        }
    }
    
    // MARK: - 长按手势
    
    func pressUI(view:UIScrollView, originY:CGFloat) -> CGFloat
    {
        var origin = originY
        
        let pressRecognizer = UILongPressGestureRecognizer(target: self, action: Selector("pressClick:"))
        pressRecognizer.minimumPressDuration = 3.0
        
        let label = UILabel(frame: CGRectMake(10.0, origin, (view.frame.size.width - 10.0 * 2), 60.0))
        view.addSubview(label)
        label.backgroundColor = UIColor.lightGrayColor()
        label.text = "手势操作-长按手势";
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .Center;
        // 添加手势
        label.userInteractionEnabled = true
        label.addGestureRecognizer(pressRecognizer)
        
        origin = label.frame.origin.y + label.frame.size.height + 10.0
        return origin
    }
    
    func pressClick(recognizer:UILongPressGestureRecognizer)
    {
        let label:UILabel = recognizer.view as! UILabel

        if recognizer.state == .Began
        {
            let alertView = UIAlertView(title: nil, message: "长按响应", delegate: nil, cancelButtonTitle: "知道了")
            alertView.show()
            
            label.backgroundColor = UIColor.orangeColor()
            self.view.bringSubviewToFront(label)
        }
        else if recognizer.state == .Ended
        {
            label.backgroundColor = UIColor.lightGrayColor()
        }
    }
}

