//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension Set<AnyHashable> {
    /**
     Returns a new, one-dimensional array that is a recursive flattening of
     the receiver.

        id rv = @[@[@1, @[@2]], @3, @[@4]].flatten
        // rv => @[@1, @2, @3, @4]
    */
    func flatten() -> Any? {
        var aa: Set<AnyHashable> = []
        for o in self {
            if (o is [Any]) {
                aa.formUnion(Set(o.flatten().compactMap { $0 as? AnyHashable }))
            } else if (o is Set<AnyHashable>) {
                aa.formUnion(Set(Array(o).compactMap { $0 as? AnyHashable }))
            } else {
                aa.insert(o)
            }
        }
        return aa
    }
}