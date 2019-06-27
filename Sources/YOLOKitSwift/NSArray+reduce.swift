//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension [Any] {
    /**
     Reduces the receiver to a single value.

     The usual example of reduce is to sum all values in an array.

        id rv = @[@1, @2, @3, @4].reduce(^(NSNumber *memo, NSNumber *obj){
            return @(memo.intValue + obj.intValue);
        });
        // rv => @10

     Generally `-inject` is more useful. Though, when appropriate, `reduce`
     is more elegant.

        // find the longest word
        id longest = @[@"cat", @"sheep", @"bear"].reduce(^(NSString *memo, NSString *word){
            return memo.length > word.length ? memo : word;
        });
        // longest => @"sheep"

     @param memo initialized to the first value in receiver, but on subsequent iterations is the value returned from the given block.
     @param obj the value for each element in the receiver, though never the first object.

     @see -inject
    */
    func reduce() -> @escaping (_ : Any?) -> Any? {
        return { block in
            var memo = self.first
            for obj in self.last()(self.count - 1) {
                memo = block?(memo, obj)
            }
            return memo as? @escaping (_ : Any?) -> Any ?? { _ in return  }
        }
    }
}