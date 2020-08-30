//
//  TableViewController.swift
//  PRapp
//
//  Created by Nathaniel Leonard on 8/11/20.
//  Copyright © 2020 PR. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var merchantName: UILabel!
    @IBOutlet weak var merchantTotal: UILabel!
    
}


class TableViewController: UITableViewController {
    
   
    var db:Firestore!
    
    //create array to fetch data
    var receiptList = [Receipt]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //remove separator lines
        //self.tableView.separatorStyle = .none
        db = Firestore.firestore()
        loadData()
        //checkForUpdates()
        
    }
    
    func loadData() {
        db.collection("test").getDocuments() {
            querySnapshot, error in
            if let error = error {
                print("\(error.localizedDescription)")
            }else{
                self.receiptList = querySnapshot!.documents.compactMap({Receipt(dictionary: $0.data())})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }
    
   /*
    func checkForUpdates() {
        db.collection("test").whereField("timestamp", isGreaterThan: Date())
            .addSnapshotListener {
                querySnapshot, error in
                
                guard let snapshot = querySnapshot else {return}
                
                snapshot.documentChanges.forEach {
                    diff in
                    
                    if diff.type == .added {
                        self.receiptList.append(ItemModel(dictionary: diff.document.data())!)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                
        }
    }
    */
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "MasterToDetail" {
            let destVC = segue.destination as! DetailViewController
            destVC.receipt = sender as? Receipt
            print("RECEIPT", destVC.receipt ?? 0)
            print("SENDER", type(of:sender))
            //destVC.receipt = receiptList[0]
    }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return receiptList.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "purchaseblock", for: indexPath) as! TableViewCell
        
     
        let displayReceipt = receiptList[indexPath.row]
        
        cell.merchantName?.text = "\(displayReceipt.name)"
        cell.merchantTotal?.text = " \(displayReceipt.cost)"
        //cell.detailTextLabel?.text = "item name: \(displayReceipt.content[0].item_name)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let receipt = receiptList[indexPath.row]
        print(receipt)
        performSegue(withIdentifier: "MasterToDetail", sender: receipt)
    }
    
}
 
