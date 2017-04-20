//
//  IntegrationAppUITests.swift
//  IntegrationAppUITests
//
//  Created by Test Station on 12/04/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

//'expectationForPredicate(_:evaluatedWithObject:handler:)' has been renamed to 
//'expectation(for:evaluatedWith:handler:)'

//'waitForExpectationsWithTimeout(_:handler:)' has been renamed to 
//'waitForExpectations(timeout:handler:)'

import XCTest

class IntegrationAppUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    func test1() {
        XCUIApplication().launch()
        app.buttons["Alerts"].tap()
        let appAlert = app.buttons["Create App Alert"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWithObject: appAlert, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        appAlert.tap()
        app.alerts["Magic"].buttons["Will do"].tap()
        app.navigationBars["FBAlertView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
    }
    
    func test2() {
        app.buttons["Attributes"].tap()
        
        let aidentifierTextField = app.textFields["aIdentifier"]
        aidentifierTextField.tap()
        aidentifierTextField.typeText("this is also test")
        
        let button = app.buttons["Button"]
        button.tap()
        button.tap()
        app.buttons["Second"].tap()
        app.buttons["First"].tap()
        
        app.sliders["50 %"].adjust(toNormalizedSliderPosition: 1)
        app.switches["1"].tap()
        app.switches["0"].tap()

        app.navigationBars["View"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    
    func test3() {
        app.buttons["Scrolling"].tap()
        app.buttons["TableView"].tap()
        app.tables["scrollView"].staticTexts["10"].swipeUp()
        app.tables["scrollView"].staticTexts["20"].swipeUp()
        app.navigationBars["UITableView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.buttons["ScrollView"].tap()
        app.staticTexts["10"].swipeUp()
        app.staticTexts["20"].swipeUp()
        app.navigationBars["FBScrollView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        app.navigationBars["UIView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
    }
    
}
