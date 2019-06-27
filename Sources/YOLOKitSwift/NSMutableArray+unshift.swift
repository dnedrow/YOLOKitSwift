//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [AnyHashable] {
    /**
     Inserts the given object at the front of receiver, moving all other
     objects in the receiver up one index.

        NSMutableArray *aa = [NSMutableArray new];
        id rv = aa.unshift(@1).unshift(@2).unshift(@3);
        // rv => @[@3, @2, @1]

     @see -shift
    */
    func unshift() -> @escaping (_ o: Any?) -> [AnyHashable] {
        return { o in
            if o != nil {
                if let o = o as? ObjectType {
                    self.insert(o, at: 0)
                }
            }
            return self
        }
    }
}