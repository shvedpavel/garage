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
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString,
         taskDescription: String,
         mileage: Int? = nil,
         dedline: Date? = nil,
         isCompleted: Bool
    ) {
        self.id = id
        self.taskDescription = taskDescription
        self.mileage = mileage
        self.dedline = dedline
        self.isCompleted = isCompleted
    }
    
    /// для получения данных из FB и дальнейшего создания из  низ объекта
    init?(snapshot: DataSnapshot) {
        guard let snapshotValue = snapshot.value as? [String: Any],
              let taskDescription = snapshotValue[Constants.taskDescriptionKey] as? String,
              let mileage = snapshotValue[Constants.mileageKey] as? Int,
              let dedline = snapshotValue[Constants.dedlineKey] as? Date,
              let isCompleted = snapshotValue[Constants.isCompleted] as? Bool
            else { return nil }
        self.id = snapshot.key
        self.taskDescription = taskDescription
        self.mileage = mileage
        self.dedline = dedline
        self.isCompleted = isCompleted
    }
    
    func convertToDictionary() -> [String: Any?] {
        return [
            Constants.dedlineKey: dedline?.toString() ?? nil,
            Constants.mileageKey: mileage ?? nil,
            Constants.taskDescriptionKey: taskDescription,
            Constants.isCompleted: isCompleted
        ]
    }
    
     enum Constants {
        static let taskDescriptionKey = "taskDescription"
        static let mileageKey = "mileage"
        static let dedlineKey = "dedline"
        static let isCompleted = "isCompleted"
    }
}
