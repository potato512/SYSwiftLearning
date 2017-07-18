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
        
        self.array = ["NSURL", "NSURLRequest", "NSURLConnection", "NSURLSessionDataTask", "Alamofire"]
        
        
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
            let nextVC = SessionDataTaskVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if text == "NSURLConnection"
        {
            let nextVC = ConnectionVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if text == "Alamofire"
        {
            let nextVC = AlamofireVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if text == "NSURLRequest"
        {
            let nextVC = RequestVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if text == "NSURL"
        {
            let nextVC = URLVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
}





