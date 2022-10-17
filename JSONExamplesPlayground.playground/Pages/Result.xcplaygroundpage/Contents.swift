//: [Previous](@previous)

/// Define the potential error cases.
enum EvenNumberError: Error {
    case emptyArray
}

/// A method capable of fetching even numbers from a given collection.
func evenNumbers(in collection: [Int]) -> Result<[Int], EvenNumberError> {
    /// If the given collection is empty, return a failure instead.
    guard !collection.isEmpty else {
        return .failure(EvenNumberError.emptyArray)
    }
    
    /// The collection has items, fetch all even numbers.
    let evenNumbers = collection.filter { number in number % 2 == 0 }
    return .success(evenNumbers)
}

let array = [5,2,14,7,10]
print( evenNumbers(in: array))  // Prints: success([2, 14, 10])
let empty:[Int] = []
print( evenNumbers(in: empty)) //Prints: failure(__lldb_expr_7.EvenNumberError.emptyArray)


//: [Next](@next)
