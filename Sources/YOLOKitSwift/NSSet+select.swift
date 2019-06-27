//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation
import ObjectiveC

extension Set<AnyHashable> {
    /**
     Returns a new array containing all elements for which the given block
     returns `YES`.

        id rv = @[@1, @2, @3, @4].select(^(NSNumber *n){
            return n.intValue % 2 == 0;
        });
        // rv => @[@2, @4]

     Alternatively pass a `Class` object:

        id rv = @[@1, @"1", @{}].select(NSString.class)
        // rv => @[@"1"]

     Convenient when searching for specifc subviews.

        self.view.subviews.select(UITextField.class);

     Though you may need an `allSubviews` pod.

     @see -reject
    */
    func select() -> @escaping (Any?) -> Set<AnyHashable> {
        return { input in
            YOLOSelectReject(!!)
        }
    }

    /**
     Returns a new array containing all elements for which the given block
     returns `NO`.

        id rv = @[@1, @2, @3, @4].reject(^(NSNumber *n){
            return n.intValue % 2 == 0;
        });
        // rv => @[@1, @3]

     Alternatively pass a `Class` object:

        id rv = @[@1, @"1", @{}].reject(NSNumber.class)
        // rv => @[@"1", @{}]

     @see -select
    */
    func reject() -> @escaping (Any?) -> Set<AnyHashable> {
        return { input in
            YOLOSelectReject(!)
        }
    }

    // The blockToUse variable is necessary or: EXC_BAD_ACCESS

//#define YOLOSelectReject(logic) if (!input) return [NSSet set];
//BOOL (^blockToUse)();
//if (YOLOIsClass(input)) {
//blockToUse = ^(id o){
//return [o isKindOfClass:input];
//};
//} else
//blockToUse = input;
//id selected[self.count];
//int ii = 0;
//for (id o in self)
//if (logic blockToUse(o))
//selected[ii++] = o;
//return [NSSet setWithObjects:selected count:ii]
}