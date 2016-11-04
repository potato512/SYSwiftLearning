//
//  MoreButtonEditTableVC.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/11/4.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class MoreButtonEditTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var mainTableView:UITableView!
    var mainArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "morebutton edit Table"
        
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
        
        for number in 1...10
        {
            let numberTmp = random() % 1000 + number
            self.mainArray.addObject(String(numberTmp))
        }
    }

    // MARK: - 视图
    func setUI()
    {
        self.mainTableView = UITableView(frame: self.view.bounds, style: .Plain)
        self.view.addSubview(self.mainTableView)
        self.mainTableView.backgroundColor = UIColor.clearColor()
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        self.mainTableView.tableFooterView = UIView()
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mainArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        if cell == nil
        {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "UITableViewCell")
        }
        
        let text = self.mainArray[indexPath.row] as! String
        cell.textLabel!.text = text
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    // 更多按钮设置
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
    {
        let top = UITableViewRowAction(style: .Normal, title: "置顶") {
            action, index in
            print("more button tapped")
            self.alertShow("置顶")
        }
        top.backgroundColor = UIColor.lightGrayColor()
        
        let readed = UITableViewRowAction(style: .Normal, title: "标为已读") {
            action, index in
            print("favorite button tapped")
            self.alertShow("标为已读")
        }
        readed.backgroundColor = UIColor.orangeColor()
        
        let delete = UITableViewRowAction(style: .Normal, title: "删除") {
            action, index in
            print("share button tapped")
            self.alertShow("删除")
        }
        delete.backgroundColor = UIColor.blueColor()
        
        return [top, readed, delete]
    }
    
    /*
    // 编辑状态
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        // 要显示自定义的action,cell必须处于编辑状态
        return true
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        // 同时你也需要实现本方法,否则自定义action是不会显示的,啦啦啦
    }
    */
    
    
    // MARK: - alert
    func alertShow(title:String)
    {
        let alertView = UIAlertView(title: nil, message: title, delegate: nil, cancelButtonTitle: "知道了");
        alertView.show()
    }
    
}
