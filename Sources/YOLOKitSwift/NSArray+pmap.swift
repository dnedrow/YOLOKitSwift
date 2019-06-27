//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Map, but run in parallel. Obviously: be thread safe in your block. The
     call waits for all elements to be processed. Typically not worth using
     unless you have large arrays since the overhead of
     thread-synchronization may be greater than the parallel savings
     otherwise.

     @see -map
    */
    func pmap() -> @escaping (_ : Any?) -> [Any] {
        return { block in
            let aa = NSPointerArray()
            aa.count = self.count
            (self as NSArray).enumerateObjects(options: .concurrent, using: { obj, idx, stop in
                let o = block?(obj)
                aa.replacePointer(at: idx, withPointer: &o)
            })

            aa.compact()
            let rv = aa.allObjects

            for x in 0..<aa.count {
            }

            return rv
        }
    }
}