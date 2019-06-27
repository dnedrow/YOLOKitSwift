//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns a new array that is the receiver with the given array
     concatenated to the end.

        id rv = @[@1, @2].concat(@[@3, @4]);
        // rv => @[@1, @2, @3, @4]
    */
    func concat() -> @escaping ([Any]?) -> [Any] {
        return { other_array in
            if let other_array = other_array as? [Any] {
                return self + other_array
            }
            return { _ in return [] }
        }
    }
}