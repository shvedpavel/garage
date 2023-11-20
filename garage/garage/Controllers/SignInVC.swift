//
//  signInVC.swift
//  garage
//
//  Created by Apple on 20.11.23.
//

import UIKit
//import Firebase
//import FirebaseAuth

class SignInVC: UIViewController {
    
    // MARK: - Properties
//    var ref: DatabaseReference
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var noAccountLbL: UILabel!
    
    @IBOutlet weak var forgetPassword: UIButton!
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    // MARK: - Life cycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
//        ref = Database.database().reference(withPath: "users")
    }
    
    
    @IBAction func forgetPasswordBtn(_ sender: UIButton) {
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Private functions
    
    private func applyTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        emailLbl.textColor = Theme.currentTheme.textColor
        passwordLbl.textColor = Theme.currentTheme.textColor
        noAccountLbL.textColor = Theme.currentTheme.textColor
        register.tintColor = Theme.currentTheme.textColorForReference
        forgetPassword.tintColor = Theme.currentTheme.textColorForReference
        button.tintColor = Theme.currentTheme.buttonColor
        
    }

}
