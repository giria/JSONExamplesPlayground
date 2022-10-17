//: [Previous](@previous)
import Foundation
import UIKit
import PlaygroundSupport


// using a function with closure
func downloadImage(from urlString: String, with completion: @escaping (_ response: (status: Bool, image: UIImage? ) ) -> Void) {
    guard let url = URL(string: urlString) else {
        completion((status: false, image: nil))
        return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in
        guard error == nil else {
            completion((status: false, image: nil))
            return
        }

        guard let httpURLResponse = response as? HTTPURLResponse,
              httpURLResponse.statusCode == 200,
              let data = data else {
            completion((status: false, image: nil))
            return
        }

        let image = UIImage(data: data)
        completion((status: true, image: image))
    }.resume()
}

// usage
downloadImage(from: "https://dummyjson.com/image/i/products/1/1.jpg") { (status, image) in
    guard status == true  else { return  }
    let image = image
    print("image")
}
    


PlaygroundPage.current.needsIndefiniteExecution = true
//: [Next](@next)
