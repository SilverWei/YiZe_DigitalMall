//
//  UserInfo.swift
//  YiZe_DigitalMall
//
//  Created by dmqlMAC on 16/1/5.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import Foundation

//获取用户详细个人资料
class UserInfo{
    internal class GetUserInfo: NSObject{
        var User_Name:String? //用户名
        var User_Mail:String? //用户邮箱
        var User_Address:String? //用户地址
        var User_Telephone:String? //用户电话
        var User_RealName:String? //真实姓名
        var User_Grade:String? //会员等级
        var User_Integral:String? //会员积分
        var User_Image:String? //用户头像
        
        
        init(User_Name:String? ,User_Mail:String? ,User_Address:String? ,User_Telephone:String? ,User_RealName:String? ,User_Grade:String? ,User_Integral:String? ,User_Image:String?) {
            self.User_Name = User_Name
            self.User_Mail = User_Mail
            self.User_Address = User_Address
            self.User_Telephone = User_Telephone
            self.User_RealName = User_RealName
            self.User_Grade = User_Grade
            self.User_Integral = User_Integral
            self.User_Image = User_Image
            
        }
    }
    
    internal class UpUserInfoIn: NSObject{
        var User_ID:String?
        var User_Mail:String?
        var User_Telephone:String?
        var User_Address:String?
        var User_RealName:String?
        
        init(User_ID:String?, User_Mail:String?, User_Telephone:String?, User_Address:String?, User_RealName:String?) {
            self.User_ID = User_ID
            self.User_Mail = User_Mail
            self.User_Telephone = User_Telephone
            self.User_Address = User_Address
            self.User_RealName = User_RealName
        }
    }
    
    internal class UpUserInfoOut: NSObject{
        var User_ID:String?
        var Code:Int?

        init(User_ID:String? ,Code:Int?) {
            self.User_ID = User_ID
            self.Code = Code
        }
    }
    
    internal class UserLoginIn:NSObject{
        var User_Name:String?
        var User_Password:String?
        
        init(User_Name:String?,User_Password:String?) {
            self.User_Name = User_Name
            self.User_Password = User_Password
        }
    }
    
    internal class UserLoginOut:NSObject{
        var User_ID:String?
        var Code:Int?
        
        init(User_ID:String?,Code:Int?) {
            self.User_ID = User_ID
            self.Code = Code
        }
    }
    
    internal class UserRegisterIn:NSObject{
        var User_Name:String?
        var User_Password:String?
        var User_Maill:String?
        var User_Telephone:String?
        init(User_Name:String?, User_Password:String?, User_Maill:String?, User_Telephone:String?){
            self.User_Name = User_Name
            self.User_Password = User_Password
            self.User_Maill = User_Maill
            self.User_Telephone = User_Telephone
        }
    }
    
    internal class UserRegisterOut:NSObject{
        var User_ID:String?
        var Code:Int?

        init(User_ID:String?, Code:Int?){
            self.User_ID = User_ID
            self.Code = Code
        }
    }
}

class GetLikeGoods:NSObject{
    var LikeGoods_ID:String?
    var Like_ID:String?
    var User_ID:String?
    
    init(LikeGoods_ID:String?, Like_ID:String?, User_ID:String?) {
        self.LikeGoods_ID = LikeGoods_ID
        self.Like_ID = Like_ID
        self.User_ID = User_ID
    }
}


