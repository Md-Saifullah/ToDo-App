//
//  AppDelegate.swift
//  ToDoApp
//
//  Created by Softzino on 24/1/23.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        print("Your code here")

        #if targetEnvironment(simulator)
        // Disable hardware keyboards.
        let setHardwareLayout = NSSelectorFromString("setHardwareLayout:")
        UITextInputMode.activeInputModes
            // Filter `UIKeyboardInputMode`s.
            .filter { $0.responds(to: setHardwareLayout) }
            .forEach { $0.perform(setHardwareLayout, with: nil) }
        #endif

        return true
    }
}
