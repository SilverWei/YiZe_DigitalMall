//
//  Sort1stTableViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/12.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class Sort1stTableViewController: UITableViewController {

    var Sort1stAll:[GoodsSort1st]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Sort1stLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Sort1stLoad(){
        Sort1stAll = GetSort1stSub()
        if(Sort1stAll == nil){
            ProgressHUD.showError("连接超时")
        }
    }
    
    @IBAction func Sort2ndButtonClick(segue:UIStoryboardSegue){
        
    }
  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Sort1stCellView", forIndexPath: indexPath) as! Sort1stCell
        cell.Sort1stName.text = Sort1stAll![indexPath.row].GoodsSort1st_Name
        cell.Sort1stId.text = Sort1stAll![indexPath.row].GoodsSort1st_ID
        return cell
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Sort1stAll?.count != nil ? (Sort1stAll?.count)! : 0
    }

    //页面对外接口
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Sort1stCellClick"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                (segue.destinationViewController as! Sort2ndTableViewController).Sort1stCellId = Sort1stAll![indexPath.row].GoodsSort1st_ID
            }
        }
    }
    
}
