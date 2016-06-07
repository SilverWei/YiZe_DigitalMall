//
//  GoodsCategory.swift
//  YiZe_DigitalMall
//
//  Created by dmqlMAC on 16/1/5.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import Foundation

class GoodsSort1st: NSObject{
    var GoodsSort1st_ID: String //商品一级类别id
    var GoodsSort1st_Name:String // 商品一级类别名称
    
    init(GoodsSort1st_ID: String ,GoodsSort1st_Name:String) {
        self.GoodsSort1st_ID = GoodsSort1st_ID
        self.GoodsSort1st_Name = GoodsSort1st_Name
    }
}

class GoodsSort2nd: NSObject{
    var GoodsSort2nd_ID: String
    var GoodsSort2nd_Name:String
    
    init(GoodsSort2nd_ID: String ,GoodsSort2nd_Name:String) {
        self.GoodsSort2nd_ID = GoodsSort2nd_ID
        self.GoodsSort2nd_Name = GoodsSort2nd_Name
    }
}