//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension Set<AnyHashable> {
    /**
     Returns the element for which the given block returns the largest
     integer.

        id rv = @[@4, @2, @1, @3].max(^(NSNumber *n){
            return n.intValue;
        });
        // rv => @4

        id rv = @[@4, @2, @1, @3].max(^(NSNumber *n){
            return (n.intValue - 3) * (n.intValue - 3);
        });
        // rv => @1

     NOTE: currently you must return an integer, we plan to allow you to
     return whatever you like.
    */
    func max() -> @escaping (Any?) -> Any? {
        return { block in
            var value = NSInteger.min
            var keeper: Any? = nil
            for o in self {
                let ov = block(o)
                if ov > value {
                    value = ov
                    keeper = o
                }
            }
            return keeper as? @escaping (Any?) -> Any ?? { _ in return  }
        }
    }
}