//
//  twittegorizeTests.swift
//  twittegorizeTests
//
//  Created by 原口公輔 on 2019/10/15.
//  Copyright © 2019 Kosuke haraguchi. All rights reserved.
//

import XCTest
@testable import twittegorize

class twittegorizeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // additional tests
    func testTestSample() {
        let testSample = TestSample()
        let result = testSample.add(a: 2, b: 3)
        XCTAssertEqual(result, 5)
    }
}
