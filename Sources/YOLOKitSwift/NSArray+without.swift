//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns a new array where objects in the given array are removed from
     the receiver.

        id rv = @[@1, @2, @3, @4, @5, @6].without(@2);
        // rv => @[@1, @3, @4, @5, @6]

        id rv = @[@1, @2, @3, @4, @5, @6].without(@[@2, @3]);
        // rv => @[@1, @4, @5, @6]
    */
    func without() -> @escaping (Any?) -> [Any] {
        return { arrayOrSet in
            if arrayOrSet == nil {
                return self as [Any]
            }

            let objs = (arrayOrSet is Set<AnyHashable>) ? Array(arrayOrSet) : (arrayOrSet is [Any]) ? (arrayOrSet as? [Any?]) : [arrayOrSet]
            let rv = self
            rv = rv.filter({ !objs.contains($0) })
            return rv as [Any]
        }
    }
}