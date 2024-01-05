//
//  PlusCollectionViewCell.swift
//  garage
//
//  Created by Apple on 5.01.24.
//

import UIKit

class PlusCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "PlusCollectionViewCell"
    
    let plusButon: UIButton = {
        let plusButon = UIButton(frame: CGRect(x: 154, y: 14, width: 28, height: 28))
        
        plusButon.backgroundColor = Theme.currentTheme.buttonColor
        plusButon.setTitle("+", for: .normal)
        plusButon.layer.cornerRadius = 14
        
        return plusButon
    }()
    
    let textLable: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 18)
        label.textColor = UIColor(named: "textColorSecondary")!
        label.numberOfLines = 0
        label.text = "Добавить"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(plusButon)
        addSubview(textLable)
        
        //констрейнты для кнопки
        plusButon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        plusButon.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        
        //констрейнты для подписи
        textLable.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textLable.topAnchor.constraint(equalTo: plusButon.bottomAnchor, constant: 16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
