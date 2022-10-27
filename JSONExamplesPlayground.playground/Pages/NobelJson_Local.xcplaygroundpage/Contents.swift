//: [Previous](@previous)

//: # Nobel example

//: Nobel JSON at
//: [Nobel data](https://api.nobelprize.org/2.1/nobelPrizes?offset=2&limit=10&sort=asc&nobelPrizeYear=2020&format=json&csvLang=en)

//: JSON struct at:
//:
//: [https://quicktype.io](https://quicktype.io)
//:
//: JSON visualizacion at
//: [JSON Crack](https://jsoncrack.com)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

let json = """
{
    "nobelPrizes": [
        {
            "awardYear": "2020",
            "category": {
                "en": "Economic Sciences",
                "no": "Økonomi",
                "se": "Ekonomi"
            },
            "categoryFullName": {
                "en": "The Sveriges Riksbank Prize in Economic Sciences in Memory of Alfred Nobel",
                "no": "Sveriges Riksbanks pris i økonomisk vitenskap til minne om Alfred Nobel",
                "se": "Sveriges Riksbanks pris i ekonomisk vetenskap till Alfred Nobels minne"
            },
            "dateAwarded": "2020-10-12",
            "prizeAmount": 10000000,
            "prizeAmountAdjusted": 10000000,
            "links": [
                {
                    "rel": "nobelPrize",
                    "href": "https://api.nobelprize.org/2/nobelPrize/eco/2020",
                    "action": "GET",
                    "types": "application/json"
                }
            ],
            "laureates": [
                {
                    "id": "995",
                    "knownName": {
                        "en": "Paul R. Milgrom"
                    },
                    "fullName": {
                        "en": "Paul R. Milgrom"
                    },
                    "portion": "1/2",
                    "sortOrder": "1",
                    "motivation": {
                        "en": "for improvements to auction theory and inventions of new auction formats",
                        "se": "för förbättringar av auktionsteorin och uppfinningar av nya auktionsformat"
                    },
                    "links": [
                        {
                            "rel": "laureate",
                            "href": "https://api.nobelprize.org/2/laureate/995",
                            "action": "GET",
                            "types": "application/json"
                        }
                    ]
                },
                {
                    "id": "996",
                    "knownName": {
                        "en": "Robert B. Wilson"
                    },
                    "fullName": {
                        "en": "Robert B. Wilson"
                    },
                    "portion": "1/2",
                    "sortOrder": "2",
                    "motivation": {
                        "en": "for improvements to auction theory and inventions of new auction formats",
                        "se": "för förbättringar av auktionsteorin och uppfinningar av nya auktionsformat"
                    },
                    "links": [
                        {
                            "rel": "laureate",
                            "href": "https://api.nobelprize.org/2/laureate/996",
                            "action": "GET",
                            "types": "application/json"
                        }
                    ]
                }
            ]
        }
        
    ],
    "meta": {
        "offset": 1,
        "limit": 10,
        "nobelPrizeYear": 2020,
        "count": 6,
        "terms": "https://www.nobelprize.org/about/terms-of-use-for-api-nobelprize-org-and-data-nobelprize-org/",
        "license": "https://www.nobelprize.org/about/terms-of-use-for-api-nobelprize-org-and-data-nobelprize-org/#licence",
        "disclaimer": "https://www.nobelprize.org/about/terms-of-use-for-api-nobelprize-org-and-data-nobelprize-org/#disclaimer"
    },
    "links": {
        "first": "https://masterdataapi.nobelprize.org/2.1/nobelPrizes?offset=0&limit=10&nobelPrizeYear=2020",
        "self": "https://masterdataapi.nobelprize.org/2.1/nobelPrizes?offset=1&limit=10&nobelPrizeYear=2020",
        "last": "https://masterdataapi.nobelprize.org/2.1/nobelPrizes?offset=0&limit=10&nobelPrizeYear=2020"
    }
}

"""

struct Root: Codable {
    let nobelPrizes :[NobelPrize]
}

struct NobelPrize: Codable {
    let awardYear:String
   // let dateAwarded: String
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



let data = Data(json.utf8)


do {
    let decodedData: Root = try JSONDecoder().decode(Root.self,
                                                     from: data)
    for item in decodedData.nobelPrizes {
        print("Category: \(item.category.en)")
        print("Prize amount: \(item.prizeAmount)")
        print ("Date awarded: \(item.awardYear)")
        for laureate in item.laureates {
            let laureateValue = (laureate.fullName?.en )
            print("Laureate:  \(laureateValue ?? "Organization")")
            print("Motivation: \(laureate.motivation.en)")
        }
        
        print("====")
    }
    
    
    print("===================================")
} catch {
    print("Failed to decode JSON")
    print(error)
}



//: [Next](@next)
