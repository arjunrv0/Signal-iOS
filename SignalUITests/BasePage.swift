//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import Foundation
import XCTest

class BasePage {
    
    let signalApp = XCUIApplication(bundleIdentifier: "org.whispersystems.signal")
    let testCase = XCTestCase()
    
    public func takeScreenShot() {
        _ = XCUIScreen.main.screenshot()
    }
    
    @discardableResult
    public func waitForButton(element: XCUIElement) -> XCTestExpectation {
        let predicate = NSPredicate(format: "exists == 1")
        let myExpectation = testCase.expectation(for: predicate, evaluatedWith: element, handler: nil)
        testCase.waitForExpectations(timeout: 3, handler: nil)
        return myExpectation
    }
    
}
