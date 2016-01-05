//
//  UserInfo.swift
//  YiZe_DigitalMall
//
//  Created by dmqlMAC on 16/1/5.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import Foundation

//获取用户详细个人资料
class GetUserInfo: NSObject{
    var User_ID:String //用户管理号
    var User_Password:String //用户密码
    var User_Name:String //用户名
    var User_Mail:String //用户邮箱
    var User_Address:String //用户地址
    var User_Telephone:Int //用户电话
    var User_RealName:String //真实姓名
    var User_RegistrationTime:String //用户注册时间
    var User_Grade:Int //会员等级
    var User_Integral:Int //会员积分
    var User_Image:String //用户头像
    var User_Jurisdiction:String //用户权限
    
    
    init(User_ID:String ,User_Password:String ,User_Name:String ,User_Mail:String ,User_Address:String ,User_Telephone:Int ,User_RealName:String ,User_RegistrationTime:String ,User_Grade:Int ,User_Integral:Int ,User_Image:String ,User_Jurisdiction:String) {
        self.User_ID = User_ID
        self.User_Password = User_Password
        self.User_Name = User_Name
        self.User_Mail = User_Mail
        self.User_Address = User_Address
        self.User_Telephone = User_Telephone
        self.User_RealName = User_RealName
        self.User_RegistrationTime = User_RegistrationTime
        self.User_Grade = User_Grade
        self.User_Integral = User_Integral
        self.User_Image = User_Image
        self.User_Jurisdiction = User_Jurisdiction
        
    }
}