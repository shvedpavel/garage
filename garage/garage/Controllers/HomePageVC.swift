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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        
        //добавляем galleryCollectionView на экран
        view.addSubview(galleryCollectionView)
        
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 10).isActive = true
        
        galleryCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        galleryCollectionView.widthAnchor.constraint(equalToConstant: 220).isActive = true

        
        
        
        
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

