//
//  OrdersReposityNet.swift
//  		
//
//  Created by dmqlMAC on 16/1/16.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import Foundation

func GetUserOrdersOut(User_ID:String) -> [UserOrders]?
{
    var UserOrdersAll = [UserOrders]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetMyOrder.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        let param = [
            "User_ID": User_ID
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            for i in 0..<json.count{
                //Do something you want
                UserOrdersAll.append(UserOrders(
                    Order_ID: json[i]["Order_ID"].string,
                    Order_Time: json[i]["Order_Time"].string,
                    Order_State: json[i]["Order_State"].string,
                    ConsigneeName: json[i]["ConsigneeName"].string,
                    ConsigneeAddress: json[i]["ConsigneeAddress"].string,
                    ConsigneeTelephone: json[i]["ConsigneeTelephone"].string,
                    ConsigneeZipCode: json[i]["ConsigneeZipCode"].string,
                    PaymentMethod: json[i]["PaymentMethod"].string,
                    DeliveryMode: json[i]["DeliveryMode"].string,
                    Order_Spare1: json[i]["Order_Spare1"].string
                    ))
            }
            
        }
        else{
            return nil
        }
    }
    return UserOrdersAll
}

func GetUserOrdersInfoOut(User_ID:String, Orders_ID:String) -> UserOrders?
{
    var UserOrdersInfo:UserOrders?
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetMyOrder.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        let param = [
            "User_ID": User_ID
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            for i in 0..<json.count{
                //Do something you want
                if(json[i]["Order_ID"].string == Orders_ID){
                    UserOrdersInfo = UserOrders(
                        Order_ID: json[i]["Order_ID"].string,
                        Order_Time: json[i]["Order_Time"].string,
                        Order_State: json[i]["Order_State"].string,
                        ConsigneeName: json[i]["ConsigneeName"].string,
                        ConsigneeAddress: json[i]["ConsigneeAddress"].string,
                        ConsigneeTelephone: json[i]["ConsigneeTelephone"].string,
                        ConsigneeZipCode: json[i]["ConsigneeZipCode"].string,
                        PaymentMethod: json[i]["PaymentMethod"].string,
                        DeliveryMode: json[i]["DeliveryMode"].string,
                        Order_Spare1: json[i]["Order_Spare1"].string
                    )
                    
                return UserOrdersInfo
                }

            }
            
        }
        else{
            return nil
        }
    }
    return UserOrdersInfo
}

func GetUserOrdersGoodsOut(User_ID:String) -> [UserOrdersGoods]?
{
    var UserOrdersGoodsAll = [UserOrdersGoods]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetOrderGoods.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        let param = [
            "User_ID": User_ID
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            for i in 0..<json.count{
                //Do something you want
                UserOrdersGoodsAll.append(UserOrdersGoods(Goods_ID: json[i]["Goods_ID"].string, Goods_Image: json[i]["Goods_Image"] != nil ? BaseUrlImg + json[i]["Goods_Image"].string! : "", Goods_MemberPrice: json[i]["Goods_MemberPrice"].string, Goods_Name: json[i]["Goods_Name"].string))
                
            }
            
        }
        else{
            return nil
        }
    }
    return UserOrdersGoodsAll
}