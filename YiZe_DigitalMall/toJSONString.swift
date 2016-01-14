//
//  toJSONString.swift
//  		
//
//  Created by dmqlMAC on 16/1/14.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

func toJSONString(dict:[ShoppingCart]) -> NSString{
    
    let data = try! NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.PrettyPrinted)
    let strJson=NSString(data: data, encoding: NSUTF8StringEncoding)
    return strJson!
    
}