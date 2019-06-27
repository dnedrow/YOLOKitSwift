//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns a new array rotated about the provided index.

        id rv = @[@1, @2, @3, @4, @5, @6].rotate(2);
        // rv => @[@3, @4, @5, @6, @1, @2]

        id rv = @[@1, @2, @3, @4, @5, @6].rotate(-2);
        // rv => @[@5, @6, @1, @2, @3, @4] 
    */
    func rotate() -> @escaping (Int) -> [Any] {
        return { pivot in
            if pivot < 0 {
                pivot = self.count + pivot
            }
            return self.skip()(pivot).concat(self.snip()(self.count - pivot))
        }
    }
}