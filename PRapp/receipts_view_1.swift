//
//  receipts_view_1.swift
//  PRapp
//
//  Created by Nathaniel Leonard on 8/6/20.
//  Copyright © 2020 PR. All rights reserved.
//

import Foundation
//import Firebase
import UIKit

class receipts_view_1: UIViewController, UITableViewDataSource, UITableViewDelegate{

//    apparel_block.layer.cornerRadius = 10;
    @IBOutlet weak var tblList: UITableView!
    var recordsArray:[Int] = Array()
    var limit = 20
    let totalEnteries = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblList.dataSource = self
        tblList.delegate = self
        tblList.tableFooterView = UIView(frame: .zero)
        
        var index = 0
        while index < limit {
            recordsArray.append(index)
            index = index + 1
        }
    }
    
    
    //MARK:- UITableViewMethods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "listcell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "listcell")
        }
        cell?.textLabel?.text = "Row \(recordsArray[indexPath.row])"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == recordsArray.count - 1 {
            // we are at last cell load more content
            if recordsArray.count < totalEnteries {
                // we need to bring more records as there are some pending records available
                var index = recordsArray.count
                limit = index + 20
                while index < limit {
                    recordsArray.append(index)
                    index = index + 1
                }
                self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
            }
        }
    }
    
    @objc func loadTable() {
        self.tblList.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
