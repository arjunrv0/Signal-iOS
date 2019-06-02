//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import Foundation
import XCTest

class ProfilePage: BasePage {
    
    private var profileNameStaticText: XCUIElement!
    private var appProfileSettingsCell: XCUIElement!
    private var backToSettingsButton: XCUIElement!
    
    @discardableResult
    override init() {
        super.init()
        
        profileNameStaticText = signalApp.staticTexts["Enter your name"]
        appProfileSettingsCell = signalApp.cells.element(matching: .cell, identifier: "AppSettingsViewController.profile")
        backToSettingsButton = signalApp.buttons["Settings"]
    }
    
    @discardableResult
    func openProfileEditSettings() -> ProfilePage {
        appProfileSettingsCell.tap()
        return self
    }
    
    @discardableResult
    func backToSettingsScreen() -> ProfilePage {
        backToSettingsButton.tap()
        return self
    }
}
