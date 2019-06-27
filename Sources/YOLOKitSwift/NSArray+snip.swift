//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Snips the end off the array. Returns the receiver *without* the last `n`
     elements.

        id rv = @[@1, @2, @3, @4, @5, @6].snip(2);
        // rv => @[@1, @2, @3, @4]

     @see -first
     @see -last
     @see -skip
     @see -slice
    */
    func snip() -> @escaping (_ numberToTrim: Int) -> [Any] {
        return { num in
            return self.slice()(0, self.count - num)
        }
    }
}