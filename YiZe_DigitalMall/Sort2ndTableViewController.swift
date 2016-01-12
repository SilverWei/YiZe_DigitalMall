//
//  Sort2ndTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/12.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class Sort2ndTableViewController: UITableViewController {

    var Sort1stCellId:String = ""
    
    var Sort2ndAll:[GoodsSort2nd]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func Sort2ndLoad(){
        Sort2ndAll = GetSort2ndSub(Sort1stCellId)
        if(Sort2ndAll == nil){
            ProgressHUD.showError("连接超时")
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Sort1stCellView", forIndexPath: indexPath) as! Sort2ndCell
        cell.Sort2ndName.text = Sort2ndAll![indexPath.row].GoodsSort2nd_Name
        cell.Sort2ndId.text = Sort2ndAll![indexPath.row].GoodsSort2nd_ID
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (Sort2ndAll?.count)!
    }



}
