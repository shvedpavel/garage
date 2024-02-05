//
//  Notifications.swift
//  garage
//
//  Created by Apple on 5.02.24.
//

import UIKit
import UserNotifications

class Notifications: NSObject, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    override init() {
        super.init()
        requestAutorization()
        notificationCenter.delegate = self
        
    }
    // MARK: - проверяем настройка доступа к уведомлениям
    func requestAutorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            
            print("Permission granted: \(granted)")
            
            if granted {
                self.getNotificationSettings()
            } else {
                // открыть настройки уведомлений в телефоне
                if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                    DispatchQueue.main.async {
                        UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
                    }
                }
            }
        }
    }
    // MARK: - метод для получения информации по настройкам уведомлений
    func getNotificationSettings() {
        notificationCenter.getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
        }
    }
    
    // MARK: - метод отвечает за созжание и управление уведомлением
    func scheduleNotification(notificationType: String) {
        
        let content = UNMutableNotificationContent() // содержание для уведомления.
        let userAction = "User Action"
        
        content.title = notificationType
        content.subtitle = "subtitle"
        content.body = "This is example how to create " + notificationType
        content.sound = UNNotificationSound.default
        content.badge = 1
        /// кастомные экшены
//        content.categoryIdentifier = userAction
        
        // создаем уведомление по времени
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        // каждому запросу нужен identifire
        let identifire = "Local Notification"
        // запрос
        let request = UNNotificationRequest(identifier: identifire,
                                            content: content,
                                            trigger: trigger)
        
        // если нужно несколько - используйте уникальный identifire
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }

}
