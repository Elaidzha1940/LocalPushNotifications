//  /*
//
//  Project: LocalPushNotifications
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 02.10.2023
//
//  */

import SwiftUI
import UserNotifications

class NotificationManager {
    
    static let instance = NotificationManager() //Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error)  in
            if let error = error {
                print("Error \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func schedulNotification () {
        
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.subtitle = "It was easy "
        content.sound = .default
        content.badge = 1
        
        // MARK: Time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        //MARK: Calendar
        
        //MARK: Location
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            
            Button("Request ermission") {
                NotificationManager.instance.requestAuthorization()
            }
            
            Button("S chedul Notification") {
                NotificationManager.instance.requestAuthorization()
            }

        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
