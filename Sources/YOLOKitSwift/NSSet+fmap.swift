//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension Set<AnyHashable> {
    /**
     @see NSArray's -fmap
    */
    func fmap() -> @escaping (_ : Any?) -> Set<AnyHashable> {
        return { block in
            let mapped = [Any?](repeating: nil, count: self.count)
            let ii = 0
            for mappable in self {
                let o = block?(mappable)
                //if o
                mapped[ii] = o
                ii += 1
            }
            return Set<AnyHashable>([mapped])
        }
    }
}