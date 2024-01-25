//
//  ServiceModel.swift
//  garage
//
//  Created by Apple on 5.01.24.
//

import UIKit

struct ServiceModel {
    var taskName: String
    var taskDescription: String?
    var mileage: Int?
    var date: Date?
    
    static func fetchService() -> [ServiceModel] {
        let firstItem = ServiceModel(taskName: "Продлить страховку")
        let secondItem = ServiceModel(taskName: "Замена масла")
        let thirdItem = ServiceModel(taskName: "Замена колес")
        let fourthItem = ServiceModel(taskName: "Плановое ТО")
        let fiftItem = ServiceModel(taskName: "Плановое ТО")
        let sixItem = ServiceModel(taskName: "Плановое ТО")
        let sevenItem = ServiceModel(taskName: "Плановое ТО")
        
        return [firstItem, secondItem, thirdItem, fourthItem, fiftItem, sixItem, sevenItem]
     }
}


