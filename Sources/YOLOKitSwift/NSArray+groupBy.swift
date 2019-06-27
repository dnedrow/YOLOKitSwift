//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Groups the collection by result of the given block.

        id rv = @[@1, @2, @3, @4].groupBy(^(NSNumber *n) {
            return @(n.intValue % 2);
        });
        // rv => @{@0: @[@1, @3], @1: @[@2, @4]}
    */
    func groupBy() -> @escaping (_ : Any?) -> [AnyHashable : Any] {
        return { block in
            var dict = [:]
            for o in self {
                let key = block?(o)
                if dict[key] == nil {
                    dict[key] = [o]
                } else {
                    dict[key].append(o)
                }
            }
            return dict
        }
    }
}