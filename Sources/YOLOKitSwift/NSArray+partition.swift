//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Partitions the receiver into two arrays based on the boolean return
     value of the given block.

        id rv = @[@"A", @"B", @"AA"].partition(^(id s){
            return [s hasPrefix:@"A"];
        });
        //rv => @[@[@"A", @"AA"], @[@"B"]]
    */
    func partition() -> @escaping (_ o: Any?) -> [Any] {
        return { block in
            let aa = []
            let bb = []
            for o in self {
                block(o) ? aa : bb.append(o)
            }
            return [aa, bb]
        }
    }
}