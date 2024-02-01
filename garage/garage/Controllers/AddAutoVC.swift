//
//  AddAutoVC.swift
//  garage
//
//  Created by Apple on 29.01.24.
//

import Foundation
import Firebase
import FirebaseDatabase


class AddAutoVC: UIViewController {
    
    
    // MARK: -Properties
    private var user: User!
    private var  autos: AutosSingltonClass? = AutosSingltonClass.shared
//    private var  autos = [AutoModel]()
    var ref: DatabaseReference!

    
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
        ///находим пользователя(переделать на ID)
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        ref = Database.database().reference(withPath: "users").child(user.uid).child("autos")
        
//        func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//            //добавляем наблюдение за добавлением нового авто (за катугорией autos)
//            ref.observe(.value) { [weak self] snapshot in
//               
//                var autos = AutosSingltonClass.shared
////                var autos = [AutoModel]()
//                for item in snapshot.children {
//                    guard let snapshot = item as? DataSnapshot,
//                          let newAuto = AutoModel(snapshot: snapshot) else { return }
//                    
//                    autos.autos.append(newAuto)
//                }
//            //добавляем в массив новые даные
//               
//                self?.autos = autos
//            //обносление коллекции??
//                print(autos)
//            }
//        }
        
        
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
        let uid = user.uid
        ///создаем авто
        let newAuto = AutoModel(name: autoName, model: autoModel, number: number, vin: vin, motorVolume: motorVolume, motorType: motorType, mileage: mileage, yearOfProduction: yearOfProduction)
        //создаем ссылку на авто(pfvtybnm yf id auto)
        let autoRef = ref.child(newAuto.name.lowercased())
        //отправляем на сервер
        autoRef.setValue(newAuto.convertToDictionary())
        
        navigationController?.popViewController(animated: true)
    }
    

     // MARK: - Private functions
    private func applyTheme() {
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        saveBtn.tintColor = Theme.currentTheme.buttonColor
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
