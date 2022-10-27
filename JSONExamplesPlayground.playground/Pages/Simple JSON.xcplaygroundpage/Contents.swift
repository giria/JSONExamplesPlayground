
//:## Simple JSON example
//: Parsing JSON
//: # Useful Links
//: JSON Structure: [https://quicktype.io](https://quicktype.io)
//:
//: JSON Visualization:  [JSON Crack](https://jsoncrack.com)
//:
//: Dummy JSON   [dummyJson](https://dummyjson.com/docs/http)

import Foundation

let json = """
[
    {
        "name": "Paul",
        "age": 39
    },
    {
        "name": "Andrew",
        "age": 40
    }
]
"""


let data = Data(json.utf8)

// define the struct
struct User: Codable {
    var name: String
    var age: Int
}
let decoder = JSONDecoder()

do {
    let decoded = try decoder.decode([User].self, from: data)
    print(type(of: decoded))
    print(decoded[0].name)
    print(decoded[0].age)
} catch {
    print("Failed to decode JSON")
}



//: [Next](@next)
