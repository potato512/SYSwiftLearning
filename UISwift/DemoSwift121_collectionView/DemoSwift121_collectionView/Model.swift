//
//  Model.swift
//  DemoSwift121_collectionView
//
//  Created by zhangshaoyu on 16/11/8.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

let width = UIScreen.mainScreen().bounds.size.width
let widthCell = (width - 10.0 * 3) / 2
let heightHeader:CGFloat = 40.0
let heightFooter:CGFloat = 20.0
let heightCell:CGFloat = 80.0

class Model: NSObject {

    var text:String!
    
    override init() {
        super.init()
    }
    
}
