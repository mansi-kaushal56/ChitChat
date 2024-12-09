//
//  ProfileVC.swift
//  ChitChatApp
//
//  Created by Raj Mohan on 26/11/24.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var logoutView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecs()

        // Do any additional setup after loading the view.
    }
    func tapGestureRecs() {
        logoutView.addTapGestureRecognizer {
            self.splashViewType(screenType: .logout)
        }
    }
    func splashViewType(screenType: ScreenType) {
        switch screenType {
            
        case .logout:
            logOutBtn(title: "Logout", message: "Are you sure! You want to logout")
        default:
            return
        }
    }

   

}
