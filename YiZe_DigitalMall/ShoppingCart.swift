//
//  ShoppingCart.swift
//  		
//
//  Created by dmqlMAC on 16/1/14.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import Foundation

class ShoppingCart:NSObject{
    var Goods_ID:String?
    var Goods_Quantity:Int?
    
    init(Goods_ID:String?, Goods_Quantity:Int?) {
        self.Goods_ID = Goods_ID
        self.Goods_Quantity = Goods_Quantity
    }
}