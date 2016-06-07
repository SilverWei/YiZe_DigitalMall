//
//  GoodsReposityNet.swift
//  		
//
//  Created by dmqlMAC on 16/1/12.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import Foundation

func GetSort1stSub() -> [GoodsSort1st]?
{
    var GoodsSort1stGet = [GoodsSort1st]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetGoodsType.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"

        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)

            let json = JSON(data: response)
            
            for i in 0..<json.count{
                //Do something you want
                GoodsSort1stGet.append(GoodsSort1st(GoodsSort1st_ID: json[i]["GoodsCategory_ID"].stringValue, GoodsSort1st_Name: json[i]["GoodsCategory_Name"].stringValue))
            }
        }
        else{
            return nil
        }
    }
    return GoodsSort1stGet
}

func GetSort2ndSub(GoodsCategory_ID:String) -> [GoodsSort2nd]?
{
    var GetSort2ndGet = [GoodsSort2nd]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetGoodsSubType.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        let param = [
            "GoodsCategory_ID": GoodsCategory_ID
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            
            for i in 0..<json.count{
                //Do something you want
                GetSort2ndGet.append(GoodsSort2nd(GoodsSort2nd_ID: json[i]["GoodsSubCategory_ID"].stringValue, GoodsSort2nd_Name: json[i]["GoodsSubCategory_Name"].stringValue))
            }
        }
        else{
            return nil
        }
    }
    return GetSort2ndGet
}

func GetSort1stName(Sort1stId:String) -> String?
{
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetGoodsType.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"

        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            
            for i in 0..<json.count{
                //Do something you want
                if(json[i]["GoodsCategory_ID"].stringValue == Sort1stId){
                    return json[i]["GoodsCategory_Name"].stringValue
                }
            }
        }
        else{
            return nil
        }
    }
    return nil
}

func GetSort2ndName(Sort1stId:String, Sort2ndId:String) -> String?
{
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetGoodsSubType.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        let param = [
            "GoodsCategory_ID": Sort1stId
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            
            for i in 0..<json.count{
                //Do something you want
                if(json[i]["GoodsSubCategory_ID"].stringValue == Sort2ndId){
                    return json[i]["GoodsSubCategory_Name"].stringValue
                }
            }
        }
        else{
            return nil
        }
    }
    return nil
}

func SearchInfo(SearchInfoInGet:SearchInfoIn) -> [SearchInfoOut]?
{
    var SearchInfoOutGet = [SearchInfoOut]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "Search.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        let param = [
            "Goods_Name": SearchInfoInGet.Goods_Name! as String,
            "GoodsSubCategory_ID": SearchInfoInGet.GoodsSort2nd_ID! as String
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            for i in 0..<json.count{
                //Do something you want
                SearchInfoOutGet.append(SearchInfoOut(Goods_ID: json[i]["Goods_ID"].stringValue, Goods_Name: json[i]["Goods_Name"].stringValue, Goods_Image: json[i]["Goods_Image"] != nil ? BaseUrlImg + json[i]["Goods_Image"].string! : "", Goods_MarketPrice: json[i]["Goods_MarketPrice"].stringValue, Goods_MemberPrice: json[i]["Goods_MemberPrice"].stringValue))
            }
        }
        else{
            return nil
        }
    }
    return SearchInfoOutGet
}

func GoodsInfoOut(GoodsId:String) -> GetGoodsInfo?
{
    var GetGoodsInfoGet:GetGoodsInfo?
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetGoodsInfo.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        let param = [
            "Goods_ID": GoodsId
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            GetGoodsInfoGet = GetGoodsInfo(
                Goods_ID: json["Goods_ID"].string!,
                Goods_Name: json["Goods_Name"].string!,
                Goods_Image: json["Goods_Image"] != nil ? BaseUrlImg + json["Goods_Image"].string! : "",
                Goods_MarketPrice: json["Goods_MarketPrice"].string!,
                Goods_MemberPrice: json["Goods_MemberPrice"].string!,
                Goods_InventoryNumber: json["Goods_InventoryNumber"].string!,
                Goods_Score: json["Goods_Score"].string!,
                Goods_PurchaseIntegral: json["Goods_PurchaseIntegral"].string!,
                Goods_Introduction: json["Goods_Introduction"].string!,
                Goods_Recommend: json["Goods_Recommend"].string!,
                Goods_Time: json["Goods_Time"].string!,
                Goods_Sort1: json["Goods_Spare1"].string!,
                Goods_Sort2: json["Goods_Spare2"].string!,
                Goods_RecommendTime: json["Goods_RecommendTime"].string!
            )
        }
        else{
            return nil
        }
    }
    return GetGoodsInfoGet
}

