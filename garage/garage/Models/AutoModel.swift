//
//  File.swift
//  garage
//
//  Created by Apple on 3.01.24.
//

import UIKit
import Firebase

struct AutoModel {
    private let id: UUID = UUID()
    var name: String //сделать из перечисления
    var model: String
    var number: String
    var vin: String
    var motorVolume: Double //ограничить знаками после запятой
    var motorType: String //сделать из перечисления
    var mileage: Int
    var yearOfProduction: Int //сделать из перечисления
    var services: [ServiceModel] = []
    let ref: DatabaseReference!
    
   static func fetchAuto() -> [AutoModel] {
      
       var firstItem = AutoModel(name: "BMW", model: "X5", number: "A5564", vin: "A52344454545345", motorVolume: 3.0, motorType: "дизель", mileage: 234000, yearOfProduction: 2019)
       
       let to = ServiceModel.fetchService()
       firstItem.services = to
       
       let secondItem = AutoModel(name: "Audi", model: "A5", number: "A545ff4", vin: "A52344454545345", motorVolume: 3.0, motorType: "дизель", mileage: 200000, yearOfProduction: 2020)
       
       return [firstItem, secondItem]
    }
    
    init(name: String, model: String, number: String, vin: String, motorVolume: Double, motorType: String, mileage: Int, yearOfProduction: Int) {
        self.name = name
        self.model = model
        self.number = number
        self.vin = vin
        self.motorVolume = motorVolume
        self.motorType = motorType
        self.mileage = mileage
        self.yearOfProduction = yearOfProduction
        self.ref = nil
    }
    

    
    /// для получения данных из FB и дальнейшего создания из  низ объекта
    init?(snapshot: DataSnapshot) {
        guard let snapshotValue = snapshot.value as? [String: Any],
              let name = snapshotValue[Constants.nameKey] as? String,
              let model = snapshotValue[Constants.modelKey] as? String,
              let number = snapshotValue[Constants.numberKey] as? String,
              let vin = snapshotValue[Constants.vinKey] as? String,
              let motorVolume = snapshotValue[Constants.motorVolumeKey] as? Double,
              let motorType = snapshotValue[Constants.motorTypeKey] as? String,
              let mileage = snapshotValue[Constants.mileageKey] as? Int,
              let yearOfProduction = snapshotValue[Constants.yearOfProductionKey] as? Int
            else { return nil }
        self.name = name
        self.model = model
        self.number = number
        self.vin = vin
        self.motorVolume = motorVolume
        self.motorType = motorType
        self.mileage = mileage
        self.yearOfProduction = yearOfProduction
        self.ref = snapshot.ref
    }
    
    func convertToDictionary() -> [String: Any] {
        [Constants.nameKey: name,
         Constants.modelKey: model,
         Constants.numberKey: number,
         Constants.vinKey: vin,
         Constants.motorVolumeKey: motorVolume,
         Constants.motorTypeKey: motorType,
         Constants.mileageKey: mileage,
         Constants.yearOfProductionKey: yearOfProduction]
    }
    
    private enum Constants {
        static let nameKey = "name"
        static let modelKey = "model"
        static let numberKey = "number"
        static let vinKey = "vin"
        static let motorVolumeKey = "motorVolume"
        static let motorTypeKey = "motorType"
        static let mileageKey = "mileage"
        static let yearOfProductionKey = "yearOfProduction"
    }
}

//настроиваем растояние по краям collectionView
struct Constans {
    static let leftDistanceToView: CGFloat = 16
    static let rightDistanceToView: CGFloat = 16
    static let galleryMinimumLineSpace: CGFloat = 3
    static let heightGalleryCollectionView: CGFloat = 120
    static let shadowRadius: CGFloat = 5
    static let topAnchorForView: CGFloat = 8
    // дополнить размером BarButtonItem
    //заменить на данные величины размеры отступов на главном экране
    static let heightServiceCollectionView = {UIScreen.main.bounds.height - Constans.shadowRadius * 2 - Constans.topAnchorForView * 2 - 360}
    
    
}

class AutosSingltonClass {
   
    static var shared = AutosSingltonClass()
    
    private init() {}
    
     var autos: [AutoModel] = []
    
    
}
    
    
//

