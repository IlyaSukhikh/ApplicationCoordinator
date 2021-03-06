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

    private lazy var applicationCoordinator: Coordinator = {
        let tabbarFlowOutput = self.window!.rootViewController as! TabbarFlowOutput
        return ApplicationCoordinator(tabbarFlowOutput: tabbarFlowOutput,
                                      coordinatorFactory: CoordinatorFactoryImp())
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        applicationCoordinator.start()
        return true
    }
}

