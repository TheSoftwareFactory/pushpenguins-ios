//
//  PushPenguinsUITests.swift
//  PushPenguinsUITests
//
// Created by Software Factory 27/04/2017
// Copyright © 2017 HSL. All rights reserved.
//

import XCTest

class PushPenguinsUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLeftBallPlayer1Win() {
        let app = XCUIApplication()
        let width = app.windows.element(boundBy: 0).frame.size.width
        let height =  app.windows.element(boundBy: 0).frame.size.height
        XCTAssertFalse(app.staticTexts["Player 1 won!"].exists)
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        
        
        for _ in 0...4 { //simulate multiple touches on different locations on the same region
            var xTouch = arc4random_uniform(UInt32(width / 3.0))
            if CGFloat(xTouch) == width / 3.0 {
                xTouch -= UInt32(1.0)
            }
            var yTouch = arc4random_uniform(UInt32(height / 2.0)) + UInt32(height / 2.0)
            if CGFloat(yTouch) == height / 2.0 {
                yTouch += UInt32(1.0)
            }
            let coordinate = normalized.withOffset(CGVector(dx: CGFloat(xTouch), dy: CGFloat(yTouch)))
            coordinate.tap()
        }
        
        XCTAssertTrue(app.staticTexts["Player 1 won!"].exists)
        app.staticTexts["Player 1 won!"].tap()
        XCTAssertFalse(app.staticTexts["Player 1 won!"].exists)
    }
    
    func testCenterBallPlayer1Win(){
        let app = XCUIApplication()
        let width = app.windows.element(boundBy: 0).frame.size.width
        let height =  app.windows.element(boundBy: 0).frame.size.height
        XCTAssertFalse(app.staticTexts["Player 1 won!"].exists)
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        
        for _ in 0...4 { //simulate multiple touches on different locations on the same region
            var xTouch = arc4random_uniform(UInt32(width / 3.0)) + UInt32(width * CGFloat(1.0/3.0))
            if CGFloat(xTouch) == width * 2.0 / 3.0 {
                xTouch -= UInt32(1.0)
            }
            var yTouch = arc4random_uniform(UInt32(height / 2.0)) + UInt32(height / 2.0)
            if CGFloat(yTouch) == height / 2.0 {
                yTouch += UInt32(1.0)
            }
            let coordinate = normalized.withOffset(CGVector(dx: CGFloat(xTouch), dy: CGFloat(yTouch)))
            coordinate.tap()
        }
        
        XCTAssertTrue(app.staticTexts["Player 1 won!"].exists)
        app.staticTexts["Player 1 won!"].tap()
        XCTAssertFalse(app.staticTexts["Player 1 won!"].exists)
    }
    
    func testRightBallPlayer1Win(){
        let app = XCUIApplication()
        let width = app.windows.element(boundBy: 0).frame.size.width
        let height =  app.windows.element(boundBy: 0).frame.size.height
        XCTAssertFalse(app.staticTexts["Player 1 won!"].exists)
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        
        for _ in 0...4 { //simulate multiple touches on different locations on the same region
            let xTouch = arc4random_uniform(UInt32(width / 3.0)) +  UInt32(width * CGFloat(2.0/3.0))
            var yTouch = arc4random_uniform(UInt32(height / 2.0)) + UInt32(height / 2.0)
            if CGFloat(yTouch) == height / 2.0 {
                yTouch += UInt32(1.0)
            }
            let coordinate = normalized.withOffset(CGVector(dx: CGFloat(xTouch), dy: CGFloat(yTouch)))
            coordinate.tap()
        }
        
        XCTAssertTrue(app.staticTexts["Player 1 won!"].exists)
        app.staticTexts["Player 1 won!"].tap()
        XCTAssertFalse(app.staticTexts["Player 1 won!"].exists)
    }
    
    func testLeftBallPlayer2Win(){
        let app = XCUIApplication()
        let width = app.windows.element(boundBy: 0).frame.size.width
        let height =  app.windows.element(boundBy: 0).frame.size.height
        XCTAssertFalse(app.staticTexts["Player 2 won!"].exists)
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        
        for _ in 0...4 { //simulate multiple touches on different locations on the same region
            var xTouch = arc4random_uniform(UInt32(width / 3.0))
            if CGFloat(xTouch) == width / 3.0 {
                xTouch -= UInt32(1.0)
            }
            let yTouch = arc4random_uniform(UInt32(height / 2.0))
            let coordinate = normalized.withOffset(CGVector(dx: CGFloat(xTouch), dy: CGFloat(yTouch)))
            coordinate.tap()
        }
        
        XCTAssertTrue(app.staticTexts["Player 2 won!"].exists)
        app.staticTexts["Player 2 won!"].tap()
        XCTAssertFalse(app.staticTexts["Player 2 won!"].exists)
    }
    
    func testCenterBallPlayer2Win(){
        let app = XCUIApplication()
        let width = app.windows.element(boundBy: 0).frame.size.width
        let height =  app.windows.element(boundBy: 0).frame.size.height
        XCTAssertFalse(app.staticTexts["Player 2 won!"].exists)
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        
        for _ in 0...4 { //simulate multiple touches on different locations on the same region
            var xTouch = arc4random_uniform(UInt32(width / 3.0)) + UInt32(width * CGFloat(1.0/3.0))
            if CGFloat(xTouch) == width * 2.0 / 3.0 {
                xTouch -= UInt32(1.0)
            }
            let yTouch = arc4random_uniform(UInt32(height / 2.0))
            let coordinate = normalized.withOffset(CGVector(dx: CGFloat(xTouch), dy: CGFloat(yTouch)))
            coordinate.tap()
        }
        
        XCTAssertTrue(app.staticTexts["Player 2 won!"].exists)
        app.staticTexts["Player 2 won!"].tap()
        XCTAssertFalse(app.staticTexts["Player 2 won!"].exists)
    }
    
    func testRightBallPlayer2Win(){
        let app = XCUIApplication()
        let width = app.windows.element(boundBy: 0).frame.size.width
        let height =  app.windows.element(boundBy: 0).frame.size.height
        XCTAssertFalse(app.staticTexts["Player 2 won!"].exists)
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        
        for _ in 0...4 { //simulate multiple touches on different locations on the same region
            let xTouch = arc4random_uniform(UInt32(width / 3.0)) + UInt32(width * CGFloat(2.0/3.0))
            let yTouch = arc4random_uniform(UInt32(height / 2.0))
            let coordinate = normalized.withOffset(CGVector(dx: CGFloat(xTouch), dy: CGFloat(yTouch)))
            coordinate.tap()
        }
        
        XCTAssertTrue(app.staticTexts["Player 2 won!"].exists)
        app.staticTexts["Player 2 won!"].tap()
        XCTAssertFalse(app.staticTexts["Player 2 won!"].exists)
    }
}
