//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import Foundation
import XCTest

class ThemePage: BasePage {
    
    private var homeSettingsButton: XCUIElement!
    private var changeThemeButton: XCUIElement!
    
    @discardableResult
    override init() {
        super.init()
        
        homeSettingsButton = signalApp.buttons.element(matching: .button, identifier: "HomeViewController.settingsButton")
        changeThemeButton = signalApp.buttons.element(matching: .button, identifier: "AppSettingsViewController.dark_theme")
    }
    
    @discardableResult
    func openAppSettings() -> ThemePage {
        homeSettingsButton.tap()
        return self
    }
    
    @discardableResult
    func changeTheme() -> ThemePage {
        changeThemeButton.tap()
        sleep(3)
        if (changeThemeButton.label == "ic dark theme on") {
            XCTAssert(true)
        } else {
            XCTFail("dark theme not on")
        }
        //MARK: Reset theme to light mode
        changeThemeButton.tap()
        return self
    }
}
