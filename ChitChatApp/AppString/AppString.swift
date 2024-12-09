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
    case registerToLoginSegue
    case loginToDashboardSegue
    case splashToDashboardSegue
    
    var getSegueId: String {
        get {
            switch self {
            case .loginSegue: return "loginSegue"
            case .registrationSegue: return "registrationSegue"
            case .homeScreenSegue: return "homeScreenSegue"
            case .registerToLoginSegue: return "registerToLoginSegue"
            case .loginToDashboardSegue: return "loginToDashboardSegue"
            case .splashToDashboardSegue: return "splashToDashboardSegue"
            }
        }
    }
}

//MARK: Storyboard Identifier___________
enum AppStoryboards {
    case main
    case dashboard
    
    var getDescription: String {
        get {
            switch self {
            case .main:
                return "Main"
            case .dashboard:
                return "Dashboard"
            }
        }
    }
}
//________________

//MARK: View Controller Identifier
enum VCIdentifiers {
    case loginvc
 
    
    
    var getStoryboardID : String {
        get {
            switch self {
            case .loginvc:
                return AppStoryboards.main.getDescription
            
            }
        }
    }
    
    var getIdentifier : String {
        get {
            switch self {
            case .loginvc:
                return "loginvc"
            
            }
        }
    }
}

