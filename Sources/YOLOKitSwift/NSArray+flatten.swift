//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns a new, one-dimensional array that is a recursive flattening of
     the receiver.

        id rv = @[@[@1, @[@2]], @3, @[@4]].flatten
        // rv => @[@1, @2, @3, @4]
    */
    func flatten() -> Any? {
        var aa: [AnyHashable] = []
        for o in self {
            if (o is [Any]) {
                aa.append(contentsOf: o.flatten())
            } else {
                aa.append(o)
            }
        }
        return aa
    }
}