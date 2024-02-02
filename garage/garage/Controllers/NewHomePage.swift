//
//  newHomePage.swift
//  garage
//
//  Created by Apple on 23.01.24.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class NewHomePage: UIViewController {
   
    // MARK: - Properties
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
    
    private var autos: [AutoModel] = []
    //private var  autos: AutosSingltonClass? = AutosSingltonClass.shared
    //private var  services: ServiceSingltonClass? = ServiceSingltonClass.shared
    
//    var refForAutos: DatabaseReference!
//    var refForService: DatabaseReference!
    
    private let service: AutoService = AutoServiceImpl.shader
    
    private lazy var collectionView = makeCollectionView()
    private var selectedIndex: IndexPath = IndexPath(item: 0, section: 0)
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        sutupConstraintForCollection()
        collectionView.selectItem(at: selectedIndex, animated: false, scrollPosition: .centeredHorizontally)
        title = "GARAGE"
        
        service.fetchAutos() { [weak self] result in
            switch result {
            case .success(let autos):
                self?.autos = autos
                self?.collectionView.reloadData()
            case .failure(let failure):
                print(failure)
            }
        }
        
        //вытягиваем нужное авто
        
//        guard let currentAuto = Auth.auth().ca
        //oneAuto = AutoModel(auto: )
//        refForService = Database.database().reference(withPath: "users").child(user.uid).child("autos").child(autos?.autos.).child("services")
        
//        refForService = Database.database().reference(withPath: "users").child(user.uid).child("users").child(oneAuto.name).child("services")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.selectItem(at: selectedIndex, animated: false, scrollPosition: .centeredHorizontally)
        

        ///реализация наблюдения за новыми service (за категорией service)
//        refForService.observe(.value) { [weak self] snapshot in
//            var services = ServiceSingltonClass.shared
//            for item in  snapshot.children {
//                guard let snapshot = item as? DataSnapshot,
//                      let newService = ServiceModel(snapshot: snapshot) else { return }
//                services.services.append(newService)
//            }
//            self?.services = services
//            self?.collectionView.reloadData()
//        }
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension NewHomePage: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    ///устанавливаем количество элементов в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return autos.count+1
//            autos.count+1
        default:
            guard selectedIndex.row < autos.count else { return 0 }
            return autos[selectedIndex.row].services.count + 1
            
//            guard selectedIndex.row < autos.count else { return 0 }
//            return autos[selectedIndex.row].services.count + 1
        }
    }
    /// наполняем коллекцию данными
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            if  indexPath.row == autos.count {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellForAdd.reusableIdentifire, for: indexPath) as! CellForAdd
                cell.backgroundColor = Theme.currentTheme.backgroundColor
                cell.roundedWithShadow()
                return cell
                
            } else  {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellForAuto.reusableIdentifire, for: indexPath) as! CellForAuto
                let auto = autos[indexPath.row]
                cell.backgroundColor = cell.isSelected ? Theme.currentTheme.buttonColor : Theme.currentTheme.backgroundColor
                cell.roundedWithShadow()
                cell.autosName.text = auto.name
                cell.autosModel.text = auto.model
                cell.mileage.text = auto.mileage.description

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
                cell.tasksName.text = to.taskDescription
                    
                return cell
            }
        }
    }
    ///деалем переходы от ячеек
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == autos.count {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyboard.instantiateViewController(withIdentifier: "AddAutoVC") as? AddAutoVC else { return }
                vc.delegate = self
                navigationController?.pushViewController(vc, animated: true)
            } else {
                selectedIndex = indexPath
                collectionView.reloadSections(IndexSet(integer: 1))
            }
        } else {
            ///заменить сонтрроллер
            if indexPath.row == 0 {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyboard.instantiateViewController(withIdentifier: "AddService") as? AddService else { return }
                vc.delegate = self
                vc.currentAuto = autos[selectedIndex.row]
                navigationController?.pushViewController(vc, animated: true)
            } else {
                
            }
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
    ///настраиваем лаяуты
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
        
       ///Зарегистрироваи заголовок для секции
        collectionView.register(SectionsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionsHeader.reuserID)

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

extension NewHomePage: AddAutoVCDelegate {
    
    func addAuto(_ model: AutoModel) {
        self.autos.append(model)
        self.selectedIndex = IndexPath(item: self.autos.firstIndex(where: { $0.id == model.id }) ?? 0, section: 0) 
        self.collectionView.reloadData()
    }
}

extension NewHomePage: AddServiceDelagate {
    func addTO(_ model: ServiceModel) {
        self.autos[selectedIndex.row].services.append(model)
        self.collectionView.reloadData()
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
