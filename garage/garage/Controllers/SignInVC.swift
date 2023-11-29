//
//  signInVC.swift
//  garage
//
//  Created by Apple on 20.11.23.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInVC: UIViewController {
    
    // MARK: - Properties

    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)
        
        emailTF.delegate = self
        passwordTF.delegate = self
    }
    
    // MARK: - Actions
//    @IBAction func forgetPasswordBtn(_ sender: UIButton) {
//    }
    
//    @IBAction func registerBtn(_ sender: UIButton) {
//    }
    @IBAction func signIn(_ sender: UIButton) {
        guard let email = emailTF.text,
              let password = passwordTF.text,
              !email.isEmpty, !password.isEmpty
        else  {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if let error = error {
                print(error.localizedDescription)
                //добавить изменение цвета при ошибке
                
            } else if let user = user {
                self?.performSegue(withIdentifier: "goToHomePage", sender: nil)
            }
        }
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
    
    @objc
    private func kbWillShow(notification: Notification) {
        view.frame.origin.y = 0
        if let keyboardsize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            view.frame.origin.y -= keyboardsize.height / 2
        }
    }
    @objc
    private func kbWillHide(notification: Notification) {
        view.frame.origin.y = 0
    }

}

extension SignInVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
