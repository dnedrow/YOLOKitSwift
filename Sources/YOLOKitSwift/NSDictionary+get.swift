//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [AnyHashable : Any] {
    /**
     Returns the value associated with a given key.

        id rv = @{@1: @1, @2: @4}.get(@2);
        // rv => @4

     @see -objectForKey:
    */
    func get() -> @escaping (Any?) -> Any? {
        return { key in
            return self[key] as? @escaping (Any?) -> Any ?? { _ in return  }
        }
    }
}