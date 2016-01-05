//
//  GoodsCategory.swift
//  YiZe_DigitalMall
//
//  Created by dmqlMAC on 16/1/5.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import Foundation

//商品一级分类
class Goods1stCategory: NSObject{
    var Goods1stCategory_ID: String //商品一级类别id
    var Goods_ID: String //商品id
    var Goods1stCategory_Name:String // 商品一级类别名称
    
    init(Goods1stCategory_ID: String ,Goods_ID: String ,Goods1stCategory_Name:String) {
        self.Goods1stCategory_ID = Goods1stCategory_ID
        self.Goods_ID = Goods_ID
        self.Goods1stCategory_Name = Goods1stCategory_Name
    }
}