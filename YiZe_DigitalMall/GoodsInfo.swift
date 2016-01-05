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
    var Goods_ID: String //商品管理号
    var Goods_Name: String //商品名称
    var Goods_Image: String //商品图片
    var Goods_MarketPrice: Double //商品市场价
    var Goods_MemberPrice: Double //商品会员价
    var Goods_State: String //商品状态
    var Goods_InventoryNumber: Int //商品库存数量
    var Goods_Score: Int //商品评分
    var Goods_PurchaseIntegral: Int //商品购买积分
    var Goods_Introduction: String //商品简介
    var Goods_Recommend: String //商品推荐
    
    init(Goods_ID: String ,Goods_Name: String ,Goods_Image: String ,Goods_MarketPrice: Double ,Goods_MemberPrice: Double ,Goods_State: String ,Goods_InventoryNumber: Int ,Goods_Score: Int ,Goods_PurchaseIntegral: Int ,Goods_Introduction: String ,Goods_Recommend: String) {
        self.Goods_ID = Goods_ID
        self.Goods_Name = Goods_Name
        self.Goods_Image = Goods_Image
        self.Goods_MarketPrice = Goods_MarketPrice
        self.Goods_MemberPrice = Goods_MemberPrice
        self.Goods_State = Goods_State
        self.Goods_InventoryNumber = Goods_InventoryNumber
        self.Goods_Score = Goods_Score
        self.Goods_PurchaseIntegral = Goods_PurchaseIntegral
        self.Goods_Introduction = Goods_Introduction
        self.Goods_Recommend = Goods_Recommend
    }
}