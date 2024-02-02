//
//  AutoService.swift
//  garage
//
//  Created by Apple on 2.02.24.
//

import Foundation
import Firebase
import FirebaseAuth

protocol AutoService: AnyObject {
    func fetchAutos(callback: @escaping (Result<[AutoModel], AutoServiceError>) -> Void)
    func registerAuto(_ model: AutoModel, callback: @escaping (Result<AutoModel, AutoServiceError>) -> Void)
    func registerTO(_ autoId: String, _ model: ServiceModel, callback: @escaping (Result<ServiceModel, AutoServiceError>) -> Void)
}

class AutoServiceImpl: AutoService {
    
    static let shader: AutoServiceImpl = AutoServiceImpl()
    
    private init() {}
    
    func fetchAutos(callback: @escaping (Result<[AutoModel], AutoServiceError>) -> Void) {
        
        guard let user = Auth.auth().currentUser else { return }
        
        Database.database().reference(withPath: "users").child(user.uid).child("autos").getData { error, snapshot in
            if let error = error {
                callback(.failure(.serverError))
            } else {
                var autos: [AutoModel] = []
                
                guard let snapshot = snapshot else {
                    callback(.failure(.serverError))
                    return
                }
                
                for item in snapshot.children {
                    guard let snapshot = item as? DataSnapshot,
                          let newAuto = AutoModel(snapshot: snapshot) else {
                        callback(.failure(.serverError))
                        return  }
                    autos.append(newAuto)
                }
                
                callback(.success(autos))
            }
        }
    }
    
    func registerAuto(_ model: AutoModel, callback: @escaping (Result<AutoModel, AutoServiceError>) -> Void) {
        
        guard let user = Auth.auth().currentUser else { return }
        let autosReference = Database.database().reference(withPath: "users").child(user.uid).child("autos")
        //создаем ссылку на авто(pfvtybnm yf id auto)
        let autoRef = autosReference.child(model.id)
        //отправляем на сервер
        autoRef.setValue(model.convertToDictionary()) { (error, ref) in
            if let _ = error {
                callback(.failure(.errorAddAuto))
            } else {
                callback(.success(model))
            }
        }
    }
    
    func registerTO(_ autoId: String, _ model: ServiceModel,  callback: @escaping (Result<ServiceModel, AutoServiceError>) -> Void) {
        guard let user = Auth.auth().currentUser else { return }
        let autosReference = Database.database().reference(withPath: "users").child(user.uid).child("autos").child(autoId).child("services")
        
        let serviceRef = autosReference.child(model.id)
        //отправляем на сервер
        serviceRef.setValue(model.convertToDictionary()) { (error, ref) in
            if let _ = error {
                callback(.failure(.errorAddAuto))
            } else {
                callback(.success(model))
            }
        }
    }
}

enum AutoServiceError: Error {
    case serverError
    case errorAddAuto
    
    var title: String {
        switch self {
        case .serverError:
            return "Ошибка сервера"
        case .errorAddAuto:
            return "Ошибка регистрации авто"
        }
    }
}
