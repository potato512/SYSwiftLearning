//
//  SortTableVC.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/10/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class SortTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var mainTableView:UITableView!
    var mainArray:NSMutableArray!
    let sortArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "排序tableview"
        
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
        
        for charTmp in self.sortArray
        {
            let array = NSMutableArray()
            let number = random() % 10 + 1
            for index in 1...number
            {
                let text = String(format: "%@-%ld", arguments: [charTmp, index])
                array.addObject(text)
            }
            
            let dict = NSMutableDictionary()
            dict.setObject(array, forKey: "sectionArray")
            dict.setObject(charTmp, forKey: "sectionTitle")
            
            self.mainArray.addObject(dict)
        }
    }
    
    // MARK: - 视图
    func setUI()
    {
        self.mainTableView = UITableView(frame: self.view.bounds, style: .Plain)
        self.view.addSubview(self.mainTableView)
        self.mainTableView.autoresizingMask = .FlexibleHeight
        self.mainTableView.backgroundColor = UIColor.clearColor()
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.tableFooterView = UIView.init()
        
        // 索引
        // 设置索引值颜色
        self.mainTableView.sectionIndexColor = UIColor.blueColor()
        // 设置选中时的索引背景颜色
        self.mainTableView.sectionIndexTrackingBackgroundColor = UIColor.clearColor();
        // 设置索引的背景颜色
        self.mainTableView.sectionIndexBackgroundColor = UIColor.clearColor()
    }
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let dict:NSDictionary! = self.mainArray.objectAtIndex(section) as! NSDictionary
        let array:NSArray! = dict.objectForKey("sectionArray") as! NSArray
        
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        if cell == nil
        {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "UITableViewCell")
        }
        
        let dict:NSDictionary! = self.mainArray.objectAtIndex(indexPath.section) as! NSDictionary
        let array:NSArray! = dict.objectForKey("sectionArray") as! NSArray
        let text:String! = array.objectAtIndex(indexPath.row) as! String
        cell.textLabel!.text = text
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: 索引（使用索引功能时，必须是有分组的列表，即有section分组）
    // section分组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.mainArray.count
    }
    
    // section分组标题（通常与索引值数组相同）
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let dict:NSDictionary! = self.mainArray.objectAtIndex(section) as! NSDictionary
        let text:String! = dict.objectForKey("sectionTitle") as! String
        
        return text
    }
    
    // 索引值数组
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return self.sortArray
    }
    
    // 索引值与列表关联点击事件
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        
        return index
    }
    
}
