//
//  EditItem_UITests.swift
//  ToDoApp_UITests
//
//  Created by Softzino on 23/1/23.
//

import XCTest

final class EditItem_UITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {}
    
    func test_EditItem_FunctionalWork() {
        // MARK: - If the app not log in

//        let logInModel = LogInScreen_UITests()
//        logInModel.test_LogInScreen_ShouldLogIn()
        
        let toDoItem = app.collectionViews/*@START_MENU_TOKEN@*/ .buttons["title, Due Date: January 24, 2023"]/*[[".cells.buttons[\"title, Due Date: January 24, 2023\"]",".buttons[\"title, Due Date: January 24, 2023\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let statusCompletedSwitch = app.switches["Status: Completed"]
        let statusPendingSwitch = app.switches["Status: Pending"]
        let datePicker = app.datePickers.containing(.button, identifier: "Date Picker")
        let popOverDismiss = app/*@START_MENU_TOKEN@*/ .buttons["PopoverDismissRegion"]/*[[".buttons[\"dismiss popup\"]",".buttons[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let updateButton = app.buttons["UPDATE"]
        
        toDoItem.tap()
        
        datePicker.element.tap()
        popOverDismiss.tap()
        statusPendingSwitch.swipeRight()
        
        updateButton.tap()
        toDoItem.tap()
        statusCompletedSwitch.swipeLeft()
        updateButton.tap()
    }
    
    func test_EditItem_ComponentsExists() {
        let toDoItem = app.collectionViews/*@START_MENU_TOKEN@*/ .buttons["title, Due Date: January 24, 2023"]/*[[".cells.buttons[\"title, Due Date: January 24, 2023\"]",".buttons[\"title, Due Date: January 24, 2023\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let navigationBarItem = app.navigationBars["Edit Item 🖊️"].staticTexts["Edit Item 🖊️"]
        let title = app.staticTexts["Title:"]
        let titleField = app.textFields["Enter title"]
        let dateTitle = app.staticTexts["Set Due Date"]
        let datePicker = app.datePickers.containing(.button, identifier: "Date Picker").element
        let popOverButton = app/*@START_MENU_TOKEN@*/ .buttons["PopoverDismissRegion"]/*[[".buttons[\"dismiss popup\"]",".buttons[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let deleteButton = app.buttons["DELETE"]
        let updateButton = app.buttons["UPDATE"]
                                
        toDoItem.tap()
        navigationBarItem.tap()
        title.tap()
        titleField.tap()
        dateTitle.tap()
        datePicker.tap()
        popOverButton.tap()

        XCTAssertTrue(navigationBarItem.exists)
        XCTAssertTrue(title.exists)
        XCTAssertTrue(titleField.exists)
        XCTAssertTrue(dateTitle.exists)
        XCTAssertTrue(datePicker.exists)
        XCTAssertTrue(deleteButton.exists)
        XCTAssertTrue(updateButton.exists)
    }
}
