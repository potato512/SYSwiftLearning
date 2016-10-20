//
//  NormalTableVC.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/10/19.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class NormalTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var mainTableView:UITableView!
    var mainArray:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "所有字体"
        
        let header = UIBarButtonItem(title: "header", style: .Done, target: self, action: Selector("buttonClick:"))
        header.tag = 1
        let center = UIBarButtonItem(title: "center", style: .Done, target: self, action: Selector("buttonClick:"))
        center.tag = 2
        let footer = UIBarButtonItem(title: "footer", style: .Done, target: self, action: Selector("buttonClick:"))
        footer.tag = 3
        self.navigationItem.rightBarButtonItems = [header,center,footer]
        
        showAllFonts()
        setUI()
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

    // MARK: - 显示系统所有字体名称
    func showAllFonts()
    {
        self.mainArray = NSMutableArray()
        
        let familyNames = UIFont.familyNames()
        
        var index:Int = 0
        
        for familyName in familyNames
        {
            let fontNames = UIFont.fontNamesForFamilyName(familyName as String)
            for fontName in fontNames
            {
                index++
                
                print("第 \(index) 个字体，字体font名称：\(fontName)")
                
                self.mainArray.addObject(fontName)
            }
        }
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
        // 背景颜色
        self.mainTableView.backgroundColor = UIColor.clearColor()
        // 背景图片
        let bgroundView = UIImageView(frame: self.view.bounds)
        bgroundView.image = UIImage(named: "01")
        self.mainTableView.backgroundView = bgroundView
        
        // 其他属性
        self.mainTableView.scrollEnabled = true
        self.mainTableView.scrollsToTop = true
        
        
        // 去掉底端多余分割线，即表尾视图
        let footerLabel = UILabel(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(self.mainTableView.frame), 100.0))
        footerLabel.backgroundColor = UIColor.greenColor()
        footerLabel.text = "列表视图的表尾视图"
        footerLabel.textAlignment = NSTextAlignment.Center
        self.mainTableView.tableFooterView = footerLabel
        // 表头视图
        let headerLabel = UILabel(frame: CGRectMake(0.0, 0.0, CGRectGetWidth(self.mainTableView.frame), 40.0))
        headerLabel.backgroundColor = UIColor.brownColor()
        headerLabel.text = "列表视图的表头视图"
        headerLabel.textAlignment = NSTextAlignment.Center
        self.mainTableView.tableHeaderView = headerLabel
        
    }
    
    // MARK: - 响应事件
    func buttonClick(button:UIBarButtonItem) -> Void
    {
        let index = button.tag
        if 1 == index
        {
            // 返回顶部
            self.mainTableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
        }
        else if 2 == index
        {
            // 回到中间
            self.mainTableView.scrollToRowAtIndexPath(NSIndexPath(forRow: (self.mainArray.count - 1) / 2, inSection: 0), atScrollPosition: UITableViewScrollPosition.Middle, animated: true)
        }
        else if 3 == index
        {
            // 去到底部
            self.mainTableView.scrollToRowAtIndexPath(NSIndexPath(forRow: (self.mainArray.count - 1), inSection: 0), atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        }
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
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "UITableViewCell")
            
            cell.textLabel!.textColor = UIColor.blackColor()
            cell.textLabel!.text = "当前字体"
            cell.textLabel!.font = UIFont.systemFontOfSize(12.0)
            
            cell.detailTextLabel?.textColor = UIColor.lightGrayColor()
            cell.detailTextLabel!.font = UIFont.systemFontOfSize(12.0)
        }

        // cell附件类型
        cell.accessoryType = UITableViewCellAccessoryType.None
        switch indexPath.row
        {
            case 0:
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            break
            
            case 1:
                cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            break
            
            case 2:
                cell.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
            break
            
            case 3:
                cell.accessoryType = UITableViewCellAccessoryType.DetailButton
            break
            
            case 4:
                let imageview = UIImageView(image: UIImage(named: "normalImage"))
                imageview.frame = CGRectMake(0.0, 0.0, 30.0, 30.0)
                cell.accessoryView = imageview
            break
            
            default:
                cell.accessoryType = UITableViewCellAccessoryType.DetailButton
            break
        }
        
        // cell图标
        cell.imageView!.image = UIImage(named: "normalImage")
        
        let text:String = self.mainArray[indexPath.row as Int] as! String
        cell.detailTextLabel!.text = text
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    // MARK: - 附件类型
    
    // cell类型为 DetailDisclosureButton，或DetailButton 时的点击响应事件
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        print("点击了：\(indexPath.row)")
    }
    
    // cell附件类型（注意：不能同时设置cell.accessoryType = UITableViewCellAccessoryType.None）
//    func tableView(tableView: UITableView, accessoryTypeForRowWithIndexPath indexPath: NSIndexPath) -> UITableViewCellAccessoryType {
//        return UITableViewCellAccessoryType.Checkmark
//    }
}
