//
//  ServiceCollectionViewCell.swift
//  garage
//
//  Created by Apple on 5.01.24.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "ServiceCollectionViewCell"
    
    let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.layer.cornerRadius = 5
        bgView.layer.shadowRadius = 2
        bgView.layer.shadowOpacity = 0.3
        bgView.layer.shadowOffset = CGSize(width: 5, height: 5)
        bgView.clipsToBounds = false
        return bgView
    }()
    
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
        deadlineLable.text = "Осталось 7 дней"
        deadlineLable.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        deadlineLable.textColor = Theme.currentTheme.textColor
        deadlineLable.numberOfLines = 0
        deadlineLable.translatesAutoresizingMaskIntoConstraints = false
        return deadlineLable
    }()
    
    let deadlineProgressView: UIProgressView = {
        let deadlineProgressView = UIProgressView()
        deadlineProgressView.tintColor = .darkGray
        deadlineProgressView.progressTintColor = Theme.currentTheme.buttonColor
        deadlineProgressView.progress = 0.5
        deadlineProgressView.translatesAutoresizingMaskIntoConstraints = false
        return deadlineProgressView
    }()
    
    let menuButon: UIButton = {
        let menuButon = UIButton()
        menuButon.backgroundColor = Theme.currentTheme.buttonColor
        menuButon.setImage(UIImage(systemName: "ellipsis")?.withRenderingMode(.alwaysTemplate), for: .normal)
        menuButon.tintColor = .white
        menuButon.layer.cornerRadius = 14
        menuButon.layer.masksToBounds = true
        menuButon.translatesAutoresizingMaskIntoConstraints = false
        return menuButon
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//     
        
        
        
        horizontalStack.addArrangedSubview(taskNameLable)
        horizontalStack.addArrangedSubview(menuButon)
        
        verticalStack.addArrangedSubview(horizontalStack)
        verticalStack.addArrangedSubview(deadlineLable)
        verticalStack.addArrangedSubview(deadlineProgressView)
        
        bgView.addSubview(verticalStack)
       
        addSubview(bgView)
     
        // КОНСТРЕЙНТЫ
        
//        констрейнты для bgView
        bgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        bgView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13).isActive = true
        
        verticalStack.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 8).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -8).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -8).isActive = true
        
        menuButon.heightAnchor.constraint(equalToConstant: 28).isActive = true
        menuButon.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        horizontalStack.widthAnchor.constraint(equalTo: verticalStack.widthAnchor, multiplier: 1).isActive = true
        
        deadlineProgressView.widthAnchor.constraint(equalTo: verticalStack.widthAnchor, multiplier: 1).isActive = true
        deadlineProgressView.heightAnchor.constraint(equalToConstant: 6).isActive = true


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    
    
    
    
    
    
    
    
