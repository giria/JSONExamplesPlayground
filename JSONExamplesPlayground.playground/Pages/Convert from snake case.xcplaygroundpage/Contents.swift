//: [Previous](@previous)

//: ## Convert form snake case


import Foundation

let json = """
[
    {
        "first_name": "Paul",
        "last_name": "Hudson"
    },
    {
        "first_name": "Andrew",
        "last_name": "Carnegie"
    }
]
"""

let data = Data(json.utf8)
// define the struct
struct User: Codable {
    var firstName: String
    var lastName: String
}
let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

do {
    let decoded = try decoder.decode([User].self, from: data)
    print(decoded[0].firstName)
    print(decoded[0].lastName)
} catch {
    print("Failed to decode JSON")
    print(error)
}

//: [Next](@next)
