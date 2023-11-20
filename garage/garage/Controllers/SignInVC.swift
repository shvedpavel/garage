//
//  signInVC.swift
//  garage
//
//  Created by Apple on 20.11.23.
//

import UIKit


class SignInVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var noAccountLbL: UILabel!
    @IBOutlet weak var forgetPassword: UILabel!
    @IBOutlet weak var registerLbl: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    // MARK: - Life cycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
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
        forgetPassword.textColor = Theme.currentTheme.textColorForReference
        registerLbl.textColor = Theme.currentTheme.textColorForReference
        button.tintColor = Theme.currentTheme.buttonColor
        
    }

}
