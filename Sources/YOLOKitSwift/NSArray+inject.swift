//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Combines all elements of the receiver by applying a binary operation.

        id rv = @[@1, @2, @3, @4].inject(@{}, ^(NSMutableDictionary *memo, NSNumber *n){
            memo[n] = @(n.intValue * n.intValue);
            return memo;
        });
        // rv => @{@1: @1, @2: @4, @3: @9, @4: @16}

     PROTIP: If you feed `inject` a non-mutable dictionary or array YOLOKit
     mutates it for your block, and then finally returns a non-mutable copy.

     @see -reject
    */
    func inject() -> @escaping (Any?, _ : Any?) -> Any? {
        return { initial_memo, block in
            let wasNonMutable = initial_memo?.classForCoder == [Any].self || initial_memo?.classForCoder == [AnyHashable : Any].self || initial_memo?.classForCoder == Set<AnyHashable>.self
            if wasNonMutable {
                //initial_memo = initial_memo    // Skipping redundant initializing to itself
            }

            var memo = initial_memo
            for obj in self {
                memo = block?(memo, obj)
            }
            return wasNonMutable ? memo?.copy() : memo as? @escaping (Any?, _ : Any?) -> Any ?? { _,_ in return  }
        }
    }
}