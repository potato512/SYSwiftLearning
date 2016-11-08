//
//  ViewController.swift
//  DemoSwift121_collectionView
//
//  Created by zhangshaoyu on 16/10/19.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var mainCollectionView:UICollectionView!
    var mainArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "collectionview"
        
        self.setLocalData()
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
        
        // UI适配
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    // MARK: - 数据
    func setLocalData()
    {
        self.mainArray = NSMutableArray()
        for number in 1...5
        {
            let text = String(format: "第 %d 个", arguments: [number])
            
            let model = Model()
            model.text = text
            
            self.mainArray.addObject(model);
        }
    }
    
    // MARK: - 视图
    
    func setUI()
    {
        // 滚动方向
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        // 实例化
        self.mainCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        // 添加到父视图
        self.view.addSubview(self.mainCollectionView);
        // 属性设置
        self.mainCollectionView.autoresizingMask = .FlexibleHeight
        self.mainCollectionView.backgroundColor = UIColor.blueColor()
        self.mainCollectionView.dataSource = self
        self.mainCollectionView.delegate = self

        // 注册一个cell
        self.mainCollectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier:cellIdentifier)
        // 注册一个headView
        self.mainCollectionView!.registerClass(CollectionReusableViewHeader.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        // 注册一个footView
        self.mainCollectionView!.registerClass(CollectionReusableViewFooter.self, forSupplementaryViewOfKind:UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier)
        
        // 设置页眉、页脚、cell的宽高，及间隔
        // 方法1 属性化设置（显示有点异常），或方法2-代理方法设置
//        layout.itemSize = CGSizeMake(widthCell, heightCell) // cell的宽高
//        layout.minimumLineSpacing = 10.0  // cell的上下间隔
//        layout.minimumInteritemSpacing = 10.0 // cell的左右间隔
//        layout.headerReferenceSize = CGSizeMake(width, heightHeader) // 页眉宽高
//        layout.footerReferenceSize = CGSizeMake(width, heightFooter) // 页脚宽高
    }
    
    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
    // MARK: header/footer的视图
    // 返回多少个组
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 10
    }
    
    // 返回HeadView的宽高
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        return CGSize(width: width, height: heightHeader)
    }
    
    // 返回footview的宽高
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
    {
        return CGSizeMake(width, heightFooter)
    }
    
    // 返回自定义HeadView或者FootView，我这里以headview为例
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
    {
        var reusableview:UICollectionReusableView!
        
        if kind == UICollectionElementKindSectionHeader
        {
            reusableview = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerIdentifier, forIndexPath: indexPath) as! CollectionReusableViewHeader
            reusableview.backgroundColor = UIColor.greenColor()
            
            (reusableview as! CollectionReusableViewHeader).label.text = String(format: "第 %d 个页眉", arguments: [indexPath.section])
        }
        else if kind == UICollectionElementKindSectionFooter
        {
            reusableview = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: footerIdentifier, forIndexPath: indexPath) as! CollectionReusableViewFooter
            reusableview.backgroundColor = UIColor.brownColor()
            
            (reusableview as! CollectionReusableViewFooter).label.text = String(format: "第 %d 个页脚", arguments: [indexPath.section])
        }
        
        return reusableview
    }
    
    // MARK: - cell视图
    
    // 返回多少个cell
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.mainArray.count
    }
    
    /**
     注意cell的大小与间距的关系，即cell的相对于父视图的大小受上下左右间距的大小影响，以及每个row显示的cell个数的影响。主要是计算宽度。
     如：每行显示2个，且上下左右间距为10.0，那么cell的大小相对于父视图来计算则是：cell的宽 = (父视图的宽 - 左右间距的大小 * (2 + 1)) / 2；cell的
    */
    // 返回cell的宽高
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize
    {
        return CGSizeMake(widthCell, heightCell)
    }
    
    // 返回cell 上下左右的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)
    }
    
    // 返回自定义的cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.layer.borderWidth = 0.3;
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        let model = self.mainArray.objectAtIndex(indexPath.row) as! Model
        let text = model.text
        cell.label!.text = text

        return cell
    }

    
    // MARK: 点击事件
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let text = String(format: ("你点击了第 %d-%d 个cell"), arguments: [indexPath.section + 1, indexPath.row + 1])
        let alert = UIAlertView(title: nil, message: text, delegate: nil, cancelButtonTitle: "知道了")
        alert.show()
    }

    
}

