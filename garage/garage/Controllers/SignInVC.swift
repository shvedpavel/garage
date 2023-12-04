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

    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle!
    
    private let eyeButton = EyeButton()
    
    private var isPrivate = true
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var noAccountLbL: UILabel!
    
    @IBOutlet weak var forgetPassword: UIButton!
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet  var passwordTF: UITextField!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        stateDidChangeListenerHandle()
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)
        
        emailTF.delegate = self
        passwordTF.delegate = self
        
        setupPasswordTF()
        addActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTF.text = nil
        passwordTF.text = nil
        emailTF.backgroundColor = nil
        passwordTF.backgroundColor = nil
        
    }
    
    
    
    // MARK: - Actions
    @IBAction func forgetPasswordBtn(_ sender: UIButton) {
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
    }
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
                //обработать в зависимости от конкретного поля
                self?.errorNotification(object: self?.emailTF)
                self?.errorNotification(object: self?.passwordTF)
            } else if let user = user {
                self?.performSegue(withIdentifier: "goToHomePage", sender: nil)
            }
        }
    }
 
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
    
    private func stateDidChangeListenerHandle() {
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ [ weak self ] _, user in
            guard let _ = user else { return }
        })
    }
    
    private func errorNotification (object: UITextField!) {
        guard let object = object else { return }
         object.backgroundColor = .red.withAlphaComponent(0.05)
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
    ///метод для  отображения картинки на кнопке
    @objc
    private func displayBookMarks() {
        let imageName = isPrivate ? "eye" : "eye.slash"
        
        passwordTF.isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
        isPrivate.toggle()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
        Auth.auth().removeStateDidChangeListener(authStateDidChangeListenerHandle)
    }
}

// MARK: - Extension
extension SignInVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text  = textField.text else { return }
        eyeButton.isEnabled = !text.isEmpty
    }
    
}
private extension SignInVC {
    ///метод добавления кнопки на TF
    func setupPasswordTF() {
        ///отслеживаем пустое поле или нет
        passwordTF.delegate = self
        
        ///добавляем элемент с нужной стороны
        passwordTF.rightView = eyeButton
        ///устанавливаем, когда  отображать
        passwordTF.rightViewMode = .always
    }
    /// метод для реализации action
    func addActions() {
        eyeButton.addTarget(self, action: #selector(displayBookMarks), for: .touchUpInside)
    }
}
