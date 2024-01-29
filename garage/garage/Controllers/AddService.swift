//
//  AddService.swift
//  garage
//
//  Created by Apple on 30.01.24.
//

import UIKit

class AddService: UIViewController {
    
    @IBOutlet weak var workDescriptionLbl: UILabel!
    
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var serviceDedlineLbl: UILabel!
    
    @IBOutlet weak var serviseMileageLbl: UILabel!
    
    @IBOutlet weak var serviceDedlineTF: UITextField!
    
    
    @IBOutlet weak var serviceMileageTF: UITextField!
    
    @IBOutlet weak var save: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        title = "Добавить напоминание"
    }
    
    // MARK: - Private functions
    private func applyTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        workDescriptionLbl.textColor = Theme.currentTheme.textColor
        serviseMileageLbl.textColor = Theme.currentTheme.textColor
        serviceDedlineLbl.textColor = Theme.currentTheme.textColor
        save.tintColor = Theme.currentTheme.buttonColor
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
