//
//  NormalVC.swift
//  DemoSwift120_scrollView
//
//  Created by zhangshaoyu on 16/10/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class NormalVC: UIViewController, UIScrollViewDelegate {

    var headerLabel:UILabel!
    var footerLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "normal scrollview"
        
        self.setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor(red: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), alpha: 1.0)
        
        // UI适配
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    // MARK: - 视图
    
    func setUI()
    {
        let mainScrollView = UIScrollView(frame: self.view.bounds)
        
        // 添加到父视图
        self.view.addSubview(mainScrollView)
        
        // 添加子视图label
        var originY:CGFloat = 10.0
        for number in 1...10
        {
            let label = UILabel(frame: CGRectMake(10.0, originY, (CGRectGetWidth(mainScrollView.bounds) - 10.0 * 2), 200.0))
            mainScrollView.addSubview(label)
            label.backgroundColor = UIColor(red: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), alpha: 1.0)
            label.textAlignment = .Center
            label.text = String(format: "scrollView add 第 %ld 个 label", arguments: [number]);
            
            originY = (CGRectGetMinY(label.frame) + CGRectGetHeight(label.frame) + 10.0)
        }
        
        // 背景颜色
        mainScrollView.backgroundColor = UIColor(red: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), alpha: 1.0)
        // 自适应父视图
        mainScrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        // 其他属性
        mainScrollView.scrollEnabled = true // 可以上下滚动
        mainScrollView.scrollsToTop = true // 点击状态栏时，可以滚动回顶端
        mainScrollView.bounces = true // 反弹效果，即在最顶端或最底端时，仍然可以滚动，且释放后有动画返回效果
        mainScrollView.pagingEnabled = false // 分页显示效果
        mainScrollView.showsHorizontalScrollIndicator = true // 显示水平滚动条
        mainScrollView.showsVerticalScrollIndicator = true // 显示垂直滚动条
        mainScrollView.indicatorStyle = UIScrollViewIndicatorStyle.White // 滑动条的样式
        // 设置内容大小
        mainScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), originY)
        // 设置代理
        mainScrollView.delegate = self
        
        
        
        // 头尾视图
        self.headerLabel = UILabel(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), 0.0))
        self.view.addSubview(self.headerLabel)
        self.headerLabel.backgroundColor = UIColor.yellowColor()
        self.headerLabel.textColor = UIColor.redColor()
        self.headerLabel.textAlignment = .Center
        self.headerLabel.text = "headerLabel"
        self.headerLabel.hidden = false
        
        self.footerLabel = UILabel(frame: CGRectMake(0.0, (CGRectGetHeight(self.view.frame) - 40.0), CGRectGetWidth(self.view.frame), 0.0))
        self.view.addSubview(self.footerLabel)
        self.footerLabel.autoresizingMask = .FlexibleTopMargin
        self.footerLabel.backgroundColor = UIColor.yellowColor()
        self.footerLabel.textColor = UIColor.redColor()
        self.footerLabel.textAlignment = .Center
        self.footerLabel.text = "footerLabel"
        self.footerLabel.hidden = false
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView)
    {
        print("1 scrollViewWillBeginDragging")
        
        scrollView.contentInset = UIEdgeInsetsZero
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        print("2 scrollViewDidScroll")
        
        // 上下拉时滚动时的位移量（向上滚动时，位移是正数；向下拉动时，位移是负数）
        let offsetY = scrollView.contentOffset.y
        print("offsetY = \(offsetY)")
        
        // 最大位移量（注意scrollview的contentsize的高与当前视图控制器的屏幕高度的关系）
        let offsetYMax = scrollView.contentSize.height
        print("offsetYMax = \(offsetYMax)")
        let offsetYTmp = offsetYMax - CGRectGetHeight(self.view.bounds)
        print("offsetYTmp = \(offsetYTmp)")
        
        if 0 >= offsetY
        {
            // 向下拉
            
            // 重置headerLabel的frame
            var rectHeader = self.headerLabel.frame
            rectHeader.size.height = offsetY * -1.0
            self.headerLabel.frame = rectHeader
            
            //
            if -100.0 >= offsetY
            {
                scrollView.contentInset = UIEdgeInsetsMake(80.0, 0.0, 0.0, 0.0)
            }
        }
        else
        {
            // 向上拉
            let offsetYUp = offsetY - offsetYTmp
            
            // 重置footerLabel的frame
            var rectFooter = self.footerLabel.frame
            rectFooter.origin.y = CGRectGetHeight(self.view.bounds) - offsetYUp
            rectFooter.size.height = offsetYUp
            self.footerLabel.frame = rectFooter
            
            
            //
            if 100.0 <= offsetYUp
            {
                scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 80.0, 0.0)
            }
        }
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        print("3 scrollViewWillEndDragging")
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
        print("4 scrollViewDidEndDragging")
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView)
    {
        print("5 scrollViewWillBeginDecelerating")
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView)
    {
        print("6 scrollViewDidEndDecelerating")
        

    }




}
