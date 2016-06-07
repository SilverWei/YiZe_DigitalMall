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
    var User_ID:String?
    var ShoppingCart_ID:String?
    var Goods_Quantity:String?
    
    init(Goods_ID:String?, User_ID:String?, ShoppingCart_ID:String?, Goods_Quantity:String?) {
        self.Goods_ID = Goods_ID
        self.User_ID = User_ID
        self.ShoppingCart_ID = ShoppingCart_ID
        self.Goods_Quantity = Goods_Quantity
    }
}
