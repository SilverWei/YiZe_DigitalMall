//
//  HomeViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/7.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var ShoppingCartbutton: MKButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ShoppingCartbutton.cornerRadius = 25.0
        ShoppingCartbutton.layer.shadowOpacity = 0.75
        ShoppingCartbutton.layer.shadowRadius = 3.5
        ShoppingCartbutton.layer.shadowColor = UIColor.blackColor().CGColor
        ShoppingCartbutton.layer.shadowOffset = CGSize(width: 1.0, height: 5.5)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

