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
    func update(_ model: ServiceModel, for index: Int)
    func deleteTO(index: Int)
    
}

class AddService: UIViewController {
    
    // MARK: - Properties
    weak var delegate: AddServiceDelagate?
    var currentAuto: AutoModel!
    var selectedIndex: Int?
    
    private var currentService: ServiceModel? {
        didSet {
            descriptionTF.text = currentService?.taskDescription
            serviceDedlineTF.text = currentService?.dedline?.toString()
            serviceMileageTF.text = String(currentService?.mileage ?? 0)
        }
    }
    
    private let service: AutoService = AutoServiceImpl.shader
    
   
    @IBOutlet weak var workDescriptionLbl: UILabel!
    @IBOutlet weak var serviceDedlineLbl: UILabel!
    @IBOutlet weak var serviseMileageLbl: UILabel!
    
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var serviceDedlineTF: UITextField!
    @IBOutlet weak var serviceMileageTF: UITextField!
    @IBOutlet weak var save: UIButton!
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkService()
        
        
        
        applyTheme()
        title = "Добавить напоминание"
    }
    
    // MARK: - Actions
    @IBAction func button(_ sender: UIButton) {
        guard let description = descriptionTF.text,
              let serviceDedline = serviceDedlineTF.text,
              let serviceMileage = serviceMileageTF.text
        else { return }
        
        if var currentService = currentService {
            currentService.taskDescription = descriptionTF?.text ?? ""
            guard let date = serviceDedlineTF.text?.toDate() else { return }
            currentService.dedline = date
            currentService.mileage = Int(serviceMileageTF.text ?? "")
            
            updateService(model: currentService)
        } else {
            let model = ServiceModel(taskDescription: description, mileage: Int(serviceMileage)) // TODO: add date
            addService(model: model)
        }
    }
    
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: "Удалить напоминание?", preferredStyle: .alert)
        ///action 1
        let delete = UIAlertAction(title: "Удалить", style: .default) { [weak self] _ in
            
            if let currentService = self?.currentService {
                self?.deleteService(model: currentService)
            } else { return }
            
            
    
            self?.navigationController?.popViewController(animated: true)
        }
        ///action 2
        let cancel = UIAlertAction(title: "Отмена", style: .default) { [weak self] _ in
        }
        alertController.addAction(delete)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    
    // MARK: - Private functions
    
    //add new service
    func addService(model: ServiceModel) {
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
    
    //update service
    func updateService(model: ServiceModel) {
        service.chengeService(currentAuto.id, model, callback: { [weak self] result in
            switch result {
            case .success():
                self?.delegate?.update(model, for: self?.selectedIndex ?? 0)
                self?.navigationController?.popViewController(animated: true)
            case .failure:
                print("service not update")
            }
        })
    }
    
    
    func deleteService(model: ServiceModel) {
        
        service.deleteService(currentAuto.id, model, callback: { [ weak self] result in
            switch result {
            case .success():
                self?.delegate?.deleteTO(index: self?.selectedIndex ?? 0)
                self?.navigationController?.popViewController(animated: true)
            case .failure:
                print("service not deleted")
            }
        })
        
//        service.deleteService(currentAuto.id, model, callback: { [weak self] result in
//            switch result {
//            case .success():
//                self?.delegate?.update(model, for: self?.selectedIndex ?? 0)
//                self?.navigationController?.popViewController(animated: true)
//            case .failure:
//                print("service not deleted")
//            }
//        })
    
    }
    
    
    func checkService() {
        if let selectedIndex = selectedIndex {
            currentService = currentAuto.services[selectedIndex]
            save.setTitle("Изменить", for: .normal)
            deleteBtn.isHidden = false
        }
    }
   
    private func applyTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        workDescriptionLbl.textColor = Theme.currentTheme.textColor
        serviseMileageLbl.textColor = Theme.currentTheme.textColor
        serviceDedlineLbl.textColor = Theme.currentTheme.textColor
        save.tintColor = Theme.currentTheme.buttonColor
        deleteBtn.tintColor = Theme.currentTheme.buttonColor
    }
}
