//
//  GroupTableVC.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/10/20.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class GroupTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var mainTableView:UITableView!
    var mainArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "分组tableView"
        
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
            let rowArray:NSMutableArray = NSMutableArray()
            for rowNumber in 1...5
            {
                let rowNumberTmp = random() % 1000 + rowNumber
                rowArray.addObject(String(rowNumberTmp))
            }
            
            let dict:NSMutableDictionary = NSMutableDictionary()
            // cell值
            dict.setObject(rowArray, forKey: "rowCell")
            // 页眉，页脚标题
            let numberTmp = random() % 1000 + number
            dict.setObject(String(format: "headerTitle：%@", arguments: [String(numberTmp)]), forKey: "rowHeader")
            dict.setObject(String(format: "footerTitle：%@", arguments: [String(numberTmp)]), forKey: "rowFooter")
            // cell展开，或收起来状态
            dict.setObject(((number % 2 == 0) ? true : false), forKey: "rowStatus")
            
            self.mainArray.addObject(dict)
        }
    }
    
    // MARK: - 视图
    func setUI()
    {
        // 列表样式分plain，grouped，其中grouped在列表有页眉，页脚时会随cell滚动，而plain则是先固定后滚动
        self.mainTableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        self.view.addSubview(self.mainTableView)
        self.mainTableView.backgroundColor = UIColor.clearColor()
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        self.mainTableView.tableFooterView = UIView()
    }
    
    // MARK: - statusClick
    func statusClick(button:UIButton)
    {
        let section = button.tag
        
        let dict:NSMutableDictionary! = self.mainArray[section] as! NSMutableDictionary
        let status:Bool! = dict.objectForKey("rowStatus") as! Bool
        dict.setObject((status.boolValue ? false : true), forKey: "rowStatus")

        self.mainArray.replaceObjectAtIndex(section, withObject: dict)
        
        self.mainTableView.reloadSections(NSIndexSet(index: section), withRowAnimation: .None)
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    // 分组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.mainArray.count
    }
    
    // MARK: 页眉视图
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//        let dict:NSDictionary! = self.mainArray[section] as! NSDictionary
//        let title:String! = dict.objectForKey("rowHeader") as! String
//        
//        return title
//    }
    
    // 自定义页眉（注意：自定义时，高度与代理方法中的高度一致，同时代理方法中的标题失效）
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIButton(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(self.mainTableView.frame), 40.0))
        view.backgroundColor = UIColor.greenColor()
        view.contentHorizontalAlignment = .Center
        view.setTitleColor(UIColor.blackColor(), forState: .Normal)
        view.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        
        // 响应事件，用于修改cell显示状态，即打开，或收起来
        view.tag = section
        view.addTarget(self, action: Selector("statusClick:"), forControlEvents: .TouchUpInside)
        
        let dict:NSDictionary! = self.mainArray[section] as! NSDictionary
        let title:String! = dict.objectForKey("rowHeader") as! String
        view.setTitle(title, forState: .Normal)
        
        return view
    }
    
    // MARK: 页脚视图
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20.0
    }
    
//    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        
//        let dict:NSDictionary! = self.mainArray[section] as! NSDictionary
//        let title:String! = dict.objectForKey("rowFooter") as! String
//        
//        return title
//    }
    
    // 自定义页脚（注意：自定义时，高度与代理方法中的高度一致，同时代理方法中的标题失效）
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UILabel(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(self.mainTableView.frame), 40.0))
        view.backgroundColor = UIColor.yellowColor()
        view.textAlignment = .Center
        
        let dict:NSDictionary! = self.mainArray[section] as! NSDictionary
        let title:String! = dict.objectForKey("rowFooter") as! String
        view.text = title
        
        return view
    }
    
    // MARK: cell单元格
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let dict:NSDictionary! = self.mainArray[section] as! NSDictionary
        let status:Bool! = dict.objectForKey("rowStatus") as! Bool
        if status.boolValue
        {
            let array:NSArray! = dict.objectForKey("rowCell") as! NSArray
            return array.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "UITableViewCell")
            
            cell.textLabel!.adjustsFontSizeToFitWidth = true
            cell.textLabel!.font = UIFont.systemFontOfSize(12.0)
            
            cell.detailTextLabel!.font = UIFont.systemFontOfSize(20.0)
            cell.detailTextLabel!.textColor = UIColor.redColor()
        }
        
        let text = String(format: "%@", arguments: [indexPath])
        cell.textLabel!.text = text
        
        let dict:NSDictionary! = self.mainArray[indexPath.section] as! NSDictionary
        let array:NSArray! = dict.objectForKey("rowCell") as! NSArray
        let title:String! = array.objectAtIndex(indexPath.row) as! String
        cell.detailTextLabel!.text = title
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
