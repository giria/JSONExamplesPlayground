//: [Previous](@previous)

//: # Nobel form interner (simpler)
//
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

///
struct Root: Codable {
    let nobelPrizes :[NobelPrize]
}

struct NobelPrize: Codable {
    let awardYear:String
    let dateAwarded: String
    let prizeAmount: Int
    let laureates : [Laureate]
    let category: Category
}

struct Category: Codable {
    let en: String
}

struct Laureates:Codable {
    let laureates: [Laureate]
    
}

struct Laureate:Codable {
    let id:String
    let fullName: FullName?
    let motivation: Motivation
}

struct Motivation: Codable {
    let en: String
}

struct FullName :Codable {
    let en:String
}
///

let urlString = "https://api.nobelprize.org/2.1/nobelPrizes?offset=1&limit=10&sort=asc&nobelPrizeYear=2020&format=json&csvLang=en"


if let url = URL(string:"https://api.nobelprize.org/2.1/nobelPrizes?offset=1&limit=10&sort=asc&nobelPrizeYear=2020&format=json&csvLang=en") {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data {
            let jsonDecoder = JSONDecoder()
            do {
                let parsedJSON = try jsonDecoder.decode(Root.self, from: data)
                // Now parsedJson is Root
                
                for nobelPrize in parsedJSON.nobelPrizes {
                    print(nobelPrize.awardYear)
                    print(nobelPrize.category)
                    print(nobelPrize.laureates[0].motivation.en)
                }
                
                
            } catch {
                print (error)
            }
        }
    }.resume()
}
//: [Next](@next)
