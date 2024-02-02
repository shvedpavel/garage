//
//  AddAutoVC.swift
//  garage
//
//  Created by Apple on 29.01.24.
//

import Foundation
import Firebase
import FirebaseDatabase

protocol AddAutoVCDelegate: AnyObject {
    func addAuto(_ model: AutoModel)
}

class AddAutoVC: UIViewController {
   
    // MARK: -Properties
    private let service: AutoService = AutoServiceImpl.shader
    private var user: User!
    weak var delegate: AddAutoVCDelegate?

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var modelTF: UITextField!
    @IBOutlet weak var mileageTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var vinTF: UITextField!
    @IBOutlet weak var motorTypeTF: UITextField!
    @IBOutlet weak var motorVolumeTF: UITextField!
    @IBOutlet weak var yearOfProductionTF: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        title = "Добавить авто"
    }
    
    @IBAction func saveAutoBtn(_ sender: UIButton) {
        guard let autoName = nameTF.text,
              let autoModel = modelTF.text,
              let mileage = Int(mileageTF.text ?? "33"),
              let number = numberTF.text,
              let vin = vinTF.text,
              let motorType = motorTypeTF.text,
              let motorVolume =  Double(motorVolumeTF.text ?? "ytyt"),
              let yearOfProduction = Int(yearOfProductionTF.text ?? "ytyt")
    ///дополнить проврками
        else { return }
        ///создаем авто
        let newAuto = AutoModel(
            name: autoName,
            model: autoModel,
            number: number,
            vin: vin,
            motorVolume: motorVolume,
            motorType: motorType,
            mileage: mileage,
            yearOfProduction: yearOfProduction,
            services: []
        )
        ///отправляем в БД
        service.registerAuto(newAuto) { [weak self] result in
            switch result {
            case .success(let auto):
                self?.delegate?.addAuto(auto)
                self?.navigationController?.popViewController(animated: true)
            case .failure:
                print("auto not added")
            }
        }
    }
    
     // MARK: - Private functions
    private func applyTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        saveBtn.tintColor = Theme.currentTheme.buttonColor
    }
}
