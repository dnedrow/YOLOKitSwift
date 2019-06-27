//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Assumes that the receiver is an array of arrays and transposes the rows
     and columns.

        id rv = @[@[@1, @2, @3], @[@4, @5, @6]].transpose;
        // rv => @[@[@1, @4], @[@2, @5], @[@3, @6]]

     PROTIP: `transpose` is surprisingly useful, if you think laterally about
     your problem.
    */
    func transpose() -> [Any]? {
        if count == 0 {
            return self as [Any]
        }

        let arrays = select()({ o in
                return o is [Any]
            })
        let max = (arrays.max()({ o in
                return o?.count() ?? 0
            })).count()

        var rv = []
        for x in 0..<max {
            rv.append([AnyHashable]())
        }

        arrays.each()({ array in
            array?.each()({ o, ii in
                if let o = o {
                    rv[ii].append(o)
                }
            })
        })
        return rv
    }
}