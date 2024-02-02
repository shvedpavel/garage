//
//  AddService.swift
//  garage
//
//  Created by Apple on 30.01.24.
//

import Foundation
import Firebase
import FirebaseDatabase

protocol AddServiceDelagate: AnyObject {
    
    func addTO(_ model: ServiceModel)
}

class AddService: UIViewController {
    
    // MARK: - Properties
    weak var delegate: AddServiceDelagate?
    var currentAuto: AutoModel!
    private let service: AutoService = AutoServiceImpl.shader
   
    @IBOutlet weak var workDescriptionLbl: UILabel!
    @IBOutlet weak var serviceDedlineLbl: UILabel!
    @IBOutlet weak var serviseMileageLbl: UILabel!
    
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var serviceDedlineTF: UITextField!
    @IBOutlet weak var serviceMileageTF: UITextField!
    @IBOutlet weak var save: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        title = "Добавить напоминание"
    }
    
    // MARK: - Actions
    @IBAction func saveBtn(_ sender: UIButton) {
        guard let description = descriptionTF.text,
              let serviceDedline = serviceDedlineTF.text,
              let serviceMileage = serviceMileageTF.text
        else { return }
        
        let model = ServiceModel(taskDescription: description, mileage: Int(serviceMileage)) // TODO: add date
        
        service.registerTO(currentAuto.id, model, callback: { [weak self] result in
            switch result {
            case .success(let to):
                self?.delegate?.addTO(to)
                self?.navigationController?.popViewController(animated: true)
            case .failure:
                print("auto not added")
            }
        })
    }
    // MARK: - Private functions
    private func applyTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        workDescriptionLbl.textColor = Theme.currentTheme.textColor
        serviseMileageLbl.textColor = Theme.currentTheme.textColor
        serviceDedlineLbl.textColor = Theme.currentTheme.textColor
        save.tintColor = Theme.currentTheme.buttonColor
    }
}
