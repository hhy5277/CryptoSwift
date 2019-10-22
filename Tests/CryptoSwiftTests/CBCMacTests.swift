////  CryptoSwift
//
//  Copyright (C) 2014-__YEAR__ Marcin Krzyżanowski <marcin@krzyzanowskim.com>
//  This software is provided 'as-is', without any express or implied warranty.
//
//  In no event will the authors be held liable for any damages arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:
//
//  - The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation is required.
//  - Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
//  - This notice may not be removed or altered from any source or binary distribution.
//

import XCTest
@testable import CryptoSwift

class CBCMacTests: XCTestCase {
  func testMessageLength0() {
    let key: Array<UInt8> = [0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c]
    let msg: Array<UInt8> = []
    let expectedMac: Array<UInt8> = [0xf6, 0xc7, 0x1e, 0xed, 0xc3, 0xd9, 0x9b, 0xb1, 0x83, 0xcb, 0x5b, 0x8d, 0x15, 0x68, 0xe6, 0x06]

    let cbcmac = try! CBCMAC(key: key).authenticate(msg)
    XCTAssertEqual(cbcmac, expectedMac, "Invalid authentication result")
  }

  func testMessageLength16() {
    let key: Array<UInt8> = [0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c]
    let msg: Array<UInt8> = [0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a]
    let expectedMac: Array<UInt8> = [0x05, 0x39, 0xbd, 0xa3, 0x0b, 0x3f, 0x76, 0x34, 0x46, 0x6a, 0x75, 0xd9, 0x84, 0x18, 0xbf, 0x65]

    let cbcmac = try! CBCMAC(key: key).authenticate(msg)
    XCTAssertEqual(cbcmac, expectedMac, "Invalid authentication result")
  }

  func testMessageLength40() {
    let key: Array<UInt8> = [0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c]
    let msg: Array<UInt8> = [0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a, 0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c, 0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51, 0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11]
    let expectedMac: Array<UInt8> = [0xa5, 0x26, 0x0f, 0x98, 0xf1, 0xab, 0xf2, 0xb2, 0x75, 0x62, 0xed, 0x5f, 0xc1, 0xfb, 0xeb, 0x8d]

    let cbcmac = try! CBCMAC(key: key).authenticate(msg)
    XCTAssertEqual(cbcmac, expectedMac, "Invalid authentication result")
  }

  func testMessageLength64() {
    let key: Array<UInt8> = [0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c]
    let msg: Array<UInt8> = [0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a, 0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c, 0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51, 0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11, 0xe5, 0xfb, 0xc1, 0x19, 0x1a, 0x0a, 0x52, 0xef, 0xf6, 0x9f, 0x24, 0x45, 0xdf, 0x4f, 0x9b, 0x17, 0xad, 0x2b, 0x41, 0x7b, 0xe6, 0x6c, 0x37, 0x10]
    let expectedMac: Array<UInt8> = [0x5b, 0xf8, 0x2f, 0x1f, 0xe7, 0x48, 0x3b, 0x9a, 0x87, 0x5c, 0xaf, 0x3d, 0xed, 0x3a, 0x01, 0x71]

    let cbcmac = try! CBCMAC(key: key).authenticate(msg)
    XCTAssertEqual(cbcmac, expectedMac, "Invalid authentication result")
  }

  static let allTests = [
    ("testMessageLength0", testMessageLength0),
    ("testMessageLength16", testMessageLength16),
    ("testMessageLength40", testMessageLength40),
    ("testMessageLength64", testMessageLength64)
  ]
}
