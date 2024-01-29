//
//  AddAutoVC.swift
//  garage
//
//  Created by Apple on 29.01.24.
//

import UIKit

class AddAutoVC: UIViewController {

    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var modelTF: UITextField!
    @IBOutlet weak var mileageЕА: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var vinTF: UITextField!
    @IBOutlet weak var motorTypeTF: UITextField!
    @IBOutlet weak var motorVolumeTF: UITextField!
    @IBOutlet weak var yearOfProductionTF: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        title = "Добавить авто"
    }
    

     // MARK: - Private functions
    private func applyTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
       
        saveBtn.tintColor = Theme.currentTheme.buttonColor
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
