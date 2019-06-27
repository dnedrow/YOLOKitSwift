//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

var args: va_list?
var keys = []
var objs = []
var key = arg0
var obj = self[key]
va_end(args)

extension [AnyHashable : Any] {
    /**
     Returns a new dictionary consisting of the given keys.
    */
    func pick() -> @escaping (Any?, ) -> [AnyHashable : Any] {
        return
        as? Any? arg0
    }
}