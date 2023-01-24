//
//  LogInScreen_UITests.swift
//  ToDoApp_UITests
//
//  Created by Softzino on 20/1/23.
//

import XCTest

final class LogInScreen_UITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {}
    
    func test_LogInScreen_ComponentExists() {
        // MARK: - Given
        
        let imageStaticTexts = app.staticTexts["📝"]
        let toDoStaticText = app.staticTexts["ToDo App"]
        
        let nameText = app.staticTexts["Name:"]
        let nameTextField = app.textFields["Enter your full name"]
        
        let emailText = app.staticTexts["Email:"]
        let emailTextField = app.textFields["Enter your email"]
        
        let logInButton = app.buttons["Log In"]
        let alertText = app.alerts["Name Field can not be empty"].scrollViews.otherElements.buttons["OK"]
        
        let signUPButton = app.buttons["Sign Up"]
        
        // MARK: - When
        
        // MARK: - Then
        
        XCTAssertTrue(imageStaticTexts.exists)
        XCTAssertTrue(toDoStaticText.exists)
        
        XCTAssertTrue(nameText.exists)
        XCTAssertTrue(nameTextField.exists)
        
        XCTAssertTrue(emailText.exists)
        XCTAssertTrue(emailTextField.exists)
       
        let height = logInButton.frame.height
        XCTAssertTrue(height == 55)
        
//        app.alerts.element
//        app.buttons.element
//        app.collectionViews.element
//        app.images.element
//        app.maps.element
//        app.navigationBars.element
//        app.pickers.element
//        app.progressIndicators.element
//        app.scrollViews.element
//        app.segmentedControls.element
//        app.staticTexts.element
//        app.switches.element
//        app.tabBars.element
//        app.tables.element
//        app.textFields.element
//        app.textViews.element
//        app.webViews.element
       // let xOrigin = logInButton.frame.origin.x
        
        XCTAssertTrue(logInButton.exists)
        XCTAssertTrue(signUPButton.exists)
    }
    
    func test_LogInScreen_NotSignUP() {
        // MARK: - Given

        let nameTextField = app.textFields["Enter your full name"]
        let emailTextField = app.textFields["Enter your email"]
        let signUPButton = app.buttons["Sign Up"]
        let alertButton = app.alerts["Invalid email"].scrollViews.otherElements.buttons["OK"]
        let returnButton = app.buttons["Return"]

        nameTextField.tap()
        let mKey = app/*@START_MENU_TOKEN@*/ .keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        mKey.tap()
        
        emailTextField.tap()
        mKey.tap()
        mKey.tap()
        mKey.tap()
        returnButton.tap()
        
        signUPButton.tap()
        alertButton.tap()
        
        nameTextField.tap()
        
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        
        emailTextField.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
                        
    }
    
    func test_LogInScreen_ShouldLogIn() {
        // MARK: - Given

        let nameTextField = app.textFields["Enter your full name"]
        let emailTextField = app.textFields["Enter your email"]
        let alertButton = app.alerts["Invalid email"].scrollViews.otherElements.buttons["OK"]
        let navigationTitle = app.navigationBars["ToDo App 📝"].staticTexts["ToDo App 📝"]
        
        nameTextField.tap()
                            
        let mKey = app/*@START_MENU_TOKEN@*/ .keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        mKey.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/ .keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()

        let sKey = app/*@START_MENU_TOKEN@*/ .keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        sKey.tap()
    
        let uKey = app/*@START_MENU_TOKEN@*/ .keys["u"]/*[[".keyboards.keys[\"u\"]",".keys[\"u\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        uKey.tap()
      
        let dKey = app/*@START_MENU_TOKEN@*/ .keys["d"]/*[[".keyboards.keys[\"d\"]",".keys[\"d\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dKey.tap()

        emailTextField.tap()
        mKey.tap()
    
        aKey.tap()
       
        sKey.tap()
     
        uKey.tap()
    
        dKey.tap()
     
        let moreKey = app/*@START_MENU_TOKEN@*/ .keys["more"]/*[[".keyboards",".keys[\"numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
     
        let key = app/*@START_MENU_TOKEN@*/ .keys["@"]/*[[".keyboards.keys[\"@\"]",".keys[\"@\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
    
        let moreKey2 = app/*@START_MENU_TOKEN@*/ .keys["more"]/*[[".keyboards",".keys[\"letters\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey2.tap()
    
        let gKey = app/*@START_MENU_TOKEN@*/ .keys["g"]/*[[".keyboards.keys[\"g\"]",".keys[\"g\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        gKey.tap()
  
        mKey.tap()

        aKey.tap()

        let iKey = app/*@START_MENU_TOKEN@*/ .keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        
        let lKey = app/*@START_MENU_TOKEN@*/ .keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lKey.tap()
    
        moreKey.tap()
 
        let key2 = app/*@START_MENU_TOKEN@*/ .keys["."]/*[[".keyboards.keys[\".\"]",".keys[\".\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        moreKey2.tap()
        
        let cKey = app/*@START_MENU_TOKEN@*/ .keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cKey.tap()
        
        let oKey = app/*@START_MENU_TOKEN@*/ .keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()
        mKey.tap()
        
        app.buttons["Log In"].tap()
        navigationTitle.tap()
    }
    
    func test_LogInScreen_SignOutFromSignIn() {
        XCUIApplication().tabBars["Tab Bar"].buttons["profile"].tap()
        XCUIApplication().tabBars["Tab Bar"].buttons["profile"].tap()
        
        let logOutButton = app.buttons["Log Out"]
        logOutButton.tap()
    }
}
 
