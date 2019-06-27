//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [AnyHashable : Any] {
    /**
     Returns a new dictionary where values for objects in the given array/set/object 
     are removed from the receiver.

        id rv = @{@1:@"1", @2:@"2", @3:@"3", @4:@"4", @5:@"5", @6:@"6"].without(@2);
        // rv => @[@1:@"1", @3:@"3", @4:@"4", @5:@"5", @6:@"6"]

        id rv = @[@1:@"1", @2:@"2", @3:@"3", @4:@"4", @5:@"5", @6:@"6"].without(@[@2, @3]);
        // rv => @[@1:@"1", @4:@"4", @5:@"5", @6:@"6"]
    */
    func without() -> @escaping (Any?) -> [AnyHashable : Any] {
        return { arrayOrSetOrObject in
            if arrayOrSetOrObject == nil {
                return self as [AnyHashable : Any]
            }

            let objs = (arrayOrSetOrObject is Set<AnyHashable>) ? Array(arrayOrSetOrObject) : (arrayOrSetOrObject is [Any]) ? (arrayOrSetOrObject as? [Any?]) : [arrayOrSetOrObject]
            let rv = self
            for k in objs { rv.removeValueForKey(k) }
            return rv as [AnyHashable : Any]
        }
    }
}