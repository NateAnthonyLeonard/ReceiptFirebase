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
