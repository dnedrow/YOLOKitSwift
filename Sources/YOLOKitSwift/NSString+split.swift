//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation

extension String {
    /**
     Returns a new array of the strings in the receiver that are separated by
     the given separator.

        id rv = @"1,2,3,4,5,6".split(@",");
        // rv => @[@"1", @"2", @"3", @"4", @"5", @"6"]

     If you ask to separate by `@""` or `nil` you will get an array of the
     strings individual characters (as determined by `-substringWithRange`).

        id rv = @"123456".split(@"");
        // rv => @[@"1", @"2", @"3", @"4", @"5", @"6"]
    */
    func split() -> @escaping (String?) -> [Any] {
        return { separator in
            separator = separator?.description
            if (separator?.count ?? 0) == 0 {
                let N = self.count
                let chars = [Any?](repeating: nil, count: N)
                for x in 0..<N {
                    chars[x] = (self as NSString).substring(with: NSRange(location: x, length: 1))
                }
                return chars[..<N]
            } else {
                return self.components(separatedBy: separator ?? "")
            }
        }
    }
}