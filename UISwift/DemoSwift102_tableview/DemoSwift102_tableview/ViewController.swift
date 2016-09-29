//
//  ViewController.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/9/27.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var fontTable:UITableView!
    var fontArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "所有字体"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "reload", style: UIBarButtonItemStyle.Done, target: self, action: Selector("reloadClick:"))
        
        showAllFonts()
        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - 显示系统所有字体名称
    func showAllFonts()
    {
        self.fontArray = NSMutableArray()
        
        let familyNames = UIFont.familyNames()
        
        var index:Int = 0
        
        for familyName in familyNames
        {
            let fontNames = UIFont.fontNamesForFamilyName(familyName as String)
            for fontName in fontNames
            {
                index++
                
                print("第 \(index) 个字体，字体font名称：\(fontName)")
                
                self.fontArray.addObject(fontName)
            }
        }
    }
    
    
    // MARK: - 初始化tableview

    func setUI()
    {
        // 初始化tableView
        self.fontTable = UITableView(frame:self.view.bounds,style:UITableViewStyle.Plain)
        self.view.addSubview(self.fontTable!)
        
        // 设置tableView的数据源
        self.fontTable!.dataSource = self
        // 设置tableView的委托
        self.fontTable!.delegate = self
//        // cell复用，register注册cell（暂时异常）
//        self.fontTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    // MARK: - 响应事件
    func reloadClick(button:UIBarButtonItem) -> Void
    {
        showAllFonts()
        
        self.fontTable.reloadData()
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.fontArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
//        var cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")! // 此写法异常
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "UITableViewCell")
            
            cell.textLabel?.textColor = UIColor.blackColor()
            cell.textLabel?.text = "当前字体"
            cell.detailTextLabel?.textColor = UIColor.lightGrayColor()
        }
        
        // 方法2，register方法注册
//        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
        
        let text:String = self.fontArray[indexPath.row as Int] as! String
        cell.textLabel?.font = UIFont(name: text, size: 20.0)
        cell.detailTextLabel?.text = text
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}

