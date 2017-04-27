//
//  ViewControllerTests.swift
//  PushPenguins
//
//  Created by Ramon Goncalves da Silva on 4/12/17.
//  Copyright © 2017 HSL. All rights reserved.
//

import XCTest
@testable import PushPenguins

class ViewControllerTests: XCTestCase {
    
    var controller: ViewController!
    
    override func setUp() {
        super.setUp()
        controller = ViewController()
    }
    
    func testMovement(){
            controller.leftBall.
    }
    
    func testControllerHasExpectedPenguinsCount(){
       
        XCTAssertTrue(controller.restartGame == false)
        
        XCTAssertTrue(controller.currBall.image == UIImage(named: "penguinIcon"))
    }
}
