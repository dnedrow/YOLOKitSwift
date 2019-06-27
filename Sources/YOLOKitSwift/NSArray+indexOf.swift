//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns the index of the given object in the receiver or `NSNotFound` if
     the object was not found.

        uint rv = @[@1, @2, @3, @4].indexOf(@2);
        // rv => 1

     PROTIP: `NSNotFound` has the value `NSIntegerMax` so you don’t need to
     directly check for it, you can instead check if the returned value is
     less than the count of the receiver.
    */
    func indexOf() -> @escaping (_ obj: Any?) -> Int {
        return { obj in
            if let obj = obj {
                return (self as NSArray).index(of: obj)
            }
            return 0
        }
    }
}