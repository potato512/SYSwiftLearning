//
//  ViewController.swift
//  DemoSwift307_animation
//
//  Created by zhangshaoyu on 2017/7/14.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var array:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "动画"
        
        self.array = ["UIView", "CABasicAnimation", "CAKeyframeAnimation"]
        
        let table = UITableView(frame: self.view.bounds)
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

    // MARK: - UITableViewDataSource, UITableViewDelegate

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.array!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")
        
        let text = self.array[indexPath.row]
        cell!.textLabel?.text = text as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if 0 == indexPath.row
        {
            let nextVC = viewAnimationVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if 1 == indexPath.row
        {
            let nextVC = CABasicAnimationVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if 2 == indexPath.row
        {
            let nextVC = CAKeyframeAnimationVC()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

