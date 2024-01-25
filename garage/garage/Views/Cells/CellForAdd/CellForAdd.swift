//
//  CellForAdd.swift
//  garage
//
//  Created by Apple on 24.01.24.
//

import UIKit

class CellForAdd: UICollectionViewCell {
   
    @IBOutlet weak var button: UIButton!
    
    static let reusableIdentifire: String = "CellForAdd"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingButton()
    }

    private func settingButton() {
        button.layer.cornerRadius = button.frame.width/2
        button.layer.masksToBounds = false
    }
}
