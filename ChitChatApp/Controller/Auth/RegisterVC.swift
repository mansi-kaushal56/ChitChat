//
//  RegisterVC.swift
//  ChitChatApp
//
//  Created by Raj Mohan on 26/11/24.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {

    @IBOutlet weak var profileImgView: UIView!
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
        profileImgView.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtnAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: AppSegue.registerToLoginSegue.getSegueId, sender: nil)
        
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
        DatabaseManager.shared.userExist(with: email) { [weak self] exist in
            guard !exist else {
                self?.registerAlert()
                return
            }
        }
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
           
            guard authResult != nil, error == nil else {
                print("Error creating user")
                return
            }
            DatabaseManager.shared.insertUser(with: ChatAppUser(firstName: firstName,
                                                                lastName: lastName,
                                                                emailAddress: email))
            self.performSegue(withIdentifier: AppSegue.registerToLoginSegue.getSegueId, sender: nil)
           
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
extension RegisterVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func presentPhotoSheet() {
        let photoActionSheet = UIAlertController(title: "Profile Photo", message: "How whould you like to select a picture.", preferredStyle: .actionSheet)
        photoActionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        photoActionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in
            self?.presentCamera()
        }))
        photoActionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        present(photoActionSheet, animated: true)
    }
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
        
    }
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        print(info)
        guard let selectedImg = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        self.profileImg.image = selectedImg
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
