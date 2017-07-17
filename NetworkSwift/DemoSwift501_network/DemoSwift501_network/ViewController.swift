//
//  ViewController.swift
//  DemoSwift501_network
//
//  Created by zhangshaoyu on 2017/7/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var array:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "网络请求"
        
        self.array = ["NSURL", "NSURLRequest", "NSURLConnection", "NSURLSession", "NSURLSessionDataTask"]
        
        
        let table = UITableView(frame: self.view.bounds, style: .Plain)
        self.view.addSubview(table)
        table.tableFooterView = UIView()
        table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        table.delegate = self
        table.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        
        let text:String = self.array[indexPath.row] as! String
        cell!.textLabel!.text = text
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let text:String = self.array[indexPath.row] as! String
        if text == "NSURLSessionDataTask"
        {
            let nextVC = NetworkVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if text == "NSURLConnection"
        {
            let nextVC = ConnectionVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if text == "post无参数"
        {
            
        }
        else if text == "post有参数"
        {
            
        }
    }
    
}

/*

http://blog.csdn.net/u013406800/article/details/54581108

http://www.cnblogs.com/jadonblog/p/6945974.html

http://blog.csdn.net/abcd2686529828/article/details/51323673


*/




