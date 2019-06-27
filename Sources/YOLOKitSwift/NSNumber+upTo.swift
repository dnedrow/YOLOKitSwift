//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension NSNumber {
    /**
     Returns an array of consequentive numbers from receiver up to (and
     including) the given number.

        id rv = @1.upTo(6);
        // rv => @[@1, @2, @3, @4, @5, @6]
    */
    func upTo() -> @escaping (Int) -> [Any] {
        return { upTo in
            let start = self.intValue
            let count = upTo - start + 1
            let objs = [Any?](repeating: nil, count: count)
            for x in 0..<count {
                objs[x] = NSNumber(value: start + x)
            }
            return objs[..<count]
        }
    }
}