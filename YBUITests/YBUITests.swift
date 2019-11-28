//
//  YBUITests.swift
//  YBUITests
//
//  Created by yang bin on 2019/11/28.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import XCTest
@testable import YBUI


class YBUITests: XCTestCase {

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
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testRegex() {
        
    }


    func testRegexTools() {
        XCTAssertTrue(RegexTools.regex(email: "ttttfix@gmail.com"))
        XCTAssertTrue(RegexTools.regex(email: "ttttfix@163.com"))
        XCTAssertFalse(RegexTools.regex(email: "ttttfix.gmail.com"))
        XCTAssertFalse(RegexTools.regex(email: "ttttfix.gmailcom"))
    }



}
