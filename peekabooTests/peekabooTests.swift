//
//  peekabooTests.swift
//  peekabooTests
//
//  Created by 日野森寛也 on 2021/06/04.
//

import XCTest
@testable import peekaboo

class peekabooTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testScecrets() {
        XCTAssertNotNil(Secret.id)
        XCTAssertNotNil(Secret.key)
    }

}
