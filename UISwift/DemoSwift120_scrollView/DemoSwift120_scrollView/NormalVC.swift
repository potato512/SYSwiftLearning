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
        
    }


    // MARK: - getter
//    lazy var headerLabel:UILabel
//    {
//        let label = UILabel(frame: CGRectZero)
//        
//        return label
//    }

}
