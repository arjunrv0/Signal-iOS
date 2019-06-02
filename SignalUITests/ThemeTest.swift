//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
// 

import Foundation
import XCTest
class ThemeTest: BaseTest {
    
    func testThemeDarkMode() {
        _ = XCTContext.runActivity(named: "Change theme to dark mode") { (activity) in
            ThemePage()
            .openAppSettings()
            .changeTheme()            
        }
    }
}
