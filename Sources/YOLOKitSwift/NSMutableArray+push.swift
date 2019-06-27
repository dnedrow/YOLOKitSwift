//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [AnyHashable] {
    /**
     Treats receiver like a stack and adds the given object to the end of the
     receiver.

        NSMutableArray *aa = [NSMutableArray new];
        id rv = aa.push(@1).push(@2).push(@3)
        // rv => @[@1, @2, @3]

     @see -pop
    */
    func push() -> @escaping (Any?) -> [AnyHashable] {
        return { o in
            if o != nil {
                if let o = o {
                    self.append(o)
                }
            }
            return self
        }
    }
}