//  Converted to Swift 5 by Swiftify v5.0.31539 - https://objectivec2swift.com/
import Foundation
import YOLOKit

/**
 Copyright (c) 2012 EBF-EDV Beratung Föllmer GmbH
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
**/

/**
 Refs:
 http://clang.llvm.org/docs/Block-ABI-Apple.txt
 https://github.com/pandamonia/A2DynamicDelegate
**/

var: Void? // initialized to &_NSConcreteStackBlock or &_NSConcreteGlobalBlock
var: int flags?
var: int reserved?
var invoke: ((UnsafeMutableRawPointer?, ) -> Void)?
struct block_descriptor {
    var reserved: unsigned long int // NULL
    var size: unsigned long int // sizeof(struct Block_literal_1)
    // optional helper functions
    var copy_helper: ((_ dst: UnsafeMutableRawPointer?, _ src: UnsafeMutableRawPointer?) -> Void)? // IFF (1<<25)
    var dispose_helper: ((_ src: UnsafeMutableRawPointer?) -> Void)? // IFF (1<<25)
    // required ABI.2010.3.16
    let signature: [Int8] // IFF (1<<30)
}

var descriptor: block_descriptor?
enum CTBlockDescriptionFlags : Int {
    static let hasCopyDispose: CTBlockDescriptionFlags = (1 << 25)
    static let hasCtor: CTBlockDescriptionFlags = (1 << 26) // helpers have C++ code
    static let isGlobal: CTBlockDescriptionFlags = (1 << 28)
    static let hasStret: CTBlockDescriptionFlags = (1 << 29) // IFF BLOCK_HAS_SIGNATURE
    static let hasSignature: CTBlockDescriptionFlags = (1 << 30)
}

func (id(block) -> NSMethodSignature? {
    let blockRef = block as? CTBlockLiteral
    let flags = blockRef?.flags

    if flags.rawValue & CTBlockDescriptionFlags.hasSignature.rawValue != 0 {
        var signatureLocation = blockRef?.descriptor
        signatureLocation += 
        signatureLocation += 
        as? unsigned long int

        if flags.rawValue & CTBlockDescriptionFlags.hasCopyDispose.rawValue != 0 {
            signatureLocation += 
            signatureLocation +=
        }

        let signature = Int8(signatureLocation ?? 0)
        return NSMethodSignature(objCTypes: signature)
    }
    return nil
}

func YOLOArgCount(block: Any?) -> Int {
    return YOLOMS(block).numberOfArguments
}