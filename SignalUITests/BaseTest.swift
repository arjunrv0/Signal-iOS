//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import Foundation
import XCTest

class BaseTest: XCTestCase {
    
    let signalApp = XCUIApplication(bundleIdentifier: "org.whispersystems.signal")
    let basePage = BasePage()
    let testCase = XCTestCase()
    
    private var splashContinueButton: XCUIElement!
    private var onboardingContactPermission: XCUIElement!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        signalApp.launch()
        
        splashContinueButton = signalApp.buttons.element(matching: .button, identifier: "onboarding.splash.continueButton.button")
        sleep(2)
        if splashContinueButton.exists {
            splashContinueButton.tap()
        }
        sleep(3)
        onboardingContactPermission = signalApp.buttons.element(matching: .button, identifier: "onboarding.permissions.giveAccessButton.button")
        if onboardingContactPermission.exists {
            onboardingContactPermission.tap()
        }
        
        sleep(5)
        
        addUIInterruptionMonitor(withDescription: "Handle system alert") { (alert) -> Bool in
            if alert.buttons["OK"].exists {
                alert.buttons["OK"].tap()
                return true
            }
            if alert.buttons["Allow"].exists {
                alert.buttons["Allow"].tap()
                return true
            }
            return false
        }
        signalApp.tap()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}
