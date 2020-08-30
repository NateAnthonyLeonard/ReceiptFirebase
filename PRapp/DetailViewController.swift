//
//  DetailViewController.swift
//  PRapp
//
//  Created by Nathaniel Leonard on 8/30/20.
//  Copyright © 2020 PR. All rights reserved.
//

import UIKit

class DetailTBCell: UITableViewCell {
    
    @IBOutlet weak var products: UILabel!
    
    @IBOutlet weak var prices: UILabel!
    
}

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tview: UITableView!
    
    var receipt: Receipt?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(receipt ?? 0)
        
        tview.dataSource = self
        tview.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsblock") as! DetailTBCell
        
        //let receipt = receiptList[indexPath.row]
        //let displayReceipt = receiptList[indexPath.row]
        
        //cell.products?.text = "\(String(describing: receipt?.name))"
        //cell.prices?.text = " \(receipt?.cost ?? "0")"
        //cell.detailTextLabel?.text = "item name: \(displayReceipt.content[0].item_name)"
        print(receipt ?? 0)
        cell.products.text = "\(receipt?.content[0].item_name ?? "NULL")"
        //cell.prices?.text = " \(receipt?.content[0].item_no ?? " ")"
        cell.prices.text = "WOW"
        
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
