//
//  ContentViewTests.swift
//  peekabooTests
//
//  Created by 日野森寛也 on 2021/06/06.
//

import XCTest
import SwiftUI
@testable import peekaboo
import SnapshotTesting

class ContentViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_スナップショットテスト() throws {
        let view = ContentView()
        SnapshotConfig.DeviceName.allCases.forEach { deviceName in
            assertSnapshot(
                matching: view,
                as: .image(
                    precision: SnapshotConfig.precision,
                    layout: .device(config: deviceName.viewImageConfig),
                    traits: .init(userInterfaceStyle: .light)
                ),
                named: deviceName.rawValue
            )
        }
    }

}