func GetNewGoods() -> [SearchInfoOut]?
{
    var GetNewGoodsAll = [SearchInfoOut]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetNewGoods.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"

        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            for i in 0..<json.count{
                //Do something you want
                GetNewGoodsAll.append(SearchInfoOut(Goods_ID: json[i]["Goods_ID"].stringValue, Goods_Name: json[i]["Goods_Name"].stringValue, Goods_Image: json[i]["Goods_Image"] != nil ? BaseUrlImg + json[i]["Goods_Image"].string! : "", Goods_MarketPrice: json[i]["Goods_MarketPrice"].stringValue, Goods_MemberPrice: json[i]["Goods_MemberPrice"].stringValue))
            }
        
        }
        else{
            return nil
        }
    }
    return GetNewGoodsAll
}

func Recommended() -> [SearchInfoOut]?
{
    var RecommendedAll = [SearchInfoOut]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "Recommended.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            for i in 0..<json.count{
                //Do something you want
                RecommendedAll.append(SearchInfoOut(Goods_ID: json[i]["Goods_ID"].stringValue, Goods_Name: json[i]["Goods_Name"].stringValue, Goods_Image: json[i]["Goods_Image"] != nil ? BaseUrlImg + json[i]["Goods_Image"].string! : "", Goods_MarketPrice: json[i]["Goods_MarketPrice"].stringValue, Goods_MemberPrice: json[i]["Goods_MemberPrice"].stringValue))
            }
            
        }
        else{
            return nil
        }
    }
    return RecommendedAll
}

func GetHotGoods() -> [SearchInfoOut]?
{
    var GetHotGoodsAll = [SearchInfoOut]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetHotGoods.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            for i in 0..<json.count{
                //Do something you want
                GetHotGoodsAll.append(SearchInfoOut(Goods_ID: json[i]["Goods_ID"].stringValue, Goods_Name: json[i]["Goods_Name"].stringValue, Goods_Image: json[i]["Goods_Image"] != nil ? BaseUrlImg + json[i]["Goods_Image"].string! : "", Goods_MarketPrice: json[i]["Goods_MarketPrice"].stringValue, Goods_MemberPrice: json[i]["Goods_MemberPrice"].stringValue))
            }
            
        }
        else{
            return nil
        }
    }
    return GetHotGoodsAll
}

func GetShoppingCart(User_ID:String) -> [ShoppingCart]?
{
    var GetShoppingCart = [ShoppingCart]()
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetShoppingCart.ashx") as String) {
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
                GetShoppingCart.append(ShoppingCart(Goods_ID: json[i]["Goods_ID"].stringValue, User_ID: json[i]["User_ID"].stringValue, ShoppingCart_ID: json[i]["Shopping_ID"].stringValue, Goods_Quantity: json[i]["Shopping_Number"].stringValue))
            }
        }
        else{
            return nil
        }
    }
    return GetShoppingCart
}

func ShoppingCartHaveYes(User_ID:String, ShoppingCart_ID: String) -> String?
{
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetShoppingCart.ashx") as String) {
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
                if(json[i]["Goods_ID"].stringValue == ShoppingCart_ID){
                    return json[i]["Shopping_ID"].stringValue
                }
            }
        }
    }
    return nil
}

func AddShoppingCarOut(ShoppingCartIn:ShoppingCart) -> String?
{
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "AddShoppingCart.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        let param = [
            "User_ID": ShoppingCartIn.User_ID! as String,
            "Shopping_Number": "1",
            "Goods_ID": ShoppingCartIn.Goods_ID! as String,
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            return json["Code"].stringValue

        }
    }
    return nil
}

func DelectShoppingCarOut(Shopping_ID:String) -> String?
{
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "DelectShoppingCart.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        let param = [
            "Shopping_ID": Shopping_ID,
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            
            let json = JSON(data: response)
            return json["Code"].stringValue
            
        }
    }
    return nil
}


