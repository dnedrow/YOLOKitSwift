//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension Set<AnyHashable> {
    /**
     Invokes the given block once for each element of self. Creates a new
     array containing the values returned by the block.

        id rv = @[@1, @2, @3, @4].map(^(NSNumber *n){
            return @(n.intValue * n.intValue);
        });
        // rv => @[@1, @4, @9, @16]

     If the given block returns nil, that element is skipped in the returned
     array.

     The given block can have up to three parameters, the first is an element
     in the array, the second that element’s index, and the third the array
     itself.

     The second parameter can be a primitive (eg. `int`), or an `NSNumber *`:

        @"YOLO".split(@"").map(^(NSString *letter, int index){
            //…
        });
    */
    func map() -> @escaping (Any?) -> Set<AnyHashable> {
        return { frock in
            let sig = YOLOMS(frock)
            let block: ((Any?, Int) -> Any?)? = {
                    switch sig.numberOfArguments {
                        case 2:
                            return { a, b in
                                return (frock)(a)
                            }
                        case 3:
                            return Character(sig.getArgumentType(atIndex: 2)[0]) == "@" ? { a, b in
                                return (frock)(a, NSNumber(value: b))
                            } : { a, b in
                                return (frock)(a, b)
                            }
                        case 4:
                            return Character(sig.getArgumentType(atIndex: 2)[0]) == "@" ? { a, b in
                                return (frock)(a, NSNumber(value: b), self)
                            } : { a, b in
                                return (frock)(a, b, self)
                            }
                        default:
                            throw "Invalid argument count to map"
                    }
                }()

            let mapped = [Any?](repeating: nil, count: self.count)
            let ii = 0
            let jj = 0
            for mappable in self {
                let o = block?(mappable, ii)
                //if o
                mapped[jj] = o
                jj += 1
            }
            ii += 1
            return Set<AnyHashable>([mapped])
        }
    }
}