//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import Foundation
import XCTest

class ProfileTest: BaseTest {
    
    func testProfileDiscardChanges(){
        _ = XCTContext.runActivity(named: "Discard profile update and check if changes are not reflected") { (activity) in
            ThemePage()
                .openAppSettings()
            ProfilePage()
                .openProfileEditSettings()
                .backToSettingsScreen()
            signalApp.debugDescription
            
        }
    }
}
