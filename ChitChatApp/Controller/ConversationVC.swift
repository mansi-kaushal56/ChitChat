//
//  ConversationVC.swift
//  ChitChatApp
//
//  Created by Raj Mohan on 26/11/24.
//

import UIKit
import FirebaseAuth

class ConversationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
        
    }
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            performSegue(withIdentifier: AppSegue.loginSegue.getSegueId, sender: nil)
        } else {
            performSegue(withIdentifier: AppSegue.splashToDashboardSegue.getSegueId, sender: nil)
        }
    }
    

}
