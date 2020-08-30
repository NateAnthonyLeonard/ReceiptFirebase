//
//  DetailViewController.swift
//  PRapp
//
//  Created by Nathaniel Leonard on 8/27/20.
//  Copyright © 2020 PR. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var products: UILabel!
    
    @IBOutlet weak var prices: UILabel!
    
}


class DetailTableViewController: UITableViewController {
    
    //var receiptList = [Receipt]()
    
    var receipt: Receipt?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print(receipt ?? "Instance is nil")
       
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemsblock") as! DetailTableViewCell
        
         //let receipt = receiptList[indexPath.row]
        //let displayReceipt = receiptList[indexPath.row]
        
        //cell.products?.text = "\(String(describing: receipt?.name))"
        //cell.prices?.text = " \(receipt?.cost ?? "0")"
        //cell.detailTextLabel?.text = "item name: \(displayReceipt.content[0].item_name)"
        
        cell.products.text = "\(receipt?.content[0].item_name ?? " ")"
        cell.prices?.text = " \(receipt?.content[0].item_no ?? " ")"
        
        
        return cell
    }


}

