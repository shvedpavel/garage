//
//  HomePageVC.swift
//  garage
//
//  Created by Apple on 28.11.23.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet weak var deliveryLabel: UILabel!
    
    
    private var galleryCollectionView = GalleryCollectionView()
    private var serviceCollectionView = ServiceCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        //добавляем collectionViews на экран
        view.addSubview(galleryCollectionView)
        view.addSubview(serviceCollectionView)
        
        
        //устанавливаем констрейнты для collectionViews
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 10).isActive = true
        // тут меняет высоту всей коллекции
        galleryCollectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
//        galleryCollectionView.widthAnchor.constraint(equalToConstant: 220).isActive = true
        
        
        // скорретировать констрейнты!!!!!!!!
        
        serviceCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        serviceCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        serviceCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        
        
        // тут меняет высоту всей коллекции
        serviceCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        
        
        
        //заполняем collectionViews данными
        galleryCollectionView.set(cells: AutoModel.fetchAuto())
        serviceCollectionView.set(cells: ServiceModel.fetchService())

        
        
        
        
        // MARK: - Private functions
        func applyTheme() {
            self.view.backgroundColor = Theme.currentTheme.backgroundColor
            
        }
        
         
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

