//
//  newHomePage.swift
//  garage
//
//  Created by Apple on 23.01.24.
//

import UIKit

class NewHomePage: UIViewController {
    
    private var autos: [AutoModel] = []
    
    enum Sections: Int, CaseIterable {
        case one
        case second
        
        var title: String {
            switch self {
            case .one:
                return "Мой автопарк"
            case .second:
                return "Техническое обслуживание"
            }
        }
    }
    
    private lazy var collectionView = makeCollectionView()
    private var selectedIndex: IndexPath = IndexPath(item: 0, section: 0)
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        sutupConstraintForCollection()
        autos = AutoModel.fetchAuto()
        collectionView.selectItem(at: selectedIndex, animated: false, scrollPosition: .centeredHorizontally)
    }
}


//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension NewHomePage: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return autos.count+1
        default:
            guard selectedIndex.row < autos.count else { return 0 }
            return autos[selectedIndex.row].services.count + 1
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            
            if  indexPath.row == autos.count {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellForAdd.reusableIdentifire, for: indexPath) as! CellForAdd
                cell.backgroundColor = Theme.currentTheme.backgroundColor
                cell.roundedWithShadow()
                
                return cell
            } else  {
                let auto = autos[indexPath.row]
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellForAuto.reusableIdentifire, for: indexPath) as! CellForAuto
                cell.backgroundColor = cell.isSelected ? Theme.currentTheme.buttonColor : Theme.currentTheme.backgroundColor
                cell.roundedWithShadow()
                
                cell.autosName.text = auto.name
                cell.autosModel.text = auto.model
                cell.mileage.text = String(auto.modification.mileage)
                
                return cell
            }
        
        default:
            
            if indexPath.row == 0 {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellForAdd.reusableIdentifire, for: indexPath) as! CellForAdd
                cell.backgroundColor = Theme.currentTheme.backgroundColor
                cell.roundedWithShadow()
                
                return cell
                
            } else {
                let to = autos[selectedIndex.row].services[indexPath.row-1]
            
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellForCollectionView.reusableIdentifire, for: indexPath) as! CellForCollectionView
                cell.backgroundColor = Theme.currentTheme.backgroundColor
                cell.roundedWithShadow()
                
                cell.tasksName.text = to.taskName
                    
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            selectedIndex = indexPath
            collectionView.reloadSections(IndexSet(integer: 1))
        }
    }
}

extension NewHomePage {
    //MARK: - setup collection layout
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            return sectionIndex == 0 ? self.makeFirstLayoutSection() : self.makeSecondLayoutSection()
        }
        return layout
    }
    
    private func makeFirstLayoutSection() -> NSCollectionLayoutSection {
        let spacing: CGFloat = 8
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(220),
            heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(220),
            heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(spacing)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }
    
    private func makeSecondLayoutSection() -> NSCollectionLayoutSection {
        let spacing: CGFloat = 8
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(spacing)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        
        return section
    }
    
    // MARK: - setup collection
    private func makeCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = LichtTheme().backgroundColor
        
        let nib = UINib(nibName: CellForAuto.reusableIdentifire, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CellForAuto.reusableIdentifire)
        
        ///!!!!!!!!
        let secondNib = UINib(nibName: CellForCollectionView.reusableIdentifire, bundle: nil)
        collectionView.register(secondNib, forCellWithReuseIdentifier: CellForCollectionView.reusableIdentifire)
        
        let addNib = UINib(nibName: CellForAdd.reusableIdentifire, bundle: nil)
        collectionView.register(addNib, forCellWithReuseIdentifier: CellForAdd.reusableIdentifire)
    
        
        return collectionView
    }
    
    private func sutupConstraintForCollection() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension UICollectionViewCell {
    func roundedWithShadow() {
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.clipsToBounds = false
    }
}
