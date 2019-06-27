//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns a new array with the concatenated results of running block once
     for every element in the receiver.

        id rv = @[@1, @2, @3, @4].flatMap(^(id n){
            return @[n, n];
        });
        // rv => @[@1, @1, @2, @2, @3, @3, @4, @4]

        id rv = @[@1, @2, @3, @4].flatMap(^(id n){
            return @[n, @[n]];
        });
        // rv => @[@1, @[@1], @2, @[@2], @3, @[@3], @4, @[@4]]

     PROTIP: Useful over vanilla map followed by a flatten because flatten is
     recursive, and you may want to preserve array relationships beyond the
     first level. Also, `flatMap` is technically more efficient.
    */
    func flatMap() -> @escaping (_ : [Any]?) -> [Any] {
        return { block in
            var rv = []
            for o in self {
                let m = block?(o)
                //if m
                if let m = m as? [AnyHashable] {
                    rv.append(contentsOf: m)
                }
            }
            return rv
        }
    }
}