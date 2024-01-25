//
//  File.swift
//  garage
//
//  Created by Apple on 3.01.24.
//

import UIKit

struct AutoModel {
    private let id: UUID = UUID()
    var name: String //сделать из перечисления
    var model: String
    var modification: Modification
    var number: String
    var vin: String
    var services: [ServiceModel] = []
    
   static func fetchAuto() -> [AutoModel] {
       var firstItem = AutoModel(name: "BMW", model: "A5", modification: Modification(engine: "DISEL", volume: 3.0, transmission: "АКПП", driveUnit: "полный", mileage: 2300, yearOfManufacture: 2020), number: "44444As", vin: "12345HDB12I373")
       
       let to = ServiceModel.fetchService()
       firstItem.services = to
       
       let secondItem = AutoModel(name: "Audi", model: "A5", modification: Modification(engine: "DISEL", volume: 3.0, transmission: "АКПП", driveUnit: "полный", mileage: 23400, yearOfManufacture: 2020), number: "44444As", vin: "12345HDB12I373")
       
       return [firstItem, secondItem]
    }
}

struct Modification {
    var engine: String //сделать из перечисления
    var volume: Double //ограничить знаками после запятой
    var transmission: String //сделать из перечисления
    var driveUnit: String //сделать из перечисления
    var mileage: Int
    var yearOfManufacture: Int //сделать из перечисления
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

