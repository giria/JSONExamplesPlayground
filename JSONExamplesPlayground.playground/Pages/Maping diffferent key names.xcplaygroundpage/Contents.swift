//: [Previous](@previous)
//: ## Mappong different key names
//:To make that happen we need to declare a CodingKeys enum: mapping that Codable can use to convert JSON names into properties for our struct.


import Foundation

let json = """
[
    {
        "user_first_name": "Taylor",
        "user_last_name": "Swift",
        "user_age": 26
    }
]
"""
let data = Data(json.utf8)

struct User: Codable {
    
    enum CodingKeys: String, CodingKey {
        case firstName = "user_first_name"
        case lastName = "user_last_name"
        case age = "user_age"
    }
    
    var firstName: String
    var lastName: String
    var age: Int
}



let decoder = JSONDecoder()


do {
    let decoded = try decoder.decode([User].self, from: data)
    print(decoded[0].firstName)
    print(decoded[0].lastName)
} catch {
    print("Failed to decode JSON")
    print(error)
}


//: [Next](@next)
