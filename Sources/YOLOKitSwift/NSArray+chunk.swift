//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Chunks the receiver into a new array of chunk-size arrays.

        id rv = @[@1, @2, @3, @4].chunk(2)
        // rv => @[@[@1, @2], @[@3, @4]]
    */
    func chunk() -> @escaping (Int) -> [Any] {
        return { size in
            let aa = []
            let n = self.count / size
            for x in 0..<n {
                aa.append(self.slice()(x * size, size))
            }
            return aa
        }
    }
}