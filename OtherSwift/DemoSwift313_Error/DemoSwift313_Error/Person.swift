//
//  Person.swift
//  DemoSwift313_Error
//
//  Created by zhangshaoyu on 17/6/13.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import Foundation

// 1 定义异常
enum BuyDrinksError : ErrorType {
//    case selectionError(message: String) // 选择无效
//    case moneyError(coinsNeeded: String) // 金额不足
//    case strokError(message: String)     // 缺货
    
    case selectionError // 选择无效
    case moneyError     // 金额不足
    case strokError     // 缺货
}

// 2 定义
struct itemDrink
{
    var price: Float
    var count: Int
}

// 3
var drinks = [
    "milk": itemDrink(price: 12.0, count: 7),
    "coca-cola": itemDrink(price: 10.0, count: 4),
    "OrangeJuice": itemDrink(price: 7.0, count: 11)
]


// 4
class Person {
    
    var name: String
    
    init(name: String)
    {
        self.name = name
    }
    
    // 5
    func buyDrinks(itemNamed name: String, price:Float, count:Int) throws -> Void
    {
//        guard let item = drinks[name] else
//        {
//            let message = "\(self.name)要买的饮料没有..."
//            throw BuyDrinksError.selectionError(message: message)
//            return message
//        }
//        
//        guard item.count >= count else
//        {
//            let message = "\(self.name)要买的饮料不够..."
//            throw BuyDrinksError.strokError(message: message)
//            return message
//        }
//        
//        guard item.price >= price else
//        {
//            let message = "\(self.name)的钱不够..."
//            throw BuyDrinksError.moneyError(coinsNeeded: message)
//            return message
//        }
//        
//        return ""
        
//        var message: String = ""
//        let item = drinks[name]
//        if (item == nil)
//        {
//            message = "\(self.name)要买的饮料没有..."
//            throw BuyDrinksError.selectionError(message: message)
//        }
//        else
//        {
//            if (item!.count < count)
//            {
//                message = "\(self.name)要买的饮料不够..."
//                throw BuyDrinksError.strokError(message: message)
//            }
//            
//            if (item!.price > price)
//            {
//                message = "\(self.name)的钱不够..."
//                throw BuyDrinksError.moneyError(coinsNeeded: message)
//            }
//        }
//        
//        return message
        
        let item = drinks[name]
        if (item == nil)
        {
            throw BuyDrinksError.selectionError
        }
        else
        {
            if (item!.count < count)
            {
                throw BuyDrinksError.strokError
            }
            
            if (item!.price > price)
            {
                throw BuyDrinksError.moneyError
            }
        }
    }
}


