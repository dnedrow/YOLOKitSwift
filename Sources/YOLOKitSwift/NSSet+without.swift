//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension Set<AnyHashable> {
    /**
     Returns a new set where objects in the given set/array/object
     are removed from the receiver.

        id rv = @[@1, @2, @3, @4, @5, @6].without(@2);
        // rv => @[@1, @3, @4, @5, @6]

        id rv = @[@1, @2, @3, @4, @5, @6].without(@[@2, @3]);
        // rv => @[@1, @4, @5, @6]
    */
    func without() -> @escaping (Any?) -> Set<AnyHashable> {
        return { arrayOrSetOrObject in
            if arrayOrSetOrObject == nil {
                return self as Set<AnyHashable>
            }

            let objs = (arrayOrSetOrObject is Set<AnyHashable>) ? Array(arrayOrSetOrObject) : (arrayOrSetOrObject is [Any]) ? (arrayOrSetOrObject as? [Any?]) : [arrayOrSetOrObject]
            let rv = self
            rv = rv.filter({ !objs.contains($0) })
            return rv as Set<AnyHashable>
        }
    }
}