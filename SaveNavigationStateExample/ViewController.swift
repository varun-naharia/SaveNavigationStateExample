//
//  ViewController.swift
//  SaveNavigationStateExample
//
//  Created by Varun Naharia on 04/10/17.
//  Copyright © 2017 Varun Naharia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.setUserDefault(ObjectToSave: self.navigationController, KeyToSave: "Navigation")
        Utilities.setUserDefault(ObjectToSave: true as AnyObject, KeyToSave: "isNavigationStackSaved")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

