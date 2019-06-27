//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension Set<AnyHashable> {
    /**
     Returns a new set with the concatenated results of running block once
     for every element in the receiver.

        id rv = @[@1, @2, @3, @4].flatMap(^(id n){
            return @[n, n];
        });
        // rv => @[@1, @1, @2, @2, @3, @3, @4, @4]

        id rv = @[@1, @2, @3, @4].flatMap(^(id n){
            return [NSSet setWithArray:@[n, n]];
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
    func flatMap() -> @escaping (_ : Set<AnyHashable>?) -> Set<AnyHashable> {
        return { block in
            var rv = []
            for o in self {
                let m = block?(o)
                if (m is Set<AnyHashable>) {
                    rv.formUnion(Set(Array(m).compactMap { $0 as? AnyHashable }))
                } else {
                    rv.formUnion(Set(m.compactMap { $0 as? AnyHashable }))
                }
            }
            return rv
        }
    }
}