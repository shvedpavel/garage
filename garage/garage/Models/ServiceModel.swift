//
//  ServiceModel.swift
//  garage
//
//  Created by Apple on 5.01.24.
//

import Foundation
import Firebase
import FirebaseDatabase

struct ServiceModel {
//    var taskName: String
    var id: String
    var taskDescription: String
    var mileage: Int?
    var dedline: Date?
    
    init(id: String = UUID().uuidString, taskDescription: String, mileage: Int? = nil, dedline: Date? = nil) {
        self.id = id
        self.taskDescription = taskDescription
        self.mileage = mileage
        self.dedline = dedline
    }
    
    /// для получения данных из FB и дальнейшего создания из  низ объекта
    init?(snapshot: DataSnapshot) {
        guard let snapshotValue = snapshot.value as? [String: Any],
              let taskDescription = snapshotValue[Constants.taskDescriptionKey] as? String,
              let mileage = snapshotValue[Constants.mileageKey] as? Int,
              let dedline = snapshotValue[Constants.dedlineKey] as? Date
            else { return nil }
        self.id = snapshot.key
        self.taskDescription = taskDescription
        self.mileage = mileage
        self.dedline = dedline
    }
    
    func convertToDictionary() -> [String: Any?] {
        [Constants.dedlineKey: dedline?.toString() ?? nil,
         Constants.mileageKey: mileage ?? nil,
         Constants.taskDescriptionKey: taskDescription
        ]
    }
    
     enum Constants {
        static let taskDescriptionKey = "taskDescription"
        static let mileageKey = "mileage"
        static let dedlineKey = "dedline"
    }
}
