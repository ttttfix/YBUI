//
//  StringExtensionTests.swift
//  YBUITests
//
//  Created by yang bin on 2019/11/28.
//  Copyright © 2019 ttttfix. All rights reserved.
//

import XCTest

class StringExtensionTests: XCTestCase {

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

    
    func testTrimTopBottomSpace() {
        XCTAssertTrue(" test ".trimTopBottomSpace == "test")
    }


    func testTrimAllSpace() {
        XCTAssertTrue(" test \n  test".trimAllSpace == "testtest")
    }

    func testTrimLinerBreakCharacter() {
        XCTAssertTrue("test\ntest".trimLinerBreakCharacter == "test test")
    }

    func testMD5() {
        XCTAssertEqual("123456".md5, "e10adc3949ba59abbe56e057f20f883e")
    }

    func testEncodingUserInputQuery() {
        let str = "&#=test".encodingUserInputQuery
        XCTAssertNotNil(str)
        XCTAssertEqual(str!, "%26%23%3Dtest")
    }

    func testCapitalizedString() {
        let str = "testStringExtension".capitalizedString
        XCTAssertNotNil(str)
        XCTAssertEqual(str!, "TestStringExtension")
    }

    //FIXME:- 此方法暂时有问题
//    func testRemoveMagicalChar() {
//
//
////        let str = "̚St̸ring".removeMagicalChar
////        XCTAssertNotNil(str)
////
////
////        XCTAssertEqual(str, "String")
//    }




}
