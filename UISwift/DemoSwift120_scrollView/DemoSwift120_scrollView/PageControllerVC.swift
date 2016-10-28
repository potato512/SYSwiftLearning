//
//  PageControllerVC.swift
//  DemoSwift120_scrollView
//
//  Created by zhangshaoyu on 16/10/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class PageControllerVC: UIViewController, UIScrollViewDelegate {

    var mainScrollView:UIScrollView!
    var mainPageControl:UIPageControl!
    var mainTimer:NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "pageController scrollview"
        
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
    
    
    // MARK: - timer周期
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.addTimer()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.removerTimer()
    }
    
    // MARK: - 视图
    
    func setUI()
    {
        self.setScrollViewUI()
        self.setPageControlUI()
    }
    
    func setScrollViewUI()
    {
        self.mainScrollView = UIScrollView(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 200.0))
        
        // 添加到父视图
        self.view.addSubview(self.mainScrollView)
        
        // 添加子视图label
        var originX:CGFloat = 0.0
        for number in 1...10
        {
            let label = UILabel(frame: CGRectMake(originX, 0.0, CGRectGetWidth(self.mainScrollView.bounds), CGRectGetHeight(self.mainScrollView.bounds)))
            self.mainScrollView.addSubview(label)
            label.backgroundColor = UIColor(red: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), alpha: 1.0)
            label.textAlignment = .Center
            label.text = String(format: "scrollView add 第 %ld 个 label", arguments: [number]);
            
            originX = (CGRectGetMinX(label.frame) + CGRectGetWidth(label.frame))
        }
        
        // 背景颜色
        self.mainScrollView.backgroundColor = UIColor(red: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), alpha: 1.0)
        // 自适应父视图
        // self.mainScrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        // 其他属性
        self.mainScrollView.scrollEnabled = true // 可以上下滚动
        self.mainScrollView.scrollsToTop = true // 点击状态栏时，可以滚动回顶端
        self.mainScrollView.bounces = true // 在最顶端或最底端时，仍然可以滚动，且释放后有动画返回效果
        mainScrollView.pagingEnabled = false // 分页显示效果
        mainScrollView.showsHorizontalScrollIndicator = true // 显示水平滚动条
        mainScrollView.showsVerticalScrollIndicator = true // 显示垂直滚动条
        mainScrollView.indicatorStyle = UIScrollViewIndicatorStyle.White // 滑动条的样式
        // 设置内容大小
        self.mainScrollView.contentSize = CGSizeMake(originX, 200.0)
        
        // 代理
        self.mainScrollView.delegate = self
    }
    
    func setPageControlUI()
    {
        self.mainPageControl = UIPageControl(frame: CGRectMake((CGRectGetWidth(self.view.bounds) - 200.0) / 2, (CGRectGetHeight(self.mainScrollView.bounds) - 20.0 - 10.0), 200.0, 20.0))
        // 添加到父视图
        self.view.addSubview(self.mainPageControl)
        // 背景颜色
        self.mainPageControl.backgroundColor = UIColor.lightGrayColor()
        
        // 其他属性设置
        self.mainPageControl.numberOfPages = 10 // 总页数
        self.mainPageControl.currentPage = 0 // 当前页数，默认为0，即第一个，实际数量是0~n-1
        self.mainPageControl.pageIndicatorTintColor = UIColor.yellowColor() // 非当前页颜色
        self.mainPageControl.currentPageIndicatorTintColor = UIColor.redColor() // 当前页颜色
    }
    
    // MARK: - timer
    
    func addTimer()
    {
        self.mainTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("autoShow"), userInfo: nil, repeats: true)
    }
    
    func removerTimer()
    {
        if self.mainTimer != nil
        {
            self.mainTimer.invalidate()
            self.mainTimer = nil
        }
    }
    
    func autoShow()
    {
        var page = self.mainPageControl.currentPage
        if 9 == page
        {
            page = 0
        }
        else
        {
            page++
        }
        
        // 设置偏移量
        let offsetX = CGFloat(page) * CGRectGetWidth(self.mainScrollView.frame)
        self.mainScrollView.setContentOffset(CGPointMake(offsetX, 0.0), animated: true)
        self.mainPageControl.currentPage = page
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView)
    {
        print("1 scrollViewWillBeginDragging")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        print("2 scrollViewDidScroll")
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
        
        let width = CGRectGetWidth(scrollView.frame)
        let offsetX = scrollView.contentOffset.x
        let index = offsetX / width
        print("当前页是：\(index)")
        
        self.mainPageControl.currentPage = Int(index)
    }
    
    
    
//    func scrollViewDidZoom(scrollView: UIScrollView)
//    {
//        print("2 scrollViewDidZoom")
//    }
    
//    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView)
//    {
//        print("8 scrollViewDidEndScrollingAnimation")
//    }
    
//    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
//    {
//        print("2 scrollViewDidZoom")
//    }
    
//    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?)
//    {
//        print("9 scrollViewWillBeginZooming")
//    }
    
//    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat)
//    {
//        print("10 scrollViewDidEndZooming")
//    }
    
//    func scrollViewShouldScrollToTop(scrollView: UIScrollView) -> Bool
//    {
//        print("11 scrollViewShouldScrollToTop")
//        
//        return true
//    }
    
//    func scrollViewDidScrollToTop(scrollView: UIScrollView)
//    {
//        print("12 scrollViewDidScrollToTop")
//    }
}
