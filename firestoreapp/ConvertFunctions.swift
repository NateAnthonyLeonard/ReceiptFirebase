import Foundation

/**
  Function is used when you want to map an array of objects to an array of dictionaries. This is necessary before uploading objects to firebase
 */
struct ConverterFunctions {
    static func convertToArrayOfMaps(inputArray: [Item]) -> [[String: Any]] {
        var output = [[String: Any]]()
        for x in inputArray {
            try? output.append(x.asDictionary())
        }
        return output
    }

   //  Currently Not Used But Can Be Implemented To Create Nested Map On Firebase
//    static func convertToMapOfMaps(inputArray: [Item]) -> [String: [String: Any]] {
//        var output = [String: [String: Any]]()
//        var index = 0
//        for x in inputArray {
//            try? output["item \(index)"] = x.asDictionary()
//            index += 1
//        }
//        return output
//    }
}
