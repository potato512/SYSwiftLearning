//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var j:Int = 0
var i:Int
for (i = 1; i < 10; i++)
{
    j = j + i;
}

var button = UIButton.init(frame: CGRectMake(0.0, 0.0, 200.0, 30.0))
button.setTitle(str, forState: .Normal)
button.backgroundColor = UIColor.redColor()
button.setTitleColor(UIColor.blackColor(), forState: .Normal)
