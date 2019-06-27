//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension Set<AnyHashable> {
    /**
     Passes each entry in the array to the given block, returning the first
     element for which block is not `NO`. If no object matches, returns
     `nil`.

        id rv = @[@1, @2, @3, @4].find(^(id n){
            return [n isEqual:@3];
        });
        // rv => @3
    */
    func find() -> @escaping (Any?) -> Any? {
        return { block in
            for item in self {
                if block(item) {
                    return item
                }
            }
            return nil
        }
    }
}