//
//  ViewController.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/9/27.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var mainTableView:UITableView!
    var mainArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "tableView"

        
        setLocalData()
        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        
        super.loadView()
        
        // 视图控制器背景颜色
        self.view.backgroundColor = UIColor.greenColor()
        
        // UI适配
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    
    // MARK: - 本地数据
    func setLocalData()
    {
        self.mainArray = NSMutableArray()
        self.mainArray.addObject("normal Table")
        self.mainArray.addObject("edit Table")
        self.mainArray.addObject("sort Table")
        self.mainArray.addObject("group Table")
        self.mainArray.addObject("custom Table")
    }
    
    // MARK: - 初始化tableview
    func setUI()
    {
        // 初始化tableView
        self.mainTableView = UITableView(frame:self.view.bounds,style:UITableViewStyle.Plain)
        self.view.addSubview(self.mainTableView!)
        
        // 设置tableView的数据源
        self.mainTableView!.dataSource = self
        // 设置tableView的委托
        self.mainTableView!.delegate = self
        
        // 去掉底端多余分割线
        self.mainTableView.tableFooterView = UIView()        
        // 背景颜色
        self.mainTableView.backgroundColor = UIColor.clearColor()
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.mainArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // var cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")! // 此写法异常
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "UITableViewCell")
            
            // cell标题
            cell.textLabel!.textColor = UIColor.lightGrayColor()
            cell.textLabel!.text = "列表tableView的类型"
            cell.textLabel!.font = UIFont.systemFontOfSize(12.0)
            
            cell.detailTextLabel!.textColor = UIColor.blackColor()
            cell.detailTextLabel!.font = UIFont.systemFontOfSize(12.0)
        }
        
        // cell副标题
        let text:String = self.mainArray[indexPath.row as Int] as! String
        cell.detailTextLabel!.text = text
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch indexPath.row
        {
            case 0:
                let nextVC = NormalTableVC()
                self.navigationController!.pushViewController(nextVC, animated: true)
            break
            
            case 1:
                let nextVC = EditTableVC()
                self.navigationController!.pushViewController(nextVC, animated: true)
            break
            
            case 2:
                let nextVC = SortTableVC()
                self.navigationController!.pushViewController(nextVC, animated: true)
            break
            
            case 3:
                let nextVC = GroupTableVC()
                self.navigationController!.pushViewController(nextVC, animated: true)
            break
            
            case 4:
                let nextVC = CustomTableVC()
                self.navigationController!.pushViewController(nextVC, animated: true)
            break
            
            default: break
        }
    }

}

/*
列表视图控制器

1、常规列表视图（有header，有footer，其他属性：cell附件、跳转到指定位置）
2、可编辑列表视图（添加、删除、移动）
3、带搜索列表视图（搜索、索引）
4、群组列表视图（类似于QQ联系人分组，可打开，折叠）
5、自定义cell列表视图（动态高度）

*/




