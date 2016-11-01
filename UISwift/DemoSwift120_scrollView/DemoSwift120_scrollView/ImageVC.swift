//
//  ImageVC.swift
//  DemoSwift120_scrollView
//
//  Created by zhangshaoyu on 16/11/1.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ImageVC: UIViewController, UIScrollViewDelegate {

    var mainScrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "scale scrollview"
        
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
        self.mainScrollView = UIScrollView(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.bounds), 280.0))
        
        // 添加到父视图
        self.view.addSubview(self.mainScrollView)
     
        // 添加子视图label
        var originX:CGFloat = 0.0
        for number in 1...3
        {
            let scrollview = UIScrollView(frame: CGRectMake(originX, 0.0, CGRectGetWidth(self.mainScrollView.bounds), CGRectGetHeight(self.mainScrollView.bounds)))
            self.mainScrollView.addSubview(scrollview)
            if 1 == number
            {
                scrollview.backgroundColor = UIColor.brownColor()
            }
            else if 2 == number
            {
                scrollview.backgroundColor = UIColor.blueColor()
            }
            else
            {
                scrollview.backgroundColor = UIColor.orangeColor()
            }
            
            let imageview = UIImageView(frame: scrollview.bounds)
            scrollview.addSubview(imageview);
            imageview.contentMode = .ScaleAspectFit
            imageview.backgroundColor = UIColor.purpleColor()
            var image = UIImage(named: "01")
            if 2 == number
            {
                image = UIImage(named: "02")
            }
            else if 3 == number
            {
                image = UIImage(named: "03")
            }
            imageview.image = image
            
            
            originX = (CGRectGetMinX(scrollview.frame) + CGRectGetWidth(scrollview.frame))
            
            
            // 两个手指拿捏缩放
            scrollview.minimumZoomScale = 0.3
            scrollview.maximumZoomScale = 2.0
            scrollview.delegate = self
            
            // 双击缩放
            let doubleTap = UITapGestureRecognizer(target: self, action: Selector("doubleClick:"))
            doubleTap.numberOfTapsRequired = 2
            imageview.userInteractionEnabled = true
            imageview.addGestureRecognizer(doubleTap)
        }
        
        // 背景颜色
        self.mainScrollView.backgroundColor = UIColor(red: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random()) / CGFloat(RAND_MAX)), alpha: 1.0)
        // 其他属性
        self.mainScrollView.scrollEnabled = true // 可以上下滚动
        self.mainScrollView.scrollsToTop = true // 点击状态栏时，可以滚动回顶端
        self.mainScrollView.bounces = true // 反弹效果，即在最顶端或最底端时，仍然可以滚动，且释放后有动画返回效果
        self.mainScrollView.pagingEnabled = true // 分页显示效果
        self.mainScrollView.showsHorizontalScrollIndicator = true // 显示水平滚动条
        self.mainScrollView.showsVerticalScrollIndicator = true // 显示垂直滚动条
        self.mainScrollView.indicatorStyle = UIScrollViewIndicatorStyle.White // 滑动条的样式
        // 设置内容大小
        self.mainScrollView.contentSize = CGSizeMake(originX, CGRectGetHeight(self.mainScrollView.bounds))
    }
    
    
    // MARK: - UIScrollViewDelegate
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        print("1 scrollViewDidZoom")
        
        // 设置被缩放的对应视图
        for imageview in scrollView.subviews
        {
            if imageview is UIImageView
            {
                return imageview
            }
        }
        
        return nil
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?)
    {
        print("2 scrollViewWillBeginZooming")
        
        print("view = \(view)")
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView)
    {
        print("3 scrollViewDidZoom")
        
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat)
    {
        print("4 scrollViewDidEndZooming")
        
        print("scale = \(scale)，view = \(view)")
        
        // 缩放效果
        // 放大或缩小
        if scrollView.minimumZoomScale >= scale
        {
            scrollView.setZoomScale(0.3, animated: true)
        }
        if scrollView.maximumZoomScale <= scale
        {
            scrollView.setZoomScale(2.0, animated: true)
        }
    }

    
    
    // MARK: - 双击缩放
    var isScaleBig:Bool = false
    func doubleClick(gestureRecognizer:UITapGestureRecognizer)
    {
        let imageview = gestureRecognizer.view as! UIImageView
        let scrollview = imageview.superview as! UIScrollView
        
        // 放大缩小
        let scale = scrollview.zoomScale
        if isScaleBig
        {
            scrollview.setZoomScale((scale / 0.3), animated: true)
            isScaleBig = false
        }
        else
        {
            scrollview.setZoomScale((scale * 0.3), animated: true)
            isScaleBig = true
        }
        

        // 居中显示
        let boundsSize = scrollview.bounds.size
        var contentsFrame = imageview.frame
        
        if contentsFrame.size.width < boundsSize.width
        {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        }
        else
        {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height
        {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        }
        else
        {
            contentsFrame.origin.y = 0.0
        }
        
        imageview.frame = contentsFrame
    }
}
