//
//  AppDelegate.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import UIKit
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: - Public Object
    
    public var baseUrl: String = "https://api.spacexdata.com/v4/"
    public var isTesting = (Bundle.main.infoDictionary?["isTesting"] as? Bool) ?? false
    
    let dateFormat = DateFormatter()
    let dataDateFormat = DateFormatter()
    
    //MARK: Constants
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpMaximumConnectionsPerHost = 80
        configuration.timeoutIntervalForRequest = 120
        return Session(configuration: configuration)
    }()

    
    //MARK: - Launching App
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // getFontFamily()
        
        dateFormat.dateFormat = "d MMM yyyy, HH:mm z"
        dateFormat.locale = Locale(identifier: "en")
        
        dataDateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dataDateFormat.locale = Locale(identifier: "en")
        
        return true
    }

    // MARK: - UISceneSession Lifecycle

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

    // MARK: - Alert
    
    func showAlert(vc: UIViewController? , titleTxt:String , msgTxt:String , btnTxt:String ){
        showAlert(vc: vc, titleTxt: titleTxt, msgTxt: msgTxt, btnTxt: btnTxt) { (isDone) in }
    }

    func showAlert(vc: UIViewController? , titleTxt:String , msgTxt:String , btnTxt:String, completionHandler: @escaping (_ isDone: Bool)-> Void ){
        let topWindow = UIWindow(frame: UIScreen.main.bounds)
        topWindow.rootViewController = UIViewController()
        topWindow.windowLevel = UIWindow.Level.alert + 1

        let alertController = UIAlertController(title: titleTxt, message: msgTxt , preferredStyle: UIAlertController.Style.alert)

        // Change Title With Color and Font:
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: titleTxt as String, attributes: [NSAttributedString.Key.font: getBoldLatoFont(size: 15) ])
        alertController.setValue(myMutableString, forKey: "attributedTitle")

        // Change Message With Color and Font
        var messageMutableString = NSMutableAttributedString()
        messageMutableString = NSMutableAttributedString(string: msgTxt as String, attributes: [NSAttributedString.Key.font: getLatoFont(size: 15)])
        alertController.setValue(messageMutableString, forKey: "attributedMessage")

        let okAction = UIAlertAction(title: btnTxt, style: UIAlertAction.Style.cancel){
            (result: UIAlertAction) -> Void in
            completionHandler(true)
        }
        
        alertController.addAction(okAction)
        alertController.view.tintColor = AppColors.mustard

        if(vc != nil){
            vc!.present(alertController, animated: true, completion: nil)
        }
        else {
            topWindow.makeKeyAndVisible()
            topWindow.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }

    func getFontFamily() {
        for family in UIFont.familyNames {
            print("Font Family: - \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("Font Names: - \(name)")
            }
        }
    }
    
}

