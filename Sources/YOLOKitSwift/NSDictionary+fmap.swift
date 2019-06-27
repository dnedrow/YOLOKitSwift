//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [AnyHashable : Any] {
    /**
     Invokes the given block once for each key, value pair in the receiver.
     Returns a dictionary containing the values returned by the block.

        id rv = @{@1: @2, @2: @4, @3: @9}.fmap(^(id obj){
            return @([obj intValue] * 2);
        });
        // rv = @{@1: @4, @2: @8, @3: @18}

     If the given block returns nil, that element is skipped in the returned
     dictionary.

     The given block can have up to three parameters, the first is an element
     in the dictionary, the second that element’s key, and the third the dictionary
     itself.

     @see -map
    */
    func fmap() -> @escaping (Any?) -> [AnyHashable : Any] {
        return { frock in
            let sig = YOLOMS(frock)
            let block: ((Any?, Any?) -> Any?)? = {
                    switch sig.numberOfArguments {
                        case 2:
                            return { v, k in
                                return (frock)(v)
                            }
                        case 3:
                            return { v, k in
                                return (frock)(v, k)
                            }
                        case 4:
                            return { v, k in
                                return (frock)(v, k, self)
                            }
                        default:
                            throw "Invalid argument count to fmap"
                    }
                }()

            let keys = [Any?](repeating: nil, count: self.count)
            let objs = [Any?](repeating: nil, count: self.count)
            let ii = 0
            for key in self {
                let o = block?(self[key], key)
                //if o
                keys[ii] = key
                objs[ii] = o
                ii += 1
            }
            return [AnyHashable : Any](objects: objs, forKeys: keys, count: ii) as Dictionary
        }
    }
}