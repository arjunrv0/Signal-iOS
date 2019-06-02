//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import Foundation
import XCTest

class LoginTest: BaseTest {
    
    func testIndiaValidLogin() {
        _ = XCTContext.runActivity(named: "Test login for indian phone number") { (activity)  in
            LoginPage()
                .changeCallingCode(country: LoginPage.CallingCode.india.rawValue)
                .enterPhoneNumber(phone: LoginPage.Phone.indianNumber.rawValue)
                .proceedToOtpScreen()
        }
    }
}

