//
//  GalleryCollectionViewCell.swift
//  garage
//
//  Created by Apple on 3.01.24.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "GalleryCollectionViewCell"
    
    
    //создаем элементы для добавления в ячейку
    let bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        bgView.layer.cornerRadius = 5
        bgView.layer.shadowRadius = 5
        bgView.layer.shadowOpacity = 0.3
        bgView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        bgView.clipsToBounds = false
        return bgView
    }()
    
    let nameLable: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 26)
        label.textColor = UIColor(named: "textColor")!
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let modelLable: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 14)
        label.textColor = UIColor(named: "textColorSecondary")!
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let engineLable: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 14)
        label.textColor = UIColor(named: "textColorSecondary")!
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mileageLable: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 18)
        label.textColor = UIColor(named: "textColor")!
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let menuButon: UIButton = {
        let menuButon = UIButton(frame: CGRect(x: 154, y: 14, width: 28, height: 28))
//        let menuButon = UIButton(frame: CGRect(origin: CGPointZero, size: CGSize(width: 34, height: 34)))
        
        menuButon.backgroundColor = Theme.currentTheme.buttonColor
        menuButon.setImage(UIImage(named: "ellipsis"), for: .normal)
        menuButon.layer.cornerRadius = 14
        
        return menuButon
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //метод  для отображения элементов в ячейке
        addSubview(bgView)
        addSubview(nameLable)
        addSubview(modelLable)
        addSubview(engineLable)
        addSubview(mileageLable)
        addSubview(menuButon)

        
        //констрейнты для bgView
        bgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        bgView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13).isActive = true
        
        //констрейнты для названия авто
        nameLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        nameLable.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLable.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 5).isActive = true
        
        //констрейнты для модель авто
        modelLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        modelLable.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 2).isActive = true
        
        //констрейнты для тип двигателя авто
        engineLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        engineLable.topAnchor.constraint(equalTo: modelLable.bottomAnchor, constant: 2).isActive = true
        
        //констрейнты для пробега
        mileageLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        mileageLable.topAnchor.constraint(equalTo: engineLable.bottomAnchor, constant: 2).isActive = true
    
        //констрейнты для кнопки
        
        menuButon.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        menuButon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        menuButon.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 5).isActive = true
    }
        

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
