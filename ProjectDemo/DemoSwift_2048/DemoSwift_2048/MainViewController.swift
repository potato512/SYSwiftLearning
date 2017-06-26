//
//  MainViewController.swift
//  DemoSwift_2048
//
//  Created by zhangshaoyu on 17/5/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

let dimension:Int = 4
let padding:CGFloat = 10.0
let yPadding:CGFloat = 30.0
let width = (UIScreen.mainScreen().bounds.width - padding * (4 + 1)) / 4

class MainViewController: UIViewController {
    
    var maxnumber:Int = 2048
//    var backgounds = Array<UIView>()
//    var model:GameModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        self.backgounds = Array<UIView>()
//        self.model = GameModel(dimenstion: dimension)
        
        self.setUpBackground()
        
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        for _ in 0...16
        {
            self.getNumber()
        }
    }
    
    func setUpBackground()
    {
        var x:CGFloat = padding
        var y:CGFloat = yPadding
        
        for _ in 0..<dimension
        {
            y = yPadding
            
            for _ in 0..<dimension
            {
                let background = UIView.init(frame: CGRectMake(x, y, width, width))
                background.backgroundColor = UIColor.darkGrayColor()
                self.view.addSubview(background)
                
//                self.backgounds.append(background)
                
                y += padding + width
            }
            
            x += padding + width
        }
    }
    
    func getNumber()
    {
        let randNumber = Int(random() % 10)
        print(randNumber)
        
        var seed:Int = 2
        if (1 == randNumber)
        {
            seed = 4
        }
        
        let column = Int(random() % dimension)
        let row = Int(random() % dimension)
        
//        if self.model.isFull()
//        {
//            print("位置已经满了")
//        }
//        if (self.model.setPosition(row, col: column, value: seed) == false)
//        {
//            getNumber()
//            return
//        }
        
        self.insertTitle((row, column), value: seed)
    }
    
    func insertTitle(pos:(Int, Int), value:Int)
    {
        let (row, col) = pos;
        
        let x = padding + CGFloat(col) * (width + padding)
        let y = yPadding + CGFloat(row) * (width + padding)
        
        let title = TitleView(pos: CGPointMake(x, y), width: width, value: value)
        self.view.addSubview(title)
        self.view.bringSubviewToFront(title)
        
        title.layer.setAffineTransform(CGAffineTransformMakeScale(0.1, 0.1))
        
        UIView.animateWithDuration(0.3, delay: 0.1, options: UIViewAnimationOptions.TransitionNone, animations: {
            () -> Void in
            title.layer.setAffineTransform(CGAffineTransformMakeScale(1.0, 1.0))
            }, completion: {
                (finished:Bool) -> Void in
                
                UIView.animateWithDuration(0.08, animations: {
                    () -> Void in
                    
                    title.layer.setAffineTransform(CGAffineTransformIdentity)
                })
        })
    }
}
