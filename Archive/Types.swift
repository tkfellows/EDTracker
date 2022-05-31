//
//  Types.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-07.
//

import Combine
import Foundation

class UserSettings: ObservableObject {
    
    @Published var isAuthenticated = false
    
    var authenticationString: String {
        if isAuthenticated {
            return "Authenticated"
        } else {
            return "Anonymous"
        }
    }
}

class AppSettings: ObservableObject {
    @Published var language = "English"
}

