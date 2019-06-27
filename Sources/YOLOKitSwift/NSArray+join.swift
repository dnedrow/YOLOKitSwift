//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns a string of all the receiver’s elements joined with the provided
     separator string.

        id rv = @[@1, @2, @3, @4].join(@",");
        // rv => @"1,2,3,4"

        id rv = @[@1, @2, @3, @4].join(@"");
        // rv => @"1234"

     PROTIP: `-description` is called on all objects before joining them.
    */
    func join() -> @escaping (String?) -> String {
        return { separator in
            return self.pluck()("description").joined(separator: separator ?? "")
        }
    }
}