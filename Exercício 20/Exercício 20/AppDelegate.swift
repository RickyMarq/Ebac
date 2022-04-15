//
//  AppDelegate.swift
//  Exercício 20
//
//  Created by Henrique Marques on 15/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        firstLauchApp()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func firstLauchApp() {
        if UserDefaults.standard.bool(forKey: "FoiIniciadaAntes") {
            print("==> O App já foi iniciado antes")
        } else {
            print("==> O app iniciou pela primeira vez")
            UserDefaults.standard.set(true, forKey: "FoiIniciadaAntes")
            UserDefaults.standard.set(false, forKey: "isNight")
        }
    }
}

