//
//  isValidExtension.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 11/1/23.
//

import Foundation

extension String {
    var isValid: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}
