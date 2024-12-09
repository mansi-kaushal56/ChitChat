//
//  UIViewExtension.swift
//  ChitChatApp
//
//  Created by Raj Mohan on 28/11/24.
//

import Foundation
import UIKit
import FirebaseAuth

extension UIViewController {
    func backBtn() {
        let backButtonImg = UIButton()
        backButtonImg.setImage(UIImage(named: "ic_back_btn"), for: .normal)
        backButtonImg.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside) // Back Btn Action
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView:backButtonImg)
    }
    @objc func backBtnTapped(_ sender: UIBarButtonItem) {
        if self.navigationController?.viewControllers.count == 1 {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    func logOutBtn(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
            do  {
                try FirebaseAuth.Auth.auth().signOut()
                self.openStoryboard()
            } catch {
                print("Fail to logout")
            }
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel))
        self.present(alert, animated: true)
    }
    
    func openStoryboard() {
        let storyboard = UIStoryboard(name: AppStoryboards.main.getDescription, bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: VCIdentifiers.loginvc.getIdentifier) as! LoginVC
        
        // Use pushViewController if within a navigation controller
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
