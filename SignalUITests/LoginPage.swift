//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import Foundation
import XCTest

class LoginPage: BasePage {
    
    private var phoneNumberTextField: XCUIElement!
    private var countryNameLabel: XCUIElement!
    private var callingCodeLabel: XCUIElement!
    private var callingCodeTableQuery: XCUIElement!
    private var callingCode: XCUIElementQuery!
    private var phoneNumberNextButton: XCUIElement!
    
    enum Phone: String{
        case indianNumber = "9487757520"
    }
    
    enum CallingCode: String {
        case india = "India"
    }
    
    @discardableResult
    override init() {
         super.init()
        
        phoneNumberTextField = signalApp.textFields.element(matching: .textField, identifier: "onboarding.phoneNumber.phoneNumberTextField")
        countryNameLabel = signalApp.staticTexts.element(matching: .staticText, identifier: "onboarding.phoneNumber.countryNameLabel")
        callingCodeLabel = signalApp.staticTexts.element(matching: .staticText, identifier: "onboarding.phoneNumber.callingCodeLabel")
        callingCodeTableQuery = signalApp.tables.searchFields["Search by name or number"]
        callingCode = signalApp.tables
        phoneNumberNextButton = signalApp.buttons.element(matching: .button, identifier: "onboarding.phoneNumber.nextButton.button")
    }
    
    @discardableResult
    func changeCallingCode(country: String) -> LoginPage {
        countryNameLabel.tap()
        callingCodeTableQuery.tap()
        callingCodeTableQuery.typeText(country)
        let changeCallingCode = callingCode.staticTexts[country]
        changeCallingCode.tap()
        return self
    }
    
    @discardableResult
    func enterPhoneNumber(phone: String) -> LoginPage {
        phoneNumberTextField.tap()
        phoneNumberTextField.typeText(phone)
        return self
    }
    
    @discardableResult
    func proceedToOtpScreen() -> LoginPage {
        phoneNumberNextButton.tap()
        return self
    }
    
}