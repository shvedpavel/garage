//
//  SettingsVC.swift
//  garage
//
//  Created by Apple on 29.11.23.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutBtn(_ sender: UIBarButtonItem) {
       
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
