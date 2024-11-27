//
//  RegisterVC.swift
//  ChitChatApp
//
//  Created by Raj Mohan on 26/11/24.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var lastNameTxtFld: UITextField!
    @IBOutlet weak var firstNameTxtFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTxtFld.delegate = self
        lastNameTxtFld.delegate = self
        emailTxtFld.delegate = self
        passwordTxtFld.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtnAction(_ sender: UIButton) {
    }
    @IBAction func registerBtnAction(_ sender: UIButton) {
        emailTxtFld.becomeFirstResponder()
        passwordTxtFld.becomeFirstResponder()
        firstNameTxtFld.becomeFirstResponder()
        lastNameTxtFld.becomeFirstResponder()
        guard let email = emailTxtFld.text, let password = passwordTxtFld.text, let firstName = firstNameTxtFld.text, let lastName = lastNameTxtFld.text, !email.isEmpty, !firstName.isEmpty, !lastName.isEmpty, !password.isEmpty, password.count >= 8 else {
            registerAlert()
            return
        }
    }
    func registerAlert() {
        let loginAlert = UIAlertController(title: "Woops", message: "Please enter the correct information", preferredStyle: .alert)
        loginAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(loginAlert, animated: false)
    }
    @IBAction func selectProfileImgBtn(_ sender: UIButton) {
        presentPhotoSheet()
    }
    
}
extension RegisterVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTxtFld {
            lastNameTxtFld.becomeFirstResponder()
        }
        if textField == lastNameTxtFld {
            emailTxtFld.becomeFirstResponder()
        }
        if textField == emailTxtFld {
            passwordTxtFld.becomeFirstResponder()
        }
        
        return true
    }
}
extension RegisterVC: UIImagePickerControllerDelegate {
    func presentPhotoSheet() {
        let photoActionSheet = UIAlertController(title: "Profile Photo", message: "How whould you like to select a picture.", preferredStyle: .actionSheet)
        photoActionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        photoActionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        }))
        photoActionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { _ in
            
        }))
        present(photoActionSheet, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
}
