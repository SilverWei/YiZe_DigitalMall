//
//  HomeTableViewController.swift/Users/dmqlMAC/Documents/YiZe_DigitalMall/YiZe_DigitalMall/HomeViewController.swift
//  YiZe_DigitalMall
//
//  Created by dmqlMAC on 16/1/6.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit


class HomeTableViewController: UITableViewController {

    @IBOutlet weak var SearchTextView: MKTextField!
    @IBOutlet var HomeTableView: UITableView!
    
    
    var GetNewGoodsAll:[SearchInfoOut]?
    
    var RecommendedAll:[SearchInfoOut]?
    
    var GetHotGoodsAll:[SearchInfoOut]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SearchTextView.layer.borderColor = UIColor.clearColor().CGColor
        SearchTextView.placeholder = "搜索商品:"
        SearchTextView.backgroundColor = UIColor.grayColor()
        SearchTextView.tintColor = UIColor.whiteColor()

        HomeViewShow()
        
        //下拉刷新
        self.HomeTableView.addLegendHeaderWithRefreshingTarget(self, refreshingAction: "print1")
        
    }
    
    func print1(){
        HomeViewShow()
        if(GetNewGoodsAll?.count != nil){
            ProgressHUD.showSuccess("刷新成功")
        }
        
        tableView.reloadData()
        self.HomeTableView.header.endRefreshing()
    }
    
    func HomeViewShow(){
        GetNewGoodsAll = GetNewGoods()
        if(GetNewGoodsAll?.count == nil){
            ProgressHUD.showError("连接超时")
        }
        RecommendedAll = Recommended()
        GetHotGoodsAll = GetHotGoods()
    }

    //上拉隐藏navigationBar动画
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if(velocity.y > 0.0)
        {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        else
        {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeGoodsCellView", forIndexPath: indexPath) as! SearchGoodsCell
        
        if(section == 0){

            cell.GoodsName.text = GetNewGoodsAll![indexPath.row].Goods_Name
            cell.GoodsMarketPrice.attributedText = NSAttributedString(string: "￥" + GetNewGoodsAll![indexPath.row].Goods_MarketPrice!, attributes: [NSStrikethroughStyleAttributeName:1])
            cell.GoodsMemberPrice.text = "￥" + GetNewGoodsAll![indexPath.row].Goods_MemberPrice!
            cell.GoodsImage.image = GetNewGoodsAll![indexPath.row].Goods_Image != "" ? UIImage(data: NSData(contentsOfURL: NSURL(string: GetNewGoodsAll![indexPath.row].Goods_Image!)!)!) : nil
            
        }
        else if(section == 1){
            cell.GoodsName.text = RecommendedAll![indexPath.row].Goods_Name
            cell.GoodsMarketPrice.attributedText = NSAttributedString(string: "￥" + RecommendedAll![indexPath.row].Goods_MarketPrice!, attributes: [NSStrikethroughStyleAttributeName:1])
            cell.GoodsMemberPrice.text = "￥" + RecommendedAll![indexPath.row].Goods_MemberPrice!
            cell.GoodsImage.image = RecommendedAll![indexPath.row].Goods_Image != "" ? UIImage(data: NSData(contentsOfURL: NSURL(string: RecommendedAll![indexPath.row].Goods_Image!)!)!) : nil
        }
        else if(section == 2){
            cell.GoodsName.text = GetHotGoodsAll![indexPath.row].Goods_Name
            cell.GoodsMarketPrice.attributedText = NSAttributedString(string: "￥" + GetHotGoodsAll![indexPath.row].Goods_MarketPrice!, attributes: [NSStrikethroughStyleAttributeName:1])
            cell.GoodsMemberPrice.text = "￥" + GetHotGoodsAll![indexPath.row].Goods_MemberPrice!
            cell.GoodsImage.image = GetHotGoodsAll![indexPath.row].Goods_Image != "" ? UIImage(data: NSData(contentsOfURL: NSURL(string: GetHotGoodsAll![indexPath.row].Goods_Image!)!)!) : nil
        }
        return cell
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "最新商品"
        }
        if(section == 1){
            return "推荐商品"
        }
        if(section == 2){
            return "热销商品"
        }
        else{
            return nil
        }

    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(section == 0 && GetNewGoodsAll?.count > 0){
            return (GetNewGoodsAll?.count)!
        }
        if(section == 1 && RecommendedAll?.count > 0){
            return (RecommendedAll?.count)!
        }
        if(section == 2 && GetHotGoodsAll?.count > 0){
            return (GetHotGoodsAll?.count)!
        }
        else{
            return 0
        }
    }
    
    
    //页面对外接口
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "HomeSearchButtonClick"
        {
            (segue.destinationViewController as! MainTabBarViewController).HomeSearchName = SearchTextView.text
            SearchTextView.text = ""
        }
        if segue.identifier == "ShowGoodsInfo"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let section = indexPath.section
                
                if(section == 0){
                    
                    NSUserDefaults.standardUserDefaults().setObject(GetNewGoodsAll![indexPath.row].Goods_ID!, forKey: "GoodsInfoId")
                }
                else if(section == 1){
                    
                    NSUserDefaults.standardUserDefaults().setObject(RecommendedAll![indexPath.row].Goods_ID!, forKey: "GoodsInfoId")
                }
                else{
                    
                    NSUserDefaults.standardUserDefaults().setObject(GetHotGoodsAll![indexPath.row].Goods_ID!, forKey: "GoodsInfoId")
                }
                
                NSNotificationCenter.defaultCenter().postNotificationName("GoodsInfoView", object: nil)
            }
            
        }
        
    }
    
}

