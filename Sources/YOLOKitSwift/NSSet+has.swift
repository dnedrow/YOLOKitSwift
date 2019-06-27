//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension Set<AnyHashable> {
    /**
        BOOL rv = @[@1, @2, @3].has(@2)
        // rv => YES

    Short-hand for containsObject:. Provided because doing a map, then a
    select and a few more chained dot-notations are commonly followed with
    the need to then determine if a particular value is in the resulting
    array, and then having to square bracket the whole chain is ugly.

    We decided not to override any or find with the capability to take an
    object rather than a block and instead add this method. Rest assured the
    decision was careful. In the end has() seemed the choice that resulted in
    the clearest code.

    `has` was chosen over *contains* or *includes* because it is short and
    clear.
    */
    func has() -> @escaping (_ o: Any?) -> Bool {
        return { o in
            if let o = o as? AnyHashable {
                return self.contains(o)
            }
            return false
        }
    }
}