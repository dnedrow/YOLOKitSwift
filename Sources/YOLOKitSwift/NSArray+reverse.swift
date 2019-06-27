//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns a new array that is the receiver, reversed.

       id rv = @[@1, @2, @3, @4].reverse;
       // rv => @[@4, @3, @2, @1]

     NOTE: Did you know about `array.reverseEnumerator.allObjects`? We don’t
     use that in fact to save allocations, but you could do that on projects
     without YOLOKit.
    */
    func reverse() -> [Any]? {
        var aa = self as? [AnyHashable]
        let N = count
        let X = N / 2
        for x in 0..<X {
            let tmp = aa?[x]
            aa?[x] = aa?[N - x - 1]
            aa?[N - x - 1] = tmp
        }
        return aa
    }
}