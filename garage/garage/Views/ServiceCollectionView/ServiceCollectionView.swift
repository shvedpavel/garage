//
//  ServiceCollectionView.swift
//  garage
//
//  Created by Apple on 5.01.24.
//

import UIKit

class ServiceCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [ServiceModel]()
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = Theme.currentTheme.backgroundColor
        
        delegate = self
        dataSource = self
        
        register(ServiceCollectionViewCell.self, forCellWithReuseIdentifier: ServiceCollectionViewCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        //устанавливаем растояние между ячейками
        layout.minimumLineSpacing = Constans.galleryMinimumLineSpace
        
        ///сколько хотим отступить от края какой границы
        contentInset = UIEdgeInsets(top: 0, left: Constans.leftDistanceToView, bottom: 0, right: Constans.rightDistanceToView)
        
        ///убираем  ползунок  в скроле (аналогично можно сделать для вертикального)
        showsVerticalScrollIndicator = false
    }
    
    func set(cells: [ServiceModel]) {
        self.cells = cells
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: ServiceCollectionViewCell.reuseID, for: indexPath) as! ServiceCollectionViewCell
        cell.taskNameLable.text = cells[indexPath.row].taskName
        //сделать вариабельным
        cell.deadlineLable.text = "\(cells[indexPath.row].date)"
  
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // тут меняем размер каждой ячейки
        return CGSize(width: 200, height: 120)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
