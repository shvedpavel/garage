//
//  GalleryCollectionView.swift
//  garage
//
//  Created by Apple on 3.01.24.
//

import UIKit

class GalleryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [AutoModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = Theme.currentTheme.backgroundColor
      
        //??????
        delegate = self
        dataSource = self
        
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseID)
        
//        register(GalleryCollectionViewCell.self, forSupplementaryViewOfKind: GalleryCollectionViewCell.reuseID, withReuseIdentifier: PlusCollectionViewCell.reuseID)

        register(PlusCollectionViewCell.self, forCellWithReuseIdentifier: PlusCollectionViewCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        //устанавливаем растояние между ячейками
        layout.minimumLineSpacing = Constans.galleryMinimumLineSpace
        
        ///сколько хотим отступить от края какой границы
        contentInset = UIEdgeInsets(top: 0, left: Constans.leftDistanceToView, bottom: 0, right: Constans.rightDistanceToView)
        
        ///убираем  ползунок  в скроле (аналогично можно сделать для вертикального)
        showsHorizontalScrollIndicator = false
    }
    
    //заполняем ячейки информацией
    func set(cells: [AutoModel]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseID, for: indexPath) as! GalleryCollectionViewCell
        cell.nameLable.text = cells[indexPath.row].name
        cell.modelLable.text = cells[indexPath.row].model
        cell.engineLable.text = cells[indexPath.row].modification.engine
        ///переделать
        ///подтянуть  км или мили
        cell.mileageLable.text = "\(cells[indexPath.row].modification.mileage) км"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // тут меняем размер каждой ячейки
        return CGSize(width: 200, height: 120)
    }
    
    //??????
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
