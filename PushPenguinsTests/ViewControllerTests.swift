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
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //controller = storyboard.instantiateInitialViewController() as! ViewController
    }
    
    override func tearDown() {
        controller = nil
        super.tearDown()
    }
}
