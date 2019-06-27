//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns a new array that is shuffled.

     NOTE: Uses the Fisher–Yates shuffle algorithm.
    */
    func shuffle() -> Any? {
        switch count {
            case 0, 1:
                return self
            case 2:
                return [self[1], self[0]]
            default:
                var ll = self as [Any] as? [AnyHashable]
                i -= 1
                var i = (ll?.count ?? 0) - 1
                while i {
                    swap(&ll?[Int(arc4random()) % (i + 1)], &ll?[i])
                    i
                }
                return ll
        }
    }
}