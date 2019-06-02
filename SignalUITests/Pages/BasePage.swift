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
    
    //MARK: Since clear text field is not working as expected. As a workaround random string is generated and inserted into textfield for profile name update test case
    @discardableResult
    public func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    @discardableResult
    public func waitForButton(element: XCUIElement) -> XCTestExpectation {
        let predicate = NSPredicate(format: "exists == 1")
        let myExpectation = testCase.expectation(for: predicate, evaluatedWith: element, handler: nil)
        testCase.waitForExpectations(timeout: 3, handler: nil)
        return myExpectation
    }
    
}
