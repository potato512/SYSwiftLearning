//
//  GameModel.swift
//  DemoSwift_2048
//
//  Created by zhangshaoyu on 17/5/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import Foundation

class GameModel {

    var dimenstion:Int = 0
    
    var titles:Array<Int>
    
    init(dimenstion:Int) {
        
        self.dimenstion = dimenstion
        
        self.titles = Array<Int>(count: self.dimenstion * self.dimenstion, repeatedValue: 0)
    }
    
    func setPosition(row:Int, col:Int, value:Int) -> Bool
    {
        assert(row >= 0 && row < dimenstion)
        assert(col >= 0 && col < dimenstion)
        
        let index = self.dimenstion * row + col
        let val = titles[index]
        if (0 < val)
        {
            print("该位置已经有值了")
            return false
        }
        
        titles[index] = value
        return true
    }
    
    func emptyPosition() -> [Int]
    {
        var emptyTitles = Array<Int>()
        
        for i in 0...(dimenstion * dimenstion)
        {
            if (0 == titles[i])
            {
                emptyTitles.append(i)
            }
        }
        return emptyTitles
    }
    
    func isFull() -> Bool
    {
        if (0 == emptyPosition().count)
        {
            return true
        }
        return false
    }
}
