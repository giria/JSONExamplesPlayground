//: [Previous](@previous)
//:
//: Code adapted from: https://medium.com/@abhilash.mathur1891/mvvm-in-ios-swift-aa1448a66fb4



import Foundation

//   let weekly = try? newJSONDecoder().decode(Root.self, from: jsonData)

import Foundation

// MARK: - Weekly
struct Root: Codable {
    let status: String
    let data: [Datum]
    let message: String
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    
    func apiToGetEmployeeData(completion : @escaping (Root) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(Root.self, from: data)
                    completion(empData)
            }
        }.resume()
    }
}

let api = APIService()
let result = api.apiToGetEmployeeData

var session = URLSession.shared

func loadItems(from url: URL) async throws -> Root {
   
    let (data, response) = try await session.data(from: url)
    
    print(response)
    let decoder = JSONDecoder()
    return try decoder.decode(Root.self, from: data)
}



Task.init {
    
    do {
        let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
        let response  = try await loadItems(from: sourcesURL)
        // print the name of all employees
        for i in 0..<response.data.count {
            print( response.data[i].employeeName)
        }
       
    } catch {
        print(error)
    }
}



//: [Next](@next)
