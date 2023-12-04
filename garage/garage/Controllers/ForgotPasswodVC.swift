//
//  ForgetPasswodVC.swift
//  garage
//
//  Created by Apple on 21.11.23.
//

import UIKit
import FirebaseAuth

class ForgotPasswodVC: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    @IBAction func sendPasswordBtn(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty else { return }
        
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self ] error in
            if let error = error {
                print("попробуйте еще раз")
                print(error)
            } else {
//                self?.dismiss(animated: true, completion: nil)
                self?.navigationController?.popToRootViewController(animated: true)
            }
        }
        
    }
    
}
