//
//  ViewController.swift
//  DemoSwift111_searchBar
//
//  Created by zhangshaoyu on 16/9/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github学习地址：https://github.com/potato512/SYSwiftLearning

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "searchBar的使用"
        
        // 实例化
        let searchbar = UISearchBar(frame: CGRectMake(10.0, 10.0, (CGRectGetWidth(self.view.frame) - 10.0 * 2), 40.0))
        self.view.addSubview(searchbar)
        
        searchbar.backgroundColor = UIColor.yellowColor()
        
        searchbar.barStyle = UIBarStyle.Default
        searchbar.barTintColor = UIColor.clearColor()
        
        searchbar.placeholder = "searchbar的使用"
        searchbar.tintColor = UIColor.redColor()
        searchbar.searchBarStyle = UISearchBarStyle.Minimal
        
        // 注意：showsBookmarkButton、showsSearchResultsButton不能同时设置
        searchbar.showsCancelButton = true
        searchbar.showsBookmarkButton = true
//        searchbar.showsSearchResultsButton = true
        
        searchbar.delegate = self
        
        // 键盘类型设置
        searchbar.keyboardType = UIKeyboardType.EmailAddress
        searchbar.returnKeyType = UIReturnKeyType.Done
        searchbar.secureTextEntry = false
        
        // 输入源设置（与textfiele、或textview类似）
//        searchbar.inputAccessoryView = nil
//        searchbar.inputView = nil
        
        
        // 第一响应，即进入编辑状态
        searchbar.becomeFirstResponder()
        // 放弃第一响应，即结束编辑
//        searchbar.resignFirstResponder()
//        searchbar.endEditing(true) // 结束编辑

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView()
    {
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        
        // UI适配
        if self.respondsToSelector(Selector("edgesForExtendedLayout"))
        {
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool  {
        print("1 searchBarShouldBeginEditing")

        return true
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        print("2 searchBarTextDidBeginEditing")
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print("3 searchBar")
        
        print("3 text=\(searchBar.text), string=\(searchText)")
    }
    
    func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        print("4 searchBar")
        
        print("4 text=\(searchBar.text), range=\(range), string=\(text)")
        
        return true
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool
    {
        print("5 searchBarShouldEndEditing")
  
        return true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        print("6 searchBarTextDidEndEditing")
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        print("7 searchBarSearchButtonClicked")
        
        searchBar.endEditing(true)
    }
    
    func searchBarBookmarkButtonClicked(searchBar: UISearchBar) {
        print("8 searchBarBookmarkButtonClicked")
        
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        print("9 searchBarCancelButtonClicked")
        
        searchBar.endEditing(true)
    }
    
    func searchBarResultsListButtonClicked(searchBar: UISearchBar) {
        print("10 searchBarResultsListButtonClicked")
        
        searchBar.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("11 searchBar")
    }
    
    
}

