//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension Set<AnyHashable> {
    /**
     Invokes the given block for each element in the receiver. Should the
     block return `NO`, the method immediately returns `NO`, ceasing
     enumeration. If all executions of the block return `YES`, `all`
     returns `YES`.

        BOOL rv = @[@1, @2, @3].all(^(id o){
            return [o intValue] > 0;
        });
        // rv => YES

        BOOL rv = @[@1, @2, @3].all(^(int d){
            return d < 3;
        });
        // rv => NO

     Instead of a block, you can pass a `Class` object.

        BOOL rv = @[@1, @2, @3].all(NSNumber.class);
        // rv => YES
    */
    func all() -> @escaping (_ o: Any?) -> Bool {
        return { arg in
            var block: ((_ o: Any?) -> Bool)? = nil

            if (arg as? String) == NSString.class /*or segfaults!*/ || YOLOIsClass(arg) {
                let cls = arg
                block = { o in
                    return o is cls
                }
            } else {
                switch YOLOMS(arg).getArgumentType(atIndex: 1)[0] {
                    case "c":
                        block = { o in
                            return (arg)((o as? NSNumber)?.int8Value ?? 0)
                        }
                    case "i":
                        block = { o in
                            return (arg)((o as? NSNumber)?.intValue ?? 0)
                        }
                    case "s":
                        block = { o in
                            return (arg)((o as? NSNumber)?.int16Value ?? 0)
                        }
                    case "l":
                        block = { o in
                            return (arg)((o as? NSNumber)?.intValue ?? 0)
                        }
                    case "q":
                        block = { o in
                            return (arg)((o as? NSNumber)?.int64Value ?? 0)
                        }
                    case "C":
                        block = { o in
                            return (arg)((o as? NSNumber)?.uint8Value ?? 0)
                        }
                    case "I":
                        block = { o in
                            return (arg)((o as? NSNumber)?.uint32Value ?? 0)
                        }
                    case "S":
                        block = { o in
                            return (arg)((o as? NSNumber)?.uint16Value ?? 0)
                        }
                    case "L":
                        block = { o in
                            return (arg)((o as? NSNumber)?.uintValue ?? 0)
                        }
                    case "Q":
                        block = { o in
                            return (arg)((o as? NSNumber)?.uint64Value ?? 0)
                        }
                    case "f":
                        block = { o in
                            return (arg)((o as? NSNumber)?.floatValue ?? 0.0)
                        }
                    case "d":
                        block = { o in
                            return (arg)((o as? NSNumber)?.doubleValue ?? 0.0)
                        }
                    case "B":
                        block = { o in
                            return (arg)((o as? NSNumber)?.boolValue ?? false)
                        }
                    default:
                        block = arg as? ((_ o: Any?) -> Bool)
                }
            }

            for o in self {
                if !block?(o) {
                    return false
                }
            }
            return true
        }
    }
}