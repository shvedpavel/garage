//
//  BottunCellVC.swift
//  garage
//
//  Created by Apple on 7.12.23.
//

import UIKit

class ButtonCellAuto: UICollectionViewCell {
   // MARK: - Properties
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var addLbl: UILabel!
    
   
    
    
    // MARK: - Actions
    @IBAction func addBtnActions(_ sender: UIButton) {
    }
    
    
    // MARK: - Private funcs
    private func applyTheme() {
        self.backgroundColor = Theme.currentTheme.buttonColor
        addLbl.textColor = Theme.currentTheme.textColorSecondary
        addBtn.tintColor = Theme.currentTheme.buttonColor
    }
}
