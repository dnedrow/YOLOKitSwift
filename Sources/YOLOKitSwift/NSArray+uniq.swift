//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns a new array by removing duplicate values in the receiver.

        id rv = @[@1, @1, @2].uniq;
        // rv => @[@1, @2]

     PROTIP: Order is preserved.

     PROTIP: Equality is determined via `-hash` and `-isEqual:`.
    */
    func uniq() -> Any? {
        return (NSOrderedSet(array: self as [Any])).array
    }
}