//
//  HomePageVC.swift
//  garage
//
//  Created by Apple on 28.11.23.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        let buttonCellAutoNib = UINib(nibName: "ButtonCellAuto", bundle: nil)
        collectionView.register(buttonCellAutoNib, forCellWithReuseIdentifier: "ButtonCellAuto")
        

        
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
extension HomePageVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCellAuto", for: indexPath) as! ButtonCellAuto
    return cell
    }
    
    
}
