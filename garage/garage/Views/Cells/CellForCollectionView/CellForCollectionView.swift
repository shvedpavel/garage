//
//  CellForCollectionView.swift
//  garage
//
//  Created by Apple on 23.01.24.
//

import UIKit

class CellForCollectionView: UICollectionViewCell {

    @IBOutlet weak var tasksName: UILabel!
    @IBOutlet weak var deadline: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var button: UIButton!
    
    
    static let reusableIdentifire: String = "CellForCollectionView"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingButton()
    }

    
    private func settingButton() {
        button.layer.cornerRadius = button.frame.width/2
        button.layer.masksToBounds = false
    }
}
