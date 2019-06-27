//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Convert an array of key/value pairs into the logical dictionary.

        id rv = @[@[@1, @2], @[@3, @4]].dict
        // rv => @{@1: @2, @3: @4}

        id rv = @[@1, @2, @3, @4].chunk(2).dict
        // rv => @{@1: @2, @3: @4}

     If you have a flat array you can call `chunk(2)` before `dict`. It was
     decided not to allow flat arrays to be immediately converted as it can
     lead to bugs when your array is not in the shape you expect, and those
     sorts of errors occur more commonly with tools like YOLOKit since we
     allow easy array flattening.
    */
    func dict() -> [AnyHashable : Any]? {
        let aa = transpose()
        if (aa?.count ?? 0) <= 1 {
            return [:]
        }
        if let aa = aa?[1] as? [Any], let aa1 = aa?[0] as? [NSCopying] {
            return [AnyHashable : Any](objects: aa, forKeys: aa1)
        }
        return nil
    }
}