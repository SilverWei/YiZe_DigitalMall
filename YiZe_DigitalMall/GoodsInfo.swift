//
//  GoodsInfo.swift
//  YiZe_DigitalMall
//
//  Created by dmqlMAC on 16/1/5.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import Foundation

//获取商品详细资料
class GetGoodsInfo: NSObject {
    var Goods_ID: String? //商品管理号
    var Goods_Name: String? //商品名称
    var Goods_Image: String? //商品图片
    var Goods_MarketPrice: String? //商品市场价
    var Goods_MemberPrice: String? //商品会员价
    var Goods_InventoryNumber: String? //商品库存数量
    var Goods_Score: String? //商品评分
    var Goods_PurchaseIntegral: String? //商品购买积分
    var Goods_Introduction: String? //商品简介
    var Goods_Recommend: String? //商品推荐
    var Goods_Time:String? //商品发布时间
    var Goods_Sort1:String? //商品一级菜单
    var Goods_Sort2:String? //商品二级菜单
    var Goods_RecommendTime:String? //商品推荐时间
    
    init(Goods_ID: String?, Goods_Name: String?, Goods_Image: String?, Goods_MarketPrice: String?, Goods_MemberPrice: String?, Goods_InventoryNumber: String?, Goods_Score: String?, Goods_PurchaseIntegral: String?, Goods_Introduction: String?, Goods_Recommend: String?, Goods_Time:String?, Goods_Sort1:String?, Goods_Sort2:String?, Goods_RecommendTime:String?) {
        self.Goods_ID = Goods_ID
        self.Goods_Name = Goods_Name
        self.Goods_Image = Goods_Image
        self.Goods_MarketPrice = Goods_MarketPrice
        self.Goods_MemberPrice = Goods_MemberPrice
        self.Goods_InventoryNumber = Goods_InventoryNumber
        self.Goods_Score = Goods_Score
        self.Goods_PurchaseIntegral = Goods_PurchaseIntegral
        self.Goods_Introduction = Goods_Introduction
        self.Goods_Recommend = Goods_Recommend
        self.Goods_Time = Goods_Time
        self.Goods_Sort1 = Goods_Sort1
        self.Goods_Sort2 = Goods_Sort2
        self.Goods_RecommendTime = Goods_RecommendTime
    }
}

class SearchInfoIn:NSObject{
    var Goods_Name:String?
    var GoodsSort2nd_ID:String?
    
    init(Goods_Name:String?, GoodsSort2nd_ID:String?) {
        self.Goods_Name = Goods_Name
        self.GoodsSort2nd_ID = GoodsSort2nd_ID
    }
}

class SearchInfoOut:NSObject{
    var Goods_ID:String?
    var Goods_Name:String?
    var Goods_Image:String?
    var Goods_MarketPrice:String?
    var Goods_MemberPrice:String?
    
    init(Goods_ID:String?, Goods_Name:String?, Goods_Image:String?, Goods_MarketPrice:String?, Goods_MemberPrice:String?) {
        self.Goods_ID = Goods_ID
        self.Goods_Name = Goods_Name
        self.Goods_Image = Goods_Image
        self.Goods_MarketPrice = Goods_MarketPrice
        self.Goods_MemberPrice = Goods_MemberPrice
    }
}