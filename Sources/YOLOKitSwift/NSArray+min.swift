//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns the element for which the given block returns the smallest
     integer.

        id rv = @[@4, @2, @1, @3].min(^(NSNumber *n){
            return n;
        });
        // rv => @1

     NOTE: currently you must return an integer, we plan to allow you to
     return whatever you like.
    */
    func min() -> @escaping (Any?) -> Any? {
        return { block in
            var value = NSInteger.max
            var keeper: Any? = nil
            for o in self {
                let ov = block(o)
                if ov < value {
                    value = ov
                    keeper = o
                }
            }
            return keeper as? @escaping (Any?) -> Any ?? { _ in return  }
        }
    }
}