//
//  ItemModel.swift
//  PRapp
//
//  Created by Nathaniel Leonard on 8/11/20.
//  Copyright © 2020 PR. All rights reserved.
//

import Foundation
/*
class ItemModel{
    
    var category: String?
    var name: String?
    var price: Int?
    var quantity: Int?
    
    init(category: String?,name: String?, price: Int?,quantity: Int?){
        self.category = category;
        self.name = name;
        self.price = price;
        self.quantity = quantity;
        
}*/

 /*
protocol DocumentSerializable  {
        init?(dictionary:[String:Any])
    }


struct ItemModel{
   var merchant : Merchant
   
    var dictionary: [String: Any] {
        return [
            "merchant": merchant
        ]
    }
}

extension ItemModel: DocumentSerializable {
    
    init?(dictionary: [String : Any]) {
        guard let merchant = dictionary["merchant"] as? Merchant
            else { return nil }
        
        
        self.init( merchant: merchant)
    }
}


struct Merchant {
        var first: String
        var last: String
    
        
        var dictionary:[String:Any] {
            return [
                "first": first,
                 "last": last
                    ]
        }
}

extension Merchant : DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let first = dictionary["first"] as? String,
            let last = dictionary["last"] as? String
            else {return nil}
        self.init(first:first, last:last)
        
    }
}

 */

 
protocol DocumentSerializable  {
    init?(dictionary:[String:Any])
}

struct Item: Codable {
    
    var item_name: String
    var item_no: String
}

struct Receipt {
    var name: String
    var content: [Item]
    var cost: String
    
    var convertDataToJSONforUpload:[String: Any] {
        return [
            "name": name,
            "content": try? content[0].asDictionary(),
            "cost": cost
        ]
    }
}

extension Receipt : DocumentSerializable {
    init?(dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
            let content = dictionary["content"] as? Dictionary<String, String>,
            let cost = dictionary["cost"] as? String else { return nil }
        
        //Where the Magic Happens During Deserialization - we take each pair in Dictionary<String: Any> and convert to an Item.
        var item = [Item]()
        
        let itemName = content["item_name"] ?? ""
        let itemNumber = content["item_no"] ?? ""
        item.append(Item(item_name: itemName, item_no: itemNumber))
        
        
        self.init(name: name, content: item, cost: cost)
    }
}
 

 
/*
protocol DocumentSerializable  {
    init?(dictionary:[String:Any])
}

struct Item_Detail: Codable {
    var name: String
    
}

struct Item_Number: Codable {
    var item1: [Item_Detail]
    
    var convertDataToJSONforUpload:[String: Any] {
        return [
            "item1": try? item1[0].asDictionary()
        ]
    }
    
}

struct Receipt {
    var merchant: String
    var items: [Item_Number]
    var total: String
    
    var convertDataToJSONforUpload:[String: Any] {
        return [
            "merchant": merchant,
            "items": items,
            "total": total
        ]
    }
}

extension Receipt : DocumentSerializable {
    init?(dictionary: [String: Any]) {
        guard let merchant = dictionary["merchant"] as? String,
            let items = dictionary["items"] as? Dictionary<String, String>,
            let total = dictionary["total"] as? String else { return nil }
        
        //Where the Magic Happens During Deserialization - we take each pair in Dictionary<String: Any> and convert to an Item.
        var item_list = [Item_List]()
        var itemm = [Item]()
        
        let itemName = items["name"] ?? ""
        
        item_list.append(Item_List(name:itemName))
        
        itemm.append(Item(item1: item_list))
        
      

        
        self.init(merchant: merchant, items:itemm, total: total)
    }
}
*/
