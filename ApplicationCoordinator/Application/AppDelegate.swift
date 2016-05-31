//
//  AppDelegate.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var applicationCoordinator: ApplicationCoordinator = {
        return ApplicationCoordinator(tabbarFlowOutput: self.window!.rootViewController as! TabbarFlowOutput,
                                      coordinatorFactory: CoordinatorFactoryImp())
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        applicationCoordinator.start()
        registerNotification()
        return true
    }
    
    func scheduleNotification() {
        
        if UIApplication.sharedApplication().scheduledLocalNotifications?.count == 0 {
            
            let notification = UILocalNotification()
            notification.alertBody = "Hey! Update your counter ;)"
            notification.fireDate = NSDate()
            notification.category = "wef"
            notification.repeatInterval = NSCalendarUnit.Minute
            
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
        }
    }
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        scheduleNotification()
    }
    
    // Register notification settings
    func registerNotification() {
        
        let counterCategory = UIMutableUserNotificationCategory()
        counterCategory.identifier = "sfwef"
        
        let types: UIUserNotificationType = [UIUserNotificationType.Alert, UIUserNotificationType.Sound]
        let settings = UIUserNotificationSettings(forTypes: types, categories: NSSet(object: counterCategory) as? Set<UIUserNotificationCategory>)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }

}

