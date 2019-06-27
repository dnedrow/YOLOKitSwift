//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [AnyHashable : Any] {
    /**
     Invokes the given block once for each key, value pair in the receiver.
     Returns an array containing the values returned by the block.

        id rv = @{@1: @2, @2: @4, @3: @9}.map(^(id key, id obj){
            return @([key intValue] + [obj intValue]);
        }).sort;

        // rv = @[@3, @6, @12]
        // NOTE `sort` called illustratively because dictionary order is undefined.
    */
    func map() -> @escaping (_ : Any?) -> [Any] {
        return { block in
            let objs = [Any?](repeating: nil, count: self.count)
            let ii = 0
            for key in self {
                let o = block?(key, self[key])
                //if o
                objs[ii] = o
                ii += 1
            }
            return objs[..<ii]
        }
    }
}