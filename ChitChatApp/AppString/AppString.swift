//
//  AppString.swift
//  ChitChatApp
//
//  Created by Raj Mohan on 26/11/24.
//

import Foundation
enum AppSegue {
    case loginSegue
    case registrationSegue
    case homeScreenSegue
    
    var getSegueId: String {
        get {
            switch self {
            case .loginSegue: return "loginSegue"
            case .registrationSegue: return "registrationSegue"
            case .homeScreenSegue: return "homeScreenSegue"
            }
        }
    }
}
