//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns the first `n` elements of the receiver.

        id rv = @[@1, @2, @3, @4, @5, @6].first(2);
        // rv => @[@1, @2]

     PROTIP: YOLOKit is forgiving; if the array doesn’t have enough elements,
     `first` returns as many as it can.
    */
    func first() -> @escaping (Int) -> [Any] {
        return { num in
            return self.slice()(0, num)
        }
    }
}