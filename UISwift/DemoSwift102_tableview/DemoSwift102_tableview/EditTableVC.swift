//
//  EditTableVC.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/10/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class EditTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var mainTableView:UITableView!
    var mainArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "editTable"
        
        // 切换列表的编辑模式
        // 方法1 自定义按钮
//        let editButton = UIButton(type: .Custom)
//        editButton.frame = CGRectMake(0.0, 0.0, 60.0, 40.0)
//        editButton.setTitle("edit", forState: .Normal)
//        editButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
//        editButton.selected = false
//        editButton.addTarget(self, action: Selector("editClick:"), forControlEvents: .TouchUpInside)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: editButton)
        // 方法2 系统按钮
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
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
    
    // MARK: - click
    func editClick(button:UIButton)
    {
        // 进入编辑模式，或退出编辑模式
        // 方式1
//        self.mainTableView.editing = !self.mainTableView.editing
//        
//        button.setTitle((self.mainTableView.editing ? "done" : "edit"), forState: .Normal)
        
        // 方法2
        button.selected = !button.selected
        self.mainTableView.setEditing(button.selected, animated: true)
        
        button.setTitle((button.selected ? "done" : "edit"), forState: .Normal)
    }
    
    // 进入编辑模式（结合导航栏编辑按钮使用：self.navigationItem.rightBarButtonItem = self.editButtonItem()）
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.mainTableView.setEditing(editing, animated: true)
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
    
    
    // MARK: - cell编辑
//    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
//        
//    }
    
//    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
    
    // MARK: 删除，或插入
    // cell的编辑样式
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row == self.mainArray.count - 1
        {
            // 最后一个时插入
            return UITableViewCellEditingStyle.Insert
        }
        else if indexPath.row == 0
        {
            // 第一个没有编辑模式
            return UITableViewCellEditingStyle.None
        }
        
        // 其他cell为删除的编辑模式（设置tableView的editing属性进行删除操作；或左滑cell进行删除操作）
        return UITableViewCellEditingStyle.Delete
    }
    
    // cell的删除编辑样式下按钮标题
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "删除"
    }
    
    // cell的编辑响应
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete)
        {
            // 删除数据方法1（先删除数据，再重新加载全部数据）
//            self.mainArray.removeObjectAtIndex(indexPath.row)
//            self.mainTableView.reloadData()
            
            // 删除数据方法2（先删除数据，再删除cell）
            self.mainArray.removeObjectAtIndex(indexPath.row)
            self.mainTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        }
        else if (editingStyle == UITableViewCellEditingStyle.Insert)
        {
            // 添加数据方法1（先添加数据，再重新加载全部数据）
//            self.mainArray.addObject("添加数据")
//            self.mainTableView.reloadData()
            
            // 添加数据方法2（先添加数据，再添加cell）
            self.mainArray.addObject("添加数据")
            self.mainTableView.insertRowsAtIndexPaths([NSIndexPath(forRow: (self.mainArray.count - 1), inSection: 0)], withRowAnimation: UITableViewRowAnimation.None)
        }
    }
    
    // MARK: 移动（注意：两个代理方法必须同时实现）
    
    // cell可移动
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // 移动cell事件
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        if fromIndexPath != toIndexPath
        {
            // 获取移动行对应的值
            let itemValue = self.mainArray[fromIndexPath.row]
            // 删除移动的值
            self.mainArray.removeObjectAtIndex(fromIndexPath.row)
            
            // 如果移动区域大于现有行数，直接在最后添加移动的值
            if toIndexPath.row > self.mainArray.count
            {
                self.mainArray.addObject(itemValue)
            }
            else
            {
                // 没有超过最大行数，则在目标位置添加刚才删除的值
                self.mainArray.insertObject(itemValue, atIndex:toIndexPath.row)
            }
        }
    }
}
