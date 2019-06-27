//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Invokes the given block once for each element of self. Creates a new
     array containing the values returned by the block.

        id rv = @[@1, @2, @3, @4].fmap(^(NSNumber *n){
            return @(n.intValue * n.intValue);
        });
        // rv => @[@1, @4, @9, @16]

     If the given block returns nil, that element is skipped in the returned
     array.

     The given block can have up to three parameters, the first is an element
     in the array, the second that element’s index, and the third the array
     itself.

     The second parameter can be a primitive (eg. `int`), or an `NSNumber *`:

         @"YOLO".split(@"").fmap(^(NSString *letter, int index){
             //…
         });

     @see -map
    */
    func fmap() -> @escaping (Any?) -> [Any] {
        return map()
    }
}