//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import Foundation
import XCTest

class ProfilePage: BasePage {
    
    private var profileNameStaticText: XCUIElement!
    private var appProfileSettingsCell: XCUIElement!
    private var backToSettingsButton: XCUIElement!
    private var profileEditNameTextField: XCUIElement!
    private var profileEditDiscardButton: XCUIElement!
    private var profileSaveButton: XCUIElement!
    
    @discardableResult
    override init() {
        super.init()
        
        profileNameStaticText = signalApp.staticTexts["Enter your name"]
        appProfileSettingsCell = signalApp.cells.element(matching: .cell, identifier: "AppSettingsViewController.profile")
        backToSettingsButton = signalApp.buttons["Settings"]
        profileEditNameTextField = signalApp.textFields.element(matching: .textField, identifier: "ProfileViewController.nameTextField")
        profileEditDiscardButton = signalApp.alerts.buttons.element(matching: .button, identifier:"ProfileViewController.discard" )
        profileSaveButton = signalApp.buttons.element(matching: .button, identifier: "ProfileViewController.saveButton")
        
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
    
    @discardableResult
    func tapEditNameInSettings() -> ProfilePage {
        profileEditNameTextField.tap()
        return self
    }
    
    @discardableResult
    func discardEditAndCheckName() -> ProfilePage {
        let nameInProfile = profileEditNameTextField.value as! String
        profileEditDiscardButton.tap()
        let nameInSettings = appProfileSettingsCell.staticTexts.element(boundBy: 1).label
        if nameInProfile == nameInSettings {
            XCTAssert(true)
        } else {
            XCTFail("Name in settings before and after discard is not same")
        }
        return self
    }
    
    @discardableResult
    func enterNameToSave() -> ProfilePage {
        let moveCursorToRightMost = signalApp.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.9))
        moveCursorToRightMost.tap()
        profileEditNameTextField.typeText(randomString(length: 2))
        sleep(3)
        let profileNameAfterEdit = profileEditNameTextField.value as? String
        profileSaveButton.tap()
        let profileNameAfterSaving = appProfileSettingsCell.staticTexts.element(boundBy: 1).label
        if profileNameAfterEdit == profileNameAfterSaving {
            XCTAssert(true)
        } else {
            XCTFail("Name after editing and saving is not the same")
        }
        return self
    }
}

