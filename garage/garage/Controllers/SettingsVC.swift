//
//  SettingsVC.swift
//  garage
//
//  Created by Apple on 29.11.23.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsVC: UIViewController {
    //создаем слабую ссылку на протокол
    weak var delegate: NewHomePageDelegate?

    var mileageVariation: String = ""
    
    @IBOutlet weak var measuringSystemLbl: UILabel!
   
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
    }

    @IBAction func segmentedController(_ sender: UISegmentedControl) {
        guard let  mileageV = sender.titleForSegment(at: sender.selectedSegmentIndex)
        else {return}
        delegate?.update(text: mileageV)
        print(mileageV)
    }
    
    // MARK: - Private functions
    private func applyTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        measuringSystemLbl.textColor = Theme.currentTheme.textColor
        segmentController.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Apple SD Gothic Neo Regular", size: 12)!,
                                                  NSAttributedString.Key.foregroundColor: Theme.currentTheme.textColorSecondary], for: .normal)
        segmentController.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Apple SD Gothic Neo Regular", size: 15)!,
                                                  NSAttributedString.Key.foregroundColor: Theme.currentTheme.backgroundColor], for: .selected)
    }

}
