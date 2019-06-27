//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns a random element from the receiver.
    */
    func sample() -> Any? {
        return count == 0 ? nil : self[arc4random_uniform(UInt32(count))]
    }
}