//
//  CollectionViewCell.swift
//  DemoSwift121_collectionView
//
//  Created by zhangshaoyu on 16/11/8.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

let cellIdentifier = "CollectionViewCell"

class CollectionViewCell: UICollectionViewCell {
    
    var label:UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // 初始化各种控件
        self.label = UILabel(frame: CGRectMake(5.0, 5.0, (widthCell - 5.0 * 2), (heightCell - 5.0 * 2)))
        self.label.numberOfLines = 0
        self.label.font = UIFont.boldSystemFontOfSize(14.0)
        self.label.textColor = UIColor.lightGrayColor()
        self.contentView.addSubview(self.label)

        self.contentView.backgroundColor = UIColor.redColor()
        self.label.backgroundColor = UIColor.yellowColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
