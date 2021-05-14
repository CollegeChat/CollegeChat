//
//  SceneDelegate.swift
//  CollegeChat
//
//  Created by Anshul Jha on 4/16/21.
//

import UIKit
import Parse

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        //Below is the stay logged in functionality, I just put it for student scene because current now accountType is student
        if PFUser.current() != nil {
            let main = UIStoryboard(name: "Main", bundle: nil)
//            let studentController = main.instantiateViewController(withIdentifier: "StudnetController")
//            window?.rootViewController = studentController
            let user = PFUser.current()
        
        
            let accountType = user!["accountType"] as? String
            if(accountType == "App Admin") {

                let appAdminController = main.instantiateViewController(withIdentifier: "AppAdminController")
                window?.rootViewController = appAdminController

            }else if accountType == "College Admin" {
                let collegeAdminController = main.instantiateViewController(withIdentifier: "CollegeAdminController")
                window?.rootViewController = collegeAdminController
            } else if accountType == "Instructor" {

                let instructorController = main.instantiateViewController(withIdentifier: "InstructorController")
                window?.rootViewController = instructorController

            } else if accountType == "Student" {

                let studentController = main.instantiateViewController(withIdentifier: "StudentController")
                window?.rootViewController = studentController
            }
        }
            
        }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
