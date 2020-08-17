import Foundation
import Firestore

protocol DocumentSerializable {
    //A type that can be initialized from a Firebase document
    init?(dictionary:[String: Any])
}

struct Item: Codable {
    var item_name: String
    var item_no: String
}

//Convert to Dictionary Function
//func convertToDictionary(inputObject: Any) ->

struct Receipt {
    var name: String
    var content: [Item]
    var cost: String

    var convertDataToJSONforUpload:[String: Any] {
        return [
            "name": name,
            "content": ConverterFunctions.convertToArrayOfMaps(inputArray: content), // try? content[0].asDictionary(),
            "cost": cost
        ]
    }
}

extension Receipt : DocumentSerializable {
    init?(dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
            let content = dictionary["content"] as? [Dictionary<String, String>],
            let cost = dictionary["cost"] as? String else { return nil }

        //Where the Magic Happens During Deserialization - we take each pair in Dictionary<String: Any> and convert to an Item.
        var items = [Item]()

        for x in content {
            let itemName = x["item_name"] ?? ""
            let itemNumber = x["item_no"] ?? ""
            items.append(Item(item_name: itemName, item_no: itemNumber))
        }
         //   items.append(Item(item_name: content[x]["item_name"], item_no: content[x]["item_no"]))

//        let itemName = content["item_name"] ?? ""
//        let itemNumber = content["item_no"] ?? ""
          //  items.append(Item(item_name: itemName, item_no: itemNumber))


        self.init(name: name, content: items, cost: cost)
    }
}
