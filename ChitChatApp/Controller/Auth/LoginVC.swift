//
//  LoginVC.swift
//  ChitChatApp
//
//  Created by Raj Mohan on 26/11/24.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true

    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }

    @IBOutlet weak var passwordTextFld: UITextField!
    @IBOutlet weak var userNameTextFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextFld.delegate = self
        userNameTextFld.delegate = self
      

        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtnAction(_ sender: UIButton) {
        userNameTextFld.becomeFirstResponder()
        passwordTextFld.becomeFirstResponder()
        guard let email = userNameTextFld.text, let password = passwordTextFld.text, !email.isEmpty, !password.isEmpty, password.count >= 8 else {
            loginAlert()
            return
        }
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
          
            guard let result = authResult,error == nil else {
                print("Fail to log in user with email: \(email)")
                return
            }
            let user = result.user
            print(user)
            self.performSegue(withIdentifier: AppSegue.loginToDashboardSegue.getSegueId, sender: nil)
        }
    }
    func loginAlert() {
        let loginAlert = UIAlertController(title: "Woops", message: "Please enter the correct information", preferredStyle: .alert)
        loginAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(loginAlert, animated: false)
    }
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        performSegue(withIdentifier: AppSegue.registrationSegue.getSegueId, sender: nil)
    }
}
extension LoginVC:  UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextFld {
            passwordTextFld.becomeFirstResponder()
        }
        
        return true
    }
}
