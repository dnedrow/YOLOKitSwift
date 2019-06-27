//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [AnyHashable : Any] {
    /**
     Returns a new, merged dictionary.

     @param higherPriorityDictionary The dictionary to merge with the
     receiver. If any keys conflict, the values in this dictionary take precendence.

        id rv = @{@1: @1, @2: @4}.extend(@{@1: @9, @10: @100});
        // rv => @{@1: @9, @2: @4, @10: @100}
    */
    func extend() -> @escaping ([AnyHashable : Any]?) -> [AnyHashable : Any] {
        return { key in
            if key == nil {
                return self as [AnyHashable : Any]
            }
            var cp = self
            for (k, v) in key { cp[k] = v }
            return cp as [AnyHashable : Any]
        }
    }
}