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
}

struct ContentView: View {

    var body: some View {
        
        VStack {
    
            Button("Request ermission") {
                <#code#>
            }
        }
    }
}

#Preview {
    ContentView()
}
