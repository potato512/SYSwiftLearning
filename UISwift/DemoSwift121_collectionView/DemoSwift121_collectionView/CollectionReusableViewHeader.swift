//
//  CollectionReusableViewHeader.swift
//  DemoSwift121_collectionView
//
//  Created by zhangshaoyu on 16/11/8.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

import UIKit

let headerIdentifier = "CollectionReusableViewHeader"

class CollectionReusableViewHeader: UICollectionReusableView {
    
    var label:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.label = UILabel(frame: CGRectMake(10.0, 0.0, (CGRectGetWidth(self.bounds) - 10.0 * 2), heightHeader))
        self.addSubview(self.label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
