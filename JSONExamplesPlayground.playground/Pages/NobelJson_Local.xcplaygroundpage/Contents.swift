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

let json = """
{
    "nobelPrizes": [
        {
            "awardYear": "2020",
            "category": {
                "en": "Literature",
                "no": "Litteratur",
                "se": "Litteratur"
            },
            "categoryFullName": {
                "en": "The Nobel Prize in Literature",
                "no": "Nobelprisen i litteratur",
                "se": "Nobelpriset i litteratur"
            },
            "dateAwarded": "2020-10-08",
            "prizeAmount": 10000000,
            "prizeAmountAdjusted": 10000000,
            "links": [
                {
                    "rel": "nobelPrize",
                    "href": "https://api.nobelprize.org/2/nobelPrize/lit/2020",
                    "action": "GET",
                    "types": "application/json"
                }
            ],
            "laureates": [
                {
                    "id": "993",
                    "knownName": {
                        "en": "Louise Glück"
                    },
                    "fullName": {
                        "en": "Louise Glück"
                    },
                    "portion": "1",
                    "sortOrder": "1",
                    "motivation": {
                        "en": "for her unmistakable poetic voice that with austere beauty makes individual existence universal",
                        "se": "för hennes omisskännliga poetiska röst, som med sträng skönhet gör den enskilda människans existens universell"
                    },
                    "links": [
                        {
                            "rel": "laureate",
                            "href": "https://api.nobelprize.org/2/laureate/993",
                            "action": "GET",
                            "types": "application/json"
                        }
                    ]
                }
            ]
        },
        {
            "awardYear": "2020",
            "category": {
                "en": "Peace",
                "no": "Fred",
                "se": "Fred"
            },
            "categoryFullName": {
                "en": "The Nobel Peace Prize",
                "no": "Nobels fredspris",
                "se": "Nobels fredspris"
            },
            "dateAwarded": "2020-10-09",
            "prizeAmount": 10000000,
            "prizeAmountAdjusted": 10000000,
            "links": [
                {
                    "rel": "nobelPrize",
                    "href": "https://api.nobelprize.org/2/nobelPrize/pea/2020",
                    "action": "GET",
                    "types": "application/json"
                }
            ],
            "laureates": [
                {
                    "id": "994",
                    "orgName": {
                        "en": "World Food Programme",
                        "no": "Verdens matvareprogram"
                    },
                    "acronym": "WFP",
                    "portion": "1",
                    "sortOrder": "1",
                    "motivation": {
                        "en": "for its efforts to combat hunger, for its contribution to bettering conditions for peace in conflict-affected areas and for acting as a driving force in efforts to prevent the use of hunger as a weapon of war and conflict",
                        "no": "for dets innsats i kampen mot sult, for dets bidrag til å skape forutsetninger for fred i konfliktutsatte områder, og for å være en pådriver i arbeidet mot bruken av sult som et våpen i krig og konflikt"
                    },
                    "links": [
                        {
                            "rel": "laureate",
                            "href": "https://api.nobelprize.org/2/laureate/994",
                            "action": "GET",
                            "types": "application/json"
                        }
                    ]
                }
            ]
        },
        {
            "awardYear": "2020",
            "category": {
                "en": "Physics",
                "no": "Fysikk",
                "se": "Fysik"
            },
            "categoryFullName": {
                "en": "The Nobel Prize in Physics",
                "no": "Nobelprisen i fysikk",
                "se": "Nobelpriset i fysik"
            },
            "dateAwarded": "2020-10-06",
            "prizeAmount": 10000000,
            "prizeAmountAdjusted": 10000000,
            "links": [
                {
                    "rel": "nobelPrize",
                    "href": "https://api.nobelprize.org/2/nobelPrize/phy/2020",
                    "action": "GET",
                    "types": "application/json"
                }
            ],
            "laureates": [
                {
                    "id": "988",
                    "knownName": {
                        "en": "Roger Penrose"
                    },
                    "fullName": {
                        "en": "Roger Penrose"
                    },
                    "portion": "1/2",
                    "sortOrder": "1",
                    "motivation": {
                        "en": "for the discovery that black hole formation is a robust prediction of the general theory of relativity",
                        "se": "för upptäckten att bildandet av svarta hål är en robust förutsägelse av den allmänna relativitetsteorin"
                    },
                    "links": [
                        {
                            "rel": "laureate",
                            "href": "https://api.nobelprize.org/2/laureate/988",
                            "action": "GET",
                            "types": "application/json"
                        }
                    ]
                },
                {
                    "id": "989",
                    "knownName": {
                        "en": "Reinhard Genzel"
                    },
                    "fullName": {
                        "en": "Reinhard Genzel"
                    },
                    "portion": "1/4",
                    "sortOrder": "2",
                    "motivation": {
                        "en": "for the discovery of a supermassive compact object at the centre of our galaxy",
                        "se": "för upptäckten av ett supermassivt kompakt objekt i Vintergatans centrum"
                    },
                    "links": [
                        {
                            "rel": "laureate",
                            "href": "https://api.nobelprize.org/2/laureate/989",
                            "action": "GET",
                            "types": "application/json"
                        }
                    ]
                },
                {
                    "id": "990",
                    "knownName": {
                        "en": "Andrea Ghez"
                    },
                    "fullName": {
                        "en": "Andrea Ghez"
                    },
                    "portion": "1/4",
                    "sortOrder": "3",
                    "motivation": {
                        "en": "for the discovery of a supermassive compact object at the centre of our galaxy",
                        "se": "för upptäckten av ett supermassivt kompakt objekt i Vintergatans centrum"
                    },
                    "links": [
                        {
                            "rel": "laureate",
                            "href": "https://api.nobelprize.org/2/laureate/990",
                            "action": "GET",
                            "types": "application/json"
                        }
                    ]
                }
            ]
        },
        {
            "awardYear": "2020",
            "category": {
                "en": "Physiology or Medicine",
                "no": "Fysiologi eller medisin",
                "se": "Fysiologi eller medicin"
            },
            "categoryFullName": {
                "en": "The Nobel Prize in Physiology or Medicine",
                "no": "Nobelprisen i fysiologi eller medisin",
                "se": "Nobelpriset i fysiologi eller medicin"
            },
            "dateAwarded": "2020-10-05",
            "prizeAmount": 10000000,
            "prizeAmountAdjusted": 10000000,
            "links": [
                {
                    "rel": "nobelPrize",
                    "href": "https://api.nobelprize.org/2/nobelPrize/med/2020",
                    "action": "GET",
                    "types": "application/json"
                }
            ],
            "laureates": [
                {
                    "id": "985",
                    "knownName": {
                        "en": "Harvey J. Alter"
                    },
                    "fullName": {
                        "en": "Harvey J. Alter"
                    },
                    "portion": "1/3",
                    "sortOrder": "1",
                    "motivation": {
                        "en": "for the discovery of Hepatitis C virus",
                        "se": "för upptäckten av hepatit C-virus"
                    },
                    "links": [
                        {
                            "rel": "laureate",
                            "href": "https://api.nobelprize.org/2/laureate/985",
                            "action": "GET",
                            "types": "application/json"
                        }
                    ]
                },
                {
                    "id": "986",
                    "knownName": {
                        "en": "Michael Houghton"
                    },
                    "fullName": {
                        "en": "Michael Houghton"
                    },
                    "portion": "1/3",
                    "sortOrder": "2",
                    "motivation": {
                        "en": "for the discovery of Hepatitis C virus",
                        "se": "för upptäckten av hepatit C-virus"
                    },
                    "links": [
                        {
                            "rel": "laureate",
                            "href": "https://api.nobelprize.org/2/laureate/986",
                            "action": "GET",
                            "types": "application/json"
                        }
                    ]
                },
                {
                    "id": "987",
                    "knownName": {
                        "en": "Charles M. Rice"
                    },
                    "fullName": {
                        "en": "Charles M. Rice"
                    },
                    "portion": "1/3",
                    "sortOrder": "3",
                    "motivation": {
                        "en": "for the discovery of Hepatitis C virus",
                        "se": "för upptäckten av hepatit C-virus"
                    },
                    "links": [
                        {
                            "rel": "laureate",
                            "href": "https://api.nobelprize.org/2/laureate/987",
                            "action": "GET",
                            "types": "application/json"
                        }
                    ]
                }
            ]
        }
    ],
    "meta": {
        "offset": 2,
        "limit": 10,
        "nobelPrizeYear": 2020,
        "count": 6,
        "terms": "https://www.nobelprize.org/about/terms-of-use-for-api-nobelprize-org-and-data-nobelprize-org/",
        "license": "https://www.nobelprize.org/about/terms-of-use-for-api-nobelprize-org-and-data-nobelprize-org/#licence",
        "disclaimer": "https://www.nobelprize.org/about/terms-of-use-for-api-nobelprize-org-and-data-nobelprize-org/#disclaimer"
    },
    "links": {
        "first": "https://masterdataapi.nobelprize.org/2.1/nobelPrizes?offset=0&limit=10&nobelPrizeYear=2020",
        "self": "https://masterdataapi.nobelprize.org/2.1/nobelPrizes?offset=2&limit=10&nobelPrizeYear=2020",
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
