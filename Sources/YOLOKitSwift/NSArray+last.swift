//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns the last `n` elements from receiver.

        id rv = @[@1, @2, @3, @4, @5, @6].last(2);
        // rv => @[@5, @6]

     PROTIP: If there are insufficient elements in the array, YOLOKit returns
     as many as it can.
    */
    func last() -> @escaping (Int) -> [Any] {
        return { num in
            return self.slice()(self.count - num, num)
        }
    }
}