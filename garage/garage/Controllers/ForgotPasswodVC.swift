//
//  ForgetPasswodVC.swift
//  garage
//
//  Created by Apple on 21.11.23.
//

import UIKit
import FirebaseAuth

class ForgotPasswodVC: UIViewController {
   
    //MARK: - Properties
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var sendPassword: UIButton!
    
    // MARK: -  Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
    }
    // MARK: - Actions
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
 
    // MARK: - Private functions
    private func applyTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        label1.textColor = Theme.currentTheme.textColor
        label2.textColor = Theme.currentTheme.textColor
        label3.textColor = Theme.currentTheme.textColor
        sendPassword.tintColor = Theme.currentTheme.buttonColor
    }
}
