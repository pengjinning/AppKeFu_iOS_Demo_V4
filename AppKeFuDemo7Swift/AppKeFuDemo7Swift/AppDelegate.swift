//
//  AppDelegate.swift
//  AppKeFuDemo7Swift
//
//  Created by jack on 16/8/5.
//  Copyright © 2016年 appkefu.com. All rights reserved.
//

import UIKit

/*
 此appkey为演示所用，请确保应用在上线之前，到http://admin.appkefu.com/AppKeFu/admin/index.php，申请自己的appkey
 */
let APP_KEY = "6f8103225b6ca0cfec048ecc8702dbce"


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: KFNavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // Bar's background color
        UINavigationBar.appearance().barTintColor = UIColorFromRGB(0x067AB5)
        // Back button and such
        UINavigationBar.appearance().tintColor = UIColor.white
        //
        let viewController = ViewController()
        self.navigationController = KFNavigationController(rootViewController: viewController)
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
        
        AppKeFuLib.sharedInstance().login(withAppkey: APP_KEY)
        
        //
        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)
        UIApplication.shared.registerForRemoteNotifications()
        
        return true
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        AppKeFuLib.sharedInstance().uploadDeviceToken(deviceToken)
    }
    
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        
        /*
         {
            aps =     {
                alert = "客服消息:555";
                badge = 1;
                sound = default;
            };
            channel = appkefu;
            message = 555;
            workgroup = wgdemo;
         }
         */
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    /*
     */
    func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}

