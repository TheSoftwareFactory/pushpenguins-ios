//
//  PushPenguinsUITests.swift
//  PushPenguinsUITests
//
<<<<<<< HEAD
//  Created by Ramon Goncalves da Silva on 4/27/17.
=======
//  Created by riena on 26/04/2017.
>>>>>>> 1f9cd2d147ed18e72c3ba387d6e8d45890af5826
//  Copyright © 2017 HSL. All rights reserved.
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

    func testPenguinMove() {
        let penguin = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
        penguin.tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
