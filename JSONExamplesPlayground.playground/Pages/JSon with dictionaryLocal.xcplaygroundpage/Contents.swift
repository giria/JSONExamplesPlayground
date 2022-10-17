//: [Previous](@previous)

import Foundation

let json = """
{
    "40260005": {
        "postalcode": "40260",
        "name": "CASTETS",
        "brand": "BLAH"
    },
    "40180001": {
        "postalcode": "40180",
        "name": "NONAME",
        "brand": "NONE"
    }
}
"""

let data = Data(json.utf8)


struct FullBrandList: Codable {
    let postalcode, name, brand: String
}

typealias Root = [String: FullBrandList]

let decodedData = try? JSONDecoder().decode(Root.self, from: data)

print(type(of: decodedData))
print(decodedData!["40180001"]!.brand)


//: [Next](@next)
