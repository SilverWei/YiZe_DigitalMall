//
//  UserReposityNet.swift
//  		
//
//  Created by dmqlMAC on 16/1/11.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import Foundation
var BaseUrl = "http://172.16.101.42/Ashx/"
var BaseUrlImg = "http://172.16.101.42"

func UserLogin(用户名 UserName:String, 密码 Password:String) -> UserInfo.UserLoginOut?
{
    var LoginOut:UserInfo.UserLoginOut?

    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "Login.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        
        let param = [
            "User_Name": UserName,
            "User_Password": Password,
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            let json = JSON(data: response)
            LoginOut = UserInfo.UserLoginOut(
                User_ID: json["User_ID"].string,
                Code: json["Code"].int)
        }
        else{
            return nil
        }
    }
    return LoginOut
}

func UserRegister(UserRegisterIn:UserInfo.UserRegisterIn) -> UserInfo.UserRegisterOut?
{
    var UserregisterOut:UserInfo.UserRegisterOut?
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "Register.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        
        let param = [
            "User_Name": UserRegisterIn.User_Name!,
            "User_Password": UserRegisterIn.User_Password!,
            "User_Maill": UserRegisterIn.User_Maill!,
            "User_Telephone": UserRegisterIn.User_Telephone!,
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            let json = JSON(data: response)
            UserregisterOut = UserInfo.UserRegisterOut(
                User_ID: json["User_ID"].string,
                Code: json["Code"].int)
        }
        else{
            return nil
        }
    }
    return UserregisterOut
}

func GetUserInfo(User_Id:String) -> UserInfo.GetUserInfo?
{
    var GetUserInfo:UserInfo.GetUserInfo?
    
    if let url = NSURL(string: NSString(format: "%@%@", BaseUrl , "GetUserInfo.ashx") as String) {
        let postRequest = NSMutableURLRequest(URL: url)
        postRequest.timeoutInterval = 3.0
        postRequest.HTTPMethod = "POST"
        
        let param = [
            "User_ID": User_Id,
        ]
        let jsonparam = try? NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
        postRequest.HTTPBody = jsonparam
        if let response = try? NSURLConnection.sendSynchronousRequest(postRequest, returningResponse: nil) {
            
            let responsestr = NSString(data: response, encoding: NSUTF8StringEncoding)
            print(responsestr)
            let json = JSON(data: response)
            GetUserInfo = UserInfo.GetUserInfo(
                User_Name: json["User_Name"].string,
                User_Mail: json["User_Maill"].string,
                User_Address: json["User_Telephone"].string,
                User_Telephone: json["User_Address"].string,
                User_RealName: json["RealName"].string,
                User_Grade: json["User_Grade"].string,
                User_Integral: json["User_Integral"].string,
                User_Image: json["User_Image"] != nil ? BaseUrlImg + json["User_Image"].string! : ""
            )
        }
        else{
            return nil
        }
    }
    return GetUserInfo
}
