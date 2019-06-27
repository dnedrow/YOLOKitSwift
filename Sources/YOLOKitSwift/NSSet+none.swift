//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation
import ObjectiveC

extension Set<AnyHashable> {
    /**
        BOOL rv = @[@1, @2, @3].none(^(id o){
            return [o intValue] > 4;
        });
        // rv => YES

     Instead of a block, you can pass a `Class` object.

        BOOL rv = @[@1, @2, @3].none(NSNumber.class);
        // rv => NO
    */
    func none() -> @escaping (_ o: Any?) -> Bool {
        return { arg in
            var block: ((_ o: Any?) -> Bool)? = nil

            if (arg as? String) == NSString.class /*or segfaults!*/ || YOLOIsClass(arg) {
                let cls = arg
                block = { o in
                    return o is cls
                }
            } else {
                block = arg as? ((_ o: Any?) -> Bool)
            }

            for o in self {
                if block?(o) {
                    return false
                }
            }
            return true
        }
    }
}