//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Calls the given block once for each element in the receiver, passing
     that element as the parameter.

        @[@1, @2, @3, @4].each(^(id n){
            NSLog(@"%@", n);
        });
        // => 1\n2\n3\n4\n

     `each` also supports two and three parameter versions:

        @[@4, @3, @2, @1].each(^(id n, int ii){
            NSLog(@"%d:%@", ii, n);
        });
        // => 0:1\n1:2\n2:3\n3:4\n

        @[@4, @3, @2, @1].each(^(id n, int ii, NSArray *array){
            //…
        });

        @[@4, @3, @2, @1].each(^(id n, NSNumber *index, NSArray *array){
            // and automagical conversion between int and NSNumber
        });
    */
    func each() -> @escaping (Any?) -> [Any] {
        return { frock in
            let sig = YOLOMS(frock)
            let block: ((Any?, Int) -> Void)? = {
                    switch sig.numberOfArguments {
                        case 2:
                            return { a, b in
                                (frock)(a)
                            }
                        case 3:
                            return Character(sig.getArgumentType(atIndex: 2)[0]) == "@" ? { a, b in
                                (frock)(a, NSNumber(value: b))
                            } : { a, b in
                                (frock)(a, b)
                            } as? @escaping (Any?) -> [Any] ?? { _ in return [] }
                        case 4:
                            return Character(sig.getArgumentType(atIndex: 2)[0]) == "@" ? { a, b in
                                (frock)(a, NSNumber(value: b), self)
                            } : { a, b in
                                (frock)(a, b, self)
                            } as? @escaping (Any?) -> [Any] ?? { _ in return [] }
                        default:
                            throw "Invalid argument count to each"
                    }
                }()

            let ii = 0
            for obj in self {
                block?(obj, ii)
                ii += 1
            }
            return self
        }
    }
}