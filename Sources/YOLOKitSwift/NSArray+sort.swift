//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Returns the receiver, sorted.

        id rv = @[@2, @1, @3, @5, @4].sort;
        // rv => @[@1, @2, @3, @4, @5]

     We even try to handle mixed object types:

        id rv = @[@"20", @"1", @3, @5, @"4"].sort;
        // rv => @[@"1", @3, @"4", @5, @"20"]

     @see -sortBy

     PROTIP: Internally `sort` attempts to sort all objects using `-compare:`
     but if that fails, it calls `-description` on all objects and uses
     `-sortBy`.
    */
    func sort() -> [Any]? {
        // TODO: import SwiftTryCatch from https://github.com/eggheadgames/SwiftTryCatch
        SwiftTryCatch.try({
            if all()({ o in
                return o is String
            }) != nil {
                return (self as NSArray).sortedArray(comparator: { obj1, obj2 in
                    return obj1?.compare(obj2 as? String ?? "", options: [.caseInsensitive, .numeric], range: nil, locale: .current)
                })
            } else {
                return (self as NSArray).sortedArray(using: #selector(NSArray.compare(_:)))
            }
        }, catch: { e in
        }, finallyBlock: {
        })

        return sortBy()("description")
    }

    /**
     Sorts all objects using the return value of the given block as the
     sorting criteria.

        MKShape *rhombas = [MKShape new]; rhombas.title = @"rhombas";
        MKShape *ellipse = [MKShape new]; ellipse.title = @"ellipse";
        MKShape *hexagon = [MKShape new]; hexagon.title = @"hexagon";

        id rv = @[rhombas, ellipse, hexagon].sortBy(^(id shape){
            return [shape title];
        });
        // rv => @[ellipse, hexagon, rhombas]

        id rv = @[rhombas, ellipse, hexagon].sortBy(@"title")
        // rv => @[ellipse, hexagon, rhombas]

        id rv = @[
            @{@"name": @"frank", @"age": @32},
            @{@"name": @"frank", @"age": @31},
            @{@"name": @"bob", @"age": @54},
            @{@"name": @"zane", @"age": @1},
            @{@"name": @"frank", @"age": @12}
        ].sortBy(^(id o){
            return @[o[@"name"], o[@"age"]];
        });
        // rv => @[
        //     @{@"name": @"bob", @"age": @54},
        //     @{@"name": @"frank", @"age": @12},
        //     @{@"name": @"frank", @"age": @31},
        //     @{@"name": @"frank", @"age": @32},
        //     @{@"name": @"zane", @"age": @1}
        // ];

     PROTIP: You will need you to implement a compare: method for any custom
     objects you return.

     PROTIP: Returning an array from your block will sort the receiver so
     that the first object is the first sorting criteria, and the second
     object is the second sorting criteria, et cetera.
    */
    func sortBy() -> @escaping (Any?) -> [Any] {
        // TODO pass an array to sort by multiple selectors (use multiple sort descriptors)

        return { blockOrKey in
            if (blockOrKey is String) {
                blockOrKey = { o in
                    return o?.value(forKeyPath: blockOrKey as? String ?? "") as? @escaping (Any?) -> [Any] ?? { _ in return [] }
                }
            }

        func foo(_ TYPE: Any) {
        let block: ((Any?) -> TYPE)? = blockOrKey
        return sortedArray(comparator: { obj1, obj2 in
        let a = block?(obj1)
        let b = block?(obj2)
        return ((a - b) as? ComparisonResult)!
        })
        }

            let rt = YOLOMS(blockOrKey).methodReturnType[0]
            switch rt {
                case "i", "l", "c", "s":
                    foo(Int)
                case "q":
                    foo(longlong)
                case "I", "L", "C", "S":
                    foo(unsignedlong)
                case "Q":
                    foo(unsignedlonglong)
                case "f", "d":
                    foo(Double)
                case "@":
                    let block: ((Any?) -> Any?)? = blockOrKey as? ((Any?) -> Any?)
                    return (self as NSArray).sortedArray(comparator: { obj1, obj2 in
                        obj1 = block?(obj1)
                        obj2 = block?(obj2)
                        if (obj1 is String) && (obj2 is String) {
                            return (obj1?.compare(obj2 as? String ?? "", options: [.caseInsensitive, .numeric], range: nil, locale: .current))!
                        } else {
                            return (obj1?.compare(obj2))!
                        }
                    })
                default:
                    throw "Cannot handle sortBy block return type. Please fork and fix!"
                    return nil
            }
        }
    }

    @objc func compare(_ array: [Any]?) -> ComparisonResult {
        var array = array
        if !(array is [Any]) {
            array = [array].compactMap { $0 }
        }

        for o in [self, array].transpose() ?? [] {
            guard let o = o as? [Any] else {
                continue
            }
            if o.count == 2 {
                let result = o[0].compare(o[1])
                if result != .orderedSame {
                    return result
                }
            }
        }
        return .orderedSame
    }
}