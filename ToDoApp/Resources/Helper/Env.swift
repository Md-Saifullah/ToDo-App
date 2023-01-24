//
//  Env.swift
//  ToDoApp
//
//  Created by Mohammad Saifullah on 24/1/23.
//

import Foundation

struct Env {
    static let bearer = Bundle.main.object(forInfoDictionaryKey: "CONF_Bearer_Token") as! String
}
