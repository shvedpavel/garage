//
//  ServiceCollectionViewCell.swift
//  garage
//
//  Created by Apple on 5.01.24.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "ServiceCollectionViewCell"
    
    
    let taskNameLable: UILabel = {
        let taskNameLable = UILabel()
        taskNameLable.font = UIFont(name: "Apple SD Gothic Neo", size: 14)
        taskNameLable.textColor = Theme.currentTheme.textColor
        taskNameLable.numberOfLines = 0
        taskNameLable.translatesAutoresizingMaskIntoConstraints = false
        return taskNameLable
    }()
    
    let deadlineLable: UILabel = {
        let deadlineLable = UILabel()
        deadlineLable.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        deadlineLable.textColor = Theme.currentTheme.textColor
        deadlineLable.numberOfLines = 0
        deadlineLable.translatesAutoresizingMaskIntoConstraints = false
        return deadlineLable
    }()
    let deadlineSlider: UISlider = {
        let deadlineSlider = UISlider(frame: CGRect(x: 16, y: 16, width: 180, height: 5))
        deadlineSlider.tintColor = .darkGray
        return deadlineSlider
    }()
    
    let menuButon: UIButton = {
        let menuButon = UIButton(frame: CGRect(x: 154, y: 14, width: 28, height: 28))
        menuButon.backgroundColor = Theme.currentTheme.buttonColor
        menuButon.setImage(UIImage(systemName: "ellipsis")?.withRenderingMode(.alwaysTemplate), for: .normal)
        menuButon.tintColor = .white
        menuButon.layer.cornerRadius = 14
        menuButon.layer.masksToBounds = true
        return menuButon
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(taskNameLable)
        addSubview(deadlineLable)
        addSubview(deadlineSlider)
        addSubview(menuButon)
        
        // КОНСТРЕЙНТЫ
        taskNameLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        taskNameLable.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        
        
        deadlineSlider.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        deadlineSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        deadlineSlider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        
        deadlineLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        deadlineLable.bottomAnchor.constraint(equalTo: deadlineSlider.topAnchor, constant: 5).isActive = true
        
        menuButon.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        menuButon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        menuButon.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
            
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    
    
    
    
    
    
    
    
