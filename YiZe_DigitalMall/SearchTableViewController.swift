//
//  SearchTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/7.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    @IBOutlet weak var SearchTextView: MKTextField!
    @IBOutlet var SearchTableView: UITableView!
    @IBOutlet var SortViewButton: UIBarButtonItem!
    @IBOutlet var SortSearchCloseButton: UIBarButtonItem!
    var Sort2ndId:String = ""
    var SearchName:String = ""
    var GoodsInfoAll:[SearchInfoOut]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SearchTextView.layer.borderColor = UIColor.clearColor().CGColor
        SearchTextView.floatingPlaceholderEnabled = true
        SearchTextView.placeholder = "搜索商品:"
        SearchTextView.tintColor = UIColor.blackColor()
        SearchTextView.rippleLocation = .Right
        SearchTextView.backgroundColor = UIColor.grayColor()
        SearchTextView.textColor = UIColor.whiteColor()

        //隐藏分类关闭按钮,判断是否分类搜索
        self.navigationItem.leftBarButtonItem = nil
        if(NSUserDefaults.standardUserDefaults().valueForKey("SortSelectTrue") as! Int == 0 && NSUserDefaults.standardUserDefaults().valueForKey("HomeSearchName") == nil){
            self.navigationItem.leftBarButtonItem = SortViewButton
        }
        else if(NSUserDefaults.standardUserDefaults().valueForKey("HomeSearchName") != nil){
            self.navigationItem.leftBarButtonItem = SortViewButton
            SortSearchCome()
        }
        else{
            SortSearchCome()
        }
        
        //下拉刷新
        self.SearchTableView.addLegendHeaderWithRefreshingTarget(self, refreshingAction: "SearchRefresh")
        
        //建立刷新通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receivedNotif:", name: "SearchTabBarView", object: nil)
        
        
    }
    
    func receivedNotif(notification:NSNotification){
        SortSearchCome()
    }
    
    
    
    //显示分类搜索
    func SortSearchCome(){
        if(NSUserDefaults.standardUserDefaults().valueForKey("HomeSearchName") != nil){
            SearchName = NSUserDefaults.standardUserDefaults().valueForKey("HomeSearchName") as! String
            SearchTextView.text = SearchName
            NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "HomeSearchName")
            SearchShow()
        }
        else{
            self.navigationItem.leftBarButtonItem = SortSearchCloseButton
            Sort2ndId = NSUserDefaults.standardUserDefaults().valueForKey("SortSelect2ndId") as! String
            
            SearchTextView.placeholder = "搜索" + (NSUserDefaults.standardUserDefaults().valueForKey("SortSelect2ndName") as! String) + ":"
            
        }
        
        SearchShow()
        
        if(GoodsInfoAll?.count < 1){
            ProgressHUD.showError("没有相关产品")
        }
    }
    
    
    //下拉刷新
    func SearchRefresh(){
        self.SearchTableView.header.endRefreshing()
        SearchShow()
        if(GoodsInfoAll?.count < 1){
            ProgressHUD.showError("没有相关产品")
        }
        else{
            ProgressHUD.showSuccess("刷新完成")
        }
        
    }

    func SearchShow(){
        SearchName = SearchTextView.text!
        if(SearchName == "" && Sort2ndId == ""){
            GoodsInfoAll = nil
        }
        else{
            GoodsInfoAll = SearchInfo(SearchInfoIn(Goods_Name: SearchName, GoodsSort2nd_ID: Sort2ndId))
        }
        
        tableView.reloadData()
    }
    
    @IBAction func SortSearchCloseButtonClick(sender: AnyObject) {
        self.navigationItem.leftBarButtonItem = SortViewButton
        SearchTextView.placeholder = "搜索商品:"
        NSUserDefaults.standardUserDefaults().setObject(0, forKey: "SortSelectTrue")
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "SortSelect2ndId")
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "SortSelect2ndName")
        Sort2ndId = ""
        SearchShow()
    }
    
    //上拉隐藏navigationBar动画
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if(velocity.y > 1.0)
        {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        else
        {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    @IBAction func HomeSearchButtonClickShow(segue:UIStoryboardSegue){
        if(SearchTextView.text == ""){
            ProgressHUD.showError("请输入搜索关键字")
            SearchShow()
            return
        }
        
        SearchShow()
        if(GoodsInfoAll?.count < 1){
            ProgressHUD.showError("没有相关产品")
        }
        
    }
    
    //点击搜索按钮事件
    @IBAction func SearchButtonClick(sender: AnyObject) {
        if(SearchTextView.text == ""){
            ProgressHUD.showError("请输入搜索关键字")
            SearchShow()
            return
        }
        
        SearchShow()
       if(GoodsInfoAll?.count < 1){
            ProgressHUD.showError("没有相关产品")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchGoodsCellView", forIndexPath: indexPath) as! SearchGoodsCell
        
        cell.GoodsName.text = GoodsInfoAll![indexPath.row].Goods_Name
        cell.GoodsMarketPrice.attributedText = NSAttributedString(string: "￥" + GoodsInfoAll![indexPath.row].Goods_MarketPrice!, attributes: [NSStrikethroughStyleAttributeName:1])
        cell.GoodsMemberPrice.text = "￥" + GoodsInfoAll![indexPath.row].Goods_MemberPrice!
        cell.GoodsImage.image = GoodsInfoAll![indexPath.row].Goods_Image != "" ? UIImage(data: NSData(contentsOfURL: NSURL(string: GoodsInfoAll![indexPath.row].Goods_Image!)!)!) : nil
        return cell
    }
    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        if(GoodsInfoAll?.count >= 1){
            return (GoodsInfoAll?.count)!
        }
        else{
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
            let label = UILabel(frame: self.tableView.bounds)
            label.text = "请在搜索框进行搜索"
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.lightGrayColor()
            self.tableView.backgroundView = label
            
        }
        return 0
    }

    //页面对外接口
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowGoodsInfo"
        {
            if let indexPath = self.SearchTableView.indexPathForSelectedRow
            {
                NSUserDefaults.standardUserDefaults().setObject(GoodsInfoAll![indexPath.row].Goods_ID!, forKey: "GoodsInfoId")
                NSNotificationCenter.defaultCenter().postNotificationName("GoodsInfoView", object: nil)
            }
        }
    }

}
