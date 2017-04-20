//
//  ViewController.swift
//  DemoSwift303_NSTimer
//
//  Created by herman on 2017/4/20.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//  github：https://github.com/potato512/SYSwiftLearning

import UIKit

let tagLabel = 1000;

class ViewController: UIViewController {

    var timer:NSTimer!;
    var count:NSInteger = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "NSTimer";
        
        self.createNSTimer();
        self.setUI();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        super.loadView();
        
        self.view.backgroundColor = UIColor.whiteColor();
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = .None;
        }
    }
    
    func setUI()
    {
        let label = UILabel(frame: CGRectMake(10.0, 10.0, (self.view.frame.size.width - 10.0 * 2), 30.0));
        self.view.addSubview(label);
        label.textColor = UIColor.blackColor();
        label.font = UIFont.systemFontOfSize(12.0);
        label.textAlignment = .Center;
        label.layer.borderColor = UIColor.redColor().CGColor;
        label.layer.borderWidth = 0.5;
        label.tag = tagLabel;
        
        let buttonStart = UIButton(frame: CGRectMake(10.0, 50.0, 60.0, 30.0));
        self.view.addSubview(buttonStart);
        buttonStart.backgroundColor = UIColor.greenColor();
        buttonStart.setTitle("开始", forState: .Normal);
        buttonStart.setTitleColor(UIColor.blackColor(), forState: .Normal);
        buttonStart.setTitleColor(UIColor.redColor(), forState: .Highlighted);
        buttonStart.addTarget(self, action: #selector(ViewController.startNSTimer), forControlEvents: .TouchUpInside);
        
        let buttonPause = UIButton(frame: CGRectMake(80.0, 50.0, 60.0, 30.0));
        self.view.addSubview(buttonPause);
        buttonPause.backgroundColor = UIColor.orangeColor();
        buttonPause.setTitle("暂停", forState: .Normal);
        buttonPause.setTitleColor(UIColor.blackColor(), forState: .Normal);
        buttonPause.setTitleColor(UIColor.redColor(), forState: .Highlighted);
        buttonPause.addTarget(self, action: #selector(ViewController.stopNSTimer), forControlEvents: .TouchUpInside);
        
        let buttonStop = UIButton(frame: CGRectMake(150.0, 50.0, 60.0, 30.0));
        self.view.addSubview(buttonStop);
        buttonStop.backgroundColor = UIColor.blueColor();
        buttonStop.setTitle("停止", forState: .Normal);
        buttonStop.setTitleColor(UIColor.blackColor(), forState: .Normal);
        buttonStop.setTitleColor(UIColor.redColor(), forState: .Highlighted);
        buttonStop.addTarget(self, action: #selector(ViewController.killNSTimer), forControlEvents: .TouchUpInside);
    }
    
    func createNSTimer()
    {
        // init方法
//        self.timer = NSTimer.init(timeInterval: 0.1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true);
        // scheduled方法
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.countdown), userInfo: nil, repeats: true);
        
        NSRunLoop.currentRunLoop().addTimer(self.timer, forMode: NSRunLoopCommonModes);
        self.stopNSTimer();
    }
    
    func startNSTimer()
    {
        if self.timer == nil
        {
            self.createNSTimer();
        }
        self.timer.fireDate = NSDate.distantPast();
    }
    
    func stopNSTimer()
    {
        self.timer.fireDate = NSDate.distantFuture();
    }
    
    func killNSTimer()
    {
        if (self.timer != nil)
        {
            if self.timer.valid
            {
                self.timer.invalidate();
                self.timer = nil;
            }
        }
        self.count = 0;
    }
    
    func countdown()
    {
        self.count += 1;

        let label = self.view.viewWithTag(tagLabel) as! UILabel;
        label.text = NSString(format:"%d", self.count) as String;
    }
}

