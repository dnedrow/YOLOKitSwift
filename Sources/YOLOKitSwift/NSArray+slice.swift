//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns a subarray consisting of the given number of elements from the
     given starting index.

        id rv = @[@1, @2, @3, @4, @5, @6].slice(2, 2));
        // rv => @[@3, @4]

     PROTIP: Use slice instead of `first`, `last`, `skip` and `snip`… when
     you must. If you find yourself writing `array.slice(0, 4)` then consider
     `array.first(4)` instead: it’s more expressive, more explicit and
     shorter to boot.

     @see -first
     @see -last
     @see -skip
     @see -snip
    */
    func slice() -> @escaping (Int, Int) -> [Any] {
        return { start, length in
            let N = self.count

            if N == 0 {
                return self
            }

            // forgive
            if start > N - 1 {
                start = N - 1
            }
            if start + length > N {
                length = N - start
            }

            return (self as NSArray).subarray(with: NSRange(location: start, length: length))
        }
    }
}