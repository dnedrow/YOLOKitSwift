//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [AnyHashable] {
    /**
     Treats receiver like a stack and removes the last object, returning it.

        NSMutableArray *aa = [NSMutableArray new];
        id rv = aa.push(@1).push(@2).push(@3).pop()
        // rv => @3

     @see -push
    */
    func pop() -> Any? {
        if count != 0 {
            let x = count - 1
            let o = self[x]
            remove(at: x)
            return o
        } else {
            return nil
        }
    }
}