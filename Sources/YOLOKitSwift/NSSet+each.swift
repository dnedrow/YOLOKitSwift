//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension Set<AnyHashable> {
    /**
     @see NSArray’s -each
    */
    func each() -> @escaping (_ : ) -> Set<AnyHashable> {
        return { block in
            self.enumerateObjects(usingBlock: { obj, stop in
                block(obj)
            })
            return self
        }
    }
}