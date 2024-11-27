//
//  ConversationVC.swift
//  ChitChatApp
//
//  Created by Raj Mohan on 26/11/24.
//

import UIKit

class ConversationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let isLogin = UserDefaults.standard.bool(forKey: "logged_in")
        if !isLogin {
            performSegue(withIdentifier: AppSegue.loginSegue.getSegueId, sender: nil)
        }
    }

}
