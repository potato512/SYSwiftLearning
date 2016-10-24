//
//  CustomTableVC2.swift
//  DemoSwift102_tableview
//
//  Created by zhangshaoyu on 16/10/24.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

class CustomTableVC2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var mainTableView:UITableView!
    var mainArray:NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "自定义tableview"
        
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
        let contents = ["比如，我有一个UIButton类，需要增加一个NSIndexPath属性。实现原理：创建一个UIButton的扩展类，在扩展类里添加NSIndexPath属性，当然创建这个属性时需要使用进行时的特性进行设置。使用UITableViewCell自定义列表显示内容。版权声明：本文为博主原创文章，未经博主允许不得转载。swift自定义UITableViewCell，并配置到UITableView的注意事项","使用TableViewController自定义列表。","版权声明：本文为博主原创文章，未经博主允许不得转载。swift自定义UITableViewCell，并配置到UITableView的注意事项","swift自定义UITableViewCell，并配置到UITableView的注意事项"]
        
        self.mainArray = NSMutableArray()
        
        for number in 1...20
        {
            let model = CustomModel()
            model.title = "方法/步骤"
            model.content = contents[random() % 4]
            model.contentStatus = true

            self.mainArray.addObject(model)
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
        self.mainTableView!.registerClass(CustomCell2.self, forCellReuseIdentifier: CustomCell2Identifier)
    }

    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    // MARK: cell单元格
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.mainArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
     
        let data:CustomModel! = self.mainArray[indexPath.row] as! CustomModel
        let height = CustomCell2.cellHeight(data)
        
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let data:CustomModel! = self.mainArray[indexPath.row] as! CustomModel
        let cell = CustomCell2(text: data.content, reuseIdentifier: CustomCell2Identifier)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
     
        let data:CustomModel! = self.mainArray[indexPath.row] as! CustomModel
        let height = CustomCell.cellHeight(data)
        print("当前点击的cell高度是：\(indexPath) === \(height)")
    }
}




