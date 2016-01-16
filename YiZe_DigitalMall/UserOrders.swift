//
//  UserOrders.swift
//  		
//
//  Created by dmqlMAC on 16/1/16.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import Foundation

class UserOrders:NSObject{
    var Order_ID:String?
    var Order_Time:String?
    var Order_State:String?
    var ConsigneeName:String?
    var ConsigneeAddress:String?
    var ConsigneeTelephone:String?
    var ConsigneeZipCode:String?
    var PaymentMethod:String?
    var DeliveryMode:String?
    var Order_Spare1:String?
    
    init(Order_ID:String?, Order_Time:String?, Order_State:String?, ConsigneeName:String?, ConsigneeAddress:String?, ConsigneeTelephone:String?, ConsigneeZipCode:String?, PaymentMethod:String?, DeliveryMode:String?, Order_Spare1:String?) {
        self.Order_ID = Order_ID
        self.Order_Time = Order_Time
        self.Order_State = Order_State
        self.ConsigneeName = ConsigneeName
        self.ConsigneeAddress = ConsigneeAddress
        self.ConsigneeTelephone = ConsigneeTelephone
        self.ConsigneeZipCode = ConsigneeZipCode
        self.PaymentMethod = PaymentMethod
        self.DeliveryMode = DeliveryMode
        self.Order_Spare1 = Order_Spare1
    }
}

class UserOrdersGoods:NSObject{
    var Goods_ID:String?
    var Goods_Image:String?
    var Goods_MemberPrice:String?
    var Goods_Name:String?
    
    init(Goods_ID:String?, Goods_Image:String?, Goods_MemberPrice:String?, Goods_Name:String?) {
        self.Goods_ID = Goods_ID
        self.Goods_Image = Goods_Image
        self.Goods_MemberPrice = Goods_MemberPrice
        self.Goods_Name = Goods_Name
    }
}
