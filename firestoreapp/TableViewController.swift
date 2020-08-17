//
//  TableViewController.swift
//  firestoreapp
//
//  Created by Brian Advent on 02.10.17.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import UIKit
import Firestore

class TableViewController: UITableViewController {

    var db: Firestore!
    var allReceipts = [Receipt]()

    override func viewDidLoad() {
        super.viewDidLoad()

        db = Firestore.firestore() //Accesses our database and stores it in db
        loadData()
    }

    //Retrieve Data
    func loadData() {
        db.collection("arrayHoldingMaps").getDocuments() {
            querySnapshot, error in
            if let error = error {
                print("bbug Error getting \(error.localizedDescription)")
            } else {
                //The data you retrieved
                self.allReceipts = querySnapshot!.documents.compactMap({Receipt(dictionary: $0.data())})

                DispatchQueue.main.async {
                    // Load up the data
                    self.tableView.reloadData()
                }
            }
        }
    }


    @IBAction func composeSweet(_ sender: Any) {
        
        let composeAlert = UIAlertController(title: "New Sweet", message: "Enter your name and message", preferredStyle: .alert)
        
        composeAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "Company Name"
        }

        composeAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "What did you buy?"
        }

        composeAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "How much did it cost?"
        }
        
        composeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        composeAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action:UIAlertAction) in
            
            //This is where we send our data up to the cloud database
            //Ensure all of the forms are filled out correctly
            if let name = composeAlert.textFields?.first?.text, let content = composeAlert.textFields?[1].text, let cost = composeAlert.textFields?.last?.text {
                //CONVERT ITEM HERE
                let item1 = Item(item_name: "\(content)", item_no: "\(cost)")
                let item2 = Item(item_name: "secondItem", item_no: "ItemNumber2")
                let item3 = Item(item_name: "secondItem", item_no: "ItemNumber2")



                let newReceipt = Receipt(name: name, content: [item1, item2, item3], cost: cost) //Create a sweet object
    
                var ref:DocumentReference? = nil // This lets firestore generate a random ID for us

                //Take our new receipt and convert it to a JSON Dictionary
                ref = self.db.collection("arrayHoldingMaps").addDocument(data: newReceipt.convertDataToJSONforUpload) {
                    error in

                    if let error = error {
                        print("\(error.localizedDescription)")
                    } else {
                        print("Document added with ID: \(ref?.documentID)")
                    }
                    self.loadData()
                }
            } else {
                print("error form not submitted")
            }
        }))
        self.present(composeAlert, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allReceipts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let displayReceipt = allReceipts[indexPath.row]
        cell.textLabel?.text = "name: \(displayReceipt.name), item name: \(displayReceipt.content[1].item_name)"
        cell.detailTextLabel?.text = "total cost: \(displayReceipt.cost)"

        return cell
    }
}
