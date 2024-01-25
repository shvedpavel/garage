//
//  CellForAoto.swift
//  garage
//
//  Created by Apple on 24.01.24.
//

import UIKit

class CellForAuto: UICollectionViewCell {

    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? Theme.currentTheme.buttonColor : Theme.currentTheme.backgroundColor
            self.button.backgroundColor =  !isSelected ? Theme.currentTheme.buttonColor : Theme.currentTheme.backgroundColor
            self.button.tintColor = isSelected ? Theme.currentTheme.buttonColor : Theme.currentTheme.backgroundColor
            self.autosName.textColor = isSelected ? .white : Theme.currentTheme.textColor
            self.mileage.textColor = isSelected ? .white : Theme.currentTheme.textColor
        }
    }
    
    @IBOutlet weak var autosName: UILabel!
    @IBOutlet weak var autosModel: UILabel!
    @IBOutlet weak var mileage: UILabel!
    @IBOutlet weak var button: UIButton!
    
    static let reusableIdentifire: String = "CellForAoto"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingButton()
    }

    private func settingButton() {
        button.layer.cornerRadius = button.frame.width/2
        button.layer.masksToBounds = false
    }
}
