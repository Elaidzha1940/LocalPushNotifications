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
import CoreLocation

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
    
    func scheduleNotification () {
        
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.subtitle = "It was easy "
        content.sound = .default
        content.badge = 1
        
        // MARK: Time
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        //MARK: Calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 19
//        dateComponents.minute = 21
//        dateComponents.weekday = 2
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //MARK: Location
        let coordinates = CLLocationCoordinate2D(
            latitude: 20.00 ,
            longitude: 70.00)
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 50,
            identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct ContentView: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Button("Request Permission") {
                NotificationManager.instance.requestAuthorization()
            }
            
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleNotification()
            }
            
            Button("Cancel Notification") {
                NotificationManager.instance.cancelNotification()
            }
        }
        .buttonStyle(.bordered)
        .foregroundColor(.white)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
