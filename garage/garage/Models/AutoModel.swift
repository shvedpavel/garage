//
//  File.swift
//  garage
//
//  Created by Apple on 3.01.24.
//

import UIKit

struct AutoModel {
    var name: String //сделать из перечисления
    var model: String
    var modification: Modification
    var number: String
    var vin: String
}

struct Modification {
    var engine: String //сделать из перечисления
    var volume: Double //ограничить знаками после запятой
    var transmission: String //сделать из перечисления
    var driveUnit: String //сделать из перечисления
    var mileage: Int
    var yearOfManufacture: Int //сделать из перечисления
}
