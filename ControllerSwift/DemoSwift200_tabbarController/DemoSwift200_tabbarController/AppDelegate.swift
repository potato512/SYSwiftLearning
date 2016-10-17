//
//  AppDelegate.swift
//  DemoSwift200_tabbarController
//
//  Created by zhangshaoyu on 16/9/30.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // 视图1
        let vc01 = UIViewController()
        vc01.title = "视图1"
        vc01.view.backgroundColor = UIColor.greenColor()
        let nav01 = UINavigationController(rootViewController: vc01)
        // 视图2
        let vc02 = UIViewController()
        vc02.title = "视图2"
        vc02.view.backgroundColor = UIColor.yellowColor()
        let nav02 = UINavigationController(rootViewController: vc02)
        // 视图3
        let vc03 = UIViewController()
        vc03.title = "视图3"
        vc03.view.backgroundColor = UIColor.orangeColor()
        let nav03 = UINavigationController(rootViewController: vc03)
        // 视图4
        let vc04 = UIViewController()
        vc04.title = "视图4"
        vc04.view.backgroundColor = UIColor.brownColor()
        let nav04 = UINavigationController(rootViewController: vc04)
        // 视图5
        let vc05 = UIViewController()
        vc05.title = "视图5"
        vc05.view.backgroundColor = UIColor.blueColor()
        let nav05 = UINavigationController(rootViewController: vc05)
        // 视图6
        let vc06 = UIViewController()
        vc06.title = "视图6"
        vc06.view.backgroundColor = UIColor.redColor()
        let nav06 = UINavigationController(rootViewController: vc06)
        
        // tabbarController
        let tabbarController = UITabBarController()
        tabbarController.tabBar.barTintColor = UIColor.blackColor()
        // 注意：视图控制器超过5个时（不包含5）会自动生成一个more视图标签，用来控制第5、6、...以后的视图控制器。
        tabbarController.viewControllers = [nav01, nav02, nav03, nav04, nav05, nav06]
        // 属性设置
        // 设置默认被选中视图控制器
        tabbarController.selectedIndex = 0;
        // 设置切换视图 tabBar 属性
        // 1 打开用户交互
        tabbarController.tabBar.userInteractionEnabled = true;
        // 2 设置背景颜色
        tabbarController.tabBar.backgroundColor = UIColor.whiteColor()
        // 3 设置背景图片
        tabbarController.tabBar.backgroundImage = UIImage(named: "")
        // 4 选中时的背景图片
        tabbarController.tabBar.selectionIndicatorImage = UIImage(named: "")
        
        // 设置标题，未选中状态图标，选中状态图标
        let barItem01 = UITabBarItem(title: "第1视图", image: UIImage(named: "tabbar01_normal"), selectedImage: UIImage(named: "tabbar01_selected"))
        vc01.tabBarItem = barItem01
        let barItem02 = UITabBarItem(title: "第2视图", image: UIImage(named: "tabbar02_normal"), selectedImage: UIImage(named: "tabbar02_selected"))
        vc02.tabBarItem = barItem02
        let barItem03 = UITabBarItem(title: "第3视图", image: UIImage(named: "tabbar03_normal"), selectedImage: UIImage(named: "tabbar03_selected"))
        vc03.tabBarItem = barItem03
        let barItem04 = UITabBarItem(title: "第4视图", image: UIImage(named: "tabbar04_normal"), selectedImage: UIImage(named: "tabbar04_selected"))
        vc04.tabBarItem = barItem04
        let barItem05 = UITabBarItem(title: "第5视图", image: UIImage(named: "tabbar05_normal"), selectedImage: UIImage(named: "tabbar05_selected"))
        vc05.tabBarItem = barItem05
        let barItem06 = UITabBarItem(title: "第6视图", image: UIImage(named: "tabbar06_normal"), selectedImage: UIImage(named: "tabbar06_selected"))
        vc06.tabBarItem = barItem06
      
        // 设置字体颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: UIControlState.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.greenColor()], forState: UIControlState.Selected)
        // 设置字体大小
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont.systemFontOfSize(8.0)], forState: UIControlState.Normal)
        // 设置字体偏移
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0.0, -5.0)
        // 设置图标选中时颜色
        UITabBar.appearance().tintColor = UIColor.redColor()
        
        self.window!.rootViewController = tabbarController
        self.window!.makeKeyAndVisible()
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

