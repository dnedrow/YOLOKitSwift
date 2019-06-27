//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Skips the first `n` elements and returns the rest of the array.

        id rv = @[@1, @2, @3, @4, @5, @6].skip(2);
        // rv => @[@3, @4, @5, @6]

     @see -first
     @see -last
     @see -slice
     @see -snip
    */
    func skip() -> @escaping (_ numberToTrim: Int) -> [Any] {
        return { num in
            return self.last()(self.count - num)
        }
    }
}