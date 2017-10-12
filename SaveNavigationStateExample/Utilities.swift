//
//  Utilities.swift
//  SaveNavigationStateExample
//
//  Created by Varun Naharia on 02/02/17.
//  Copyright © 2017 TechNaharia. All rights reserved.
//

import Foundation
import UIKit

private var _screenHeight = UIScreen.main.bounds.height
private var _screenSize = UIScreen.main.bounds
private var _screenWidth = UIScreen.main.bounds.width
private var _screenCenterX = UIScreen.main.bounds.width/2
private var _screenCenterY = UIScreen.main.bounds.height/2

class Utilities {
    
    public class var screenHeight: CGFloat
    {
        get { return _screenHeight }
        set { _screenHeight = newValue }
    }
    
    public class var screenSize: CGRect
    {
        get { return _screenSize }
        set { _screenSize = newValue }
    }
    
    public class var screenWidth: CGFloat
    {
        get { return _screenWidth }
        set { _screenWidth = newValue }
    }
    
    public class var screenCenterX: CGFloat
        {
        get { return _screenCenterX }
        set { _screenCenterX = newValue }
    }
    
    public class var screenCenterY: CGFloat
        {
        get { return _screenCenterY }
        set { _screenCenterY = newValue }
    }
    
    public class func setStatusBarColor(color:UIColor, controller:UIViewController){
        let viewBG = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 20.0))
        viewBG.backgroundColor = color
        controller.navigationController?.view.addSubview(viewBG)
    }
    
    class func setUserDefault(ObjectToSave : AnyObject?  , KeyToSave : String)
    {
        let defaults = UserDefaults.standard
        
        if (ObjectToSave != nil)
        {
            let data = NSKeyedArchiver.archivedData(withRootObject: ObjectToSave!)
            defaults.set(data, forKey: KeyToSave)
        }
        
        UserDefaults.standard.synchronize()
    }
    
    class func getUserDefault(KeyToReturnValye : String) -> AnyObject?
    {
        let defaults = UserDefaults.standard
        
        if let name = defaults.value(forKey: KeyToReturnValye)
        {
            let data = NSKeyedUnarchiver.unarchiveObject(with: name as! Data)
            return data as AnyObject
        }
        return nil
    }
    
    class func removetUserDefault(KeyToRemove : String)
    {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: KeyToRemove)
        UserDefaults.standard.synchronize()
    }
    
    class func decideInitialViewController(window:UIWindow){
        var isNavigationStack = false
        if(getUserDefault(KeyToReturnValye: "isNavigationStackSaved") != nil)
        {
            isNavigationStack = getUserDefault(KeyToReturnValye: "isNavigationStackSaved") as! Bool
        }
        if(isNavigationStack == true)
        {
            let nav = getUserDefault(KeyToReturnValye: "Navigation") as! UINavigationController
            window.rootViewController = nav
            window.makeKeyAndVisible()
        }
        else
        {
            Utilities.setHomeAsInitialViewContoller(window: window)
        }
        
    }
    
    class func setHomeAsInitialViewContoller(window:UIWindow) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nav:UINavigationController = mainStoryboard.instantiateViewController(withIdentifier: "Nav") as! UINavigationController
//        let homeViewController: ViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        nav.viewControllers.append(homeViewController)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
    
    class func setTwoViewControllerAsInitialViewContoller(window:UIWindow) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nav:UINavigationController = mainStoryboard.instantiateViewController(withIdentifier: "Nav") as! UINavigationController
        
//        let homeViewController: ViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let twoViewController: TwoViewController = mainStoryboard.instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController
//        nav.viewControllers.append(homeViewController)
        nav.viewControllers.append(twoViewController)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
    
    class func setThreeViewControllerAsInitialViewContoller(window:UIWindow) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nav:UINavigationController = UINavigationController()
        
        let homeViewController: ViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let twoViewController: TwoViewController = mainStoryboard.instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController
        let threeViewController: ThreeViewController = mainStoryboard.instantiateViewController(withIdentifier: "ThreeViewController") as! ThreeViewController
        nav.viewControllers.append(homeViewController)
        nav.viewControllers.append(twoViewController)
        nav.viewControllers.append(threeViewController)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
    
    class func setFourViewControllerAsInitialViewContoller(window:UIWindow) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nav:UINavigationController = UINavigationController()
        let homeViewController: ViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let twoViewController: TwoViewController = mainStoryboard.instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController
        let threeViewController: ThreeViewController = mainStoryboard.instantiateViewController(withIdentifier: "ThreeViewController") as! ThreeViewController
        let fourViewController: FourViewController = mainStoryboard.instantiateViewController(withIdentifier: "FourViewController") as! FourViewController
        nav.viewControllers.append(homeViewController)
        nav.viewControllers.append(twoViewController)
        nav.viewControllers.append(threeViewController)
        nav.viewControllers.append(fourViewController)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
    
}
