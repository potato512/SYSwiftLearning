//
//  MessageTableVC.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/10/21.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class MessageTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var mainTableView:UITableView!
    var mainArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "自定义tableview-消息"
        
        self.setLocalData()
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
    
    // MARK: - 数据
    func setLocalData()
    {
        self.mainArray = NSMutableArray()
        
        for number in 0...5
        {
            let me = "xiaohua"
            let you = "xiaoming"
            let first = MessageItem(body:"嘿，这张照片咋样，我周末拍的呢！", logo:me,
                date:NSDate(timeIntervalSinceNow:-600), mtype:ChatType.Mine)
            let second = MessageItem(image:UIImage(named:(number % 3 == 0 ? "luguhu.jpeg" : (number % 5 == 0 ? "01" : "normalImage")))!,logo:me,
                date:NSDate(timeIntervalSinceNow:-290), mtype:ChatType.Mine)
            let third = MessageItem(body:"太赞了，我也想去那看看呢！",logo:you,
                date:NSDate(timeIntervalSinceNow:-60), mtype:ChatType.Someone)
            let fouth = MessageItem(body:"嗯，下次我们一起去吧！",logo:me,
                date:NSDate(timeIntervalSinceNow:-20), mtype:ChatType.Mine)
            let fifth = MessageItem(body:"好的，一定！",logo:you,
                date:NSDate(timeIntervalSinceNow:0), mtype:ChatType.Someone)
                
            self.mainArray.addObject(first)
            self.mainArray.addObject(second)
            self.mainArray.addObject(third)
            self.mainArray.addObject(fouth)
            self.mainArray.addObject(fifth)
        }
    }
    
    // MARK: - 视图
    func setUI()
    {
        // 列表样式分plain，grouped，其中grouped在列表有页眉，页脚时会随cell滚动，而plain则是先固定后滚动
        self.mainTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.view.addSubview(self.mainTableView)
        self.mainTableView.backgroundColor = UIColor.clearColor()
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        self.mainTableView.tableFooterView = UIView()
        
        // 创建一个重用的单元格
        self.mainTableView!.registerClass(MessageCell.self, forCellReuseIdentifier: MessageCellIdentifier)
    }

    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    // MARK: cell单元格
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.mainArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let data:MessageItem! = self.mainArray[indexPath.row] as! MessageItem
        let height = max((data.insets.top + data.view.frame.size.height + data.insets.bottom + 28.0), 78.0)
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let data:MessageItem! = self.mainArray[indexPath.row] as! MessageItem
        let cell = MessageCell(data:data, reuseIdentifier: MessageCellIdentifier)
        
        if 0 == indexPath.row || 1 == indexPath.row
        {
            cell.showDetails()
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
      
        let data:MessageItem! = self.mainArray[indexPath.row] as! MessageItem
        let height = max((data.insets.top + data.view.frame.size.height + data.insets.bottom + 14.0 * 2), CGFloat(52.0 + 14.0 * 2))
        print("当前点击的cell高度是：\(height)")
    }
}

