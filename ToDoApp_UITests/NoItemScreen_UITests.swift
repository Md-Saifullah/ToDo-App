//
//  NoItemScreen_UITests.swift
//  ToDoApp_UITests
//
//  Created by Softzino on 23/1/23.
//

import XCTest

final class NoItemScreen_UITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {}
    
    func test_NoItemScreen_ComponentExist() {
        let toDoNavigationBars = app.navigationBars["ToDo App 📝"].staticTexts["ToDo App 📝"]
        let rightNavigationBarItem = app.navigationBars["ToDo App 📝"].buttons["note.text.badge.plus"]
        let leftNavigationBarItem = app.navigationBars["ToDo App 📝"]/*@START_MENU_TOKEN@*/ .buttons["Edit"]/*[[".otherElements[\"Edit\"].buttons[\"Edit\"]",".buttons[\"Edit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let noItemsStaticText = app.staticTexts["No Items"]
        let descriptionText = app.staticTexts["Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!"]
        let addSomethingButton = app.buttons["Add Something 🥳"]

        XCUIApplication().navigationBars["Add an Item 🖊️"].buttons["Back"]
        
//        let logInTestModel = LogInScreen_UITests()
//        logInTestModel.test_LogInScreen_ShouldLogIn()
        
        XCTAssertTrue(toDoNavigationBars.exists)
        XCTAssertTrue(rightNavigationBarItem.exists)
        XCTAssertTrue(leftNavigationBarItem.exists)
        XCTAssertTrue(noItemsStaticText.exists)
        XCTAssertTrue(descriptionText.exists)
        XCTAssertTrue(addSomethingButton.exists)
    }
    
    func test_NoItemScreen_ToGoAddItems() {
        let addSomethingButton = app.buttons["Add Something 🥳"]
        let titleTextField = app.textFields["Enter title"]
        let saveButton = app.buttons["SAVE"]


        addSomethingButton.tap()
            
        titleTextField.tap()
        let tKey = app/*@START_MENU_TOKEN@*/ .keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tKey.tap()
            
        let iKey = app/*@START_MENU_TOKEN@*/ .keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        tKey.tap()
            
        let lKey = app/*@START_MENU_TOKEN@*/ .keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lKey.tap()
            
        let eKey = app/*@START_MENU_TOKEN@*/ .keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        app/*@START_MENU_TOKEN@*/ .buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/ .tap()
    
        saveButton.tap()
        let editButton = app.navigationBars["ToDo App 📝"]/*@START_MENU_TOKEN@*/.buttons["Edit"]/*[[".otherElements[\"Edit\"].buttons[\"Edit\"]",".buttons[\"Edit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        editButton.tap()
        let doneButton = app.navigationBars["ToDo App 📝"]/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".otherElements[\"Done\"].buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        doneButton.tap()
                                                
    }
    
    func test_ToDoItem_ComponentExist() {
        let toDoItem = app.collectionViews/*@START_MENU_TOKEN@*/.buttons["title, Due Date: January 24, 2023"]/*[[".cells.buttons[\"title, Due Date: January 24, 2023\"]",".buttons[\"title, Due Date: January 24, 2023\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let editButton = app.navigationBars["ToDo App 📝"]/*@START_MENU_TOKEN@*/.buttons["Edit"]/*[[".otherElements[\"Edit\"].buttons[\"Edit\"]",".buttons[\"Edit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let removeButton = app.collectionViews.cells.otherElements.containing(.image, identifier:"remove")
                        
        XCTAssertTrue(toDoItem.exists)
        
        editButton.tap()
        removeButton.element.tap()
                      
    }
    
    func test_ToDoItem_Delete() {
        let toDoItem = app.collectionViews/*@START_MENU_TOKEN@*/.buttons["title, Due Date: January 24, 2023"]/*[[".cells.buttons[\"title, Due Date: January 24, 2023\"]",".buttons[\"title, Due Date: January 24, 2023\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let deleteButton = app.buttons["DELETE"]
        let alertsButton = app.alerts["Do you really want to delete?"].scrollViews.otherElements.buttons["Ok"]
       
        toDoItem.tap()
        deleteButton.tap()
        alertsButton.tap()
    }
    
}
