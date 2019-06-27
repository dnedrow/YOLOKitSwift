//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [AnyHashable] {
    /**
     Removes the receiver’s first object and returns it.

        NSMutableArray *aa = [NSMutableArray new];
        id rv = aa.unshift(@1).unshift(@2).unshift(@3).shift();
        // rv => @3

     @see -unshift
    */
    func shift() -> Any? {
        if count == 0 {
            return nil
        }
        let o = first
        remove(at: 0)
        return o
    }
}