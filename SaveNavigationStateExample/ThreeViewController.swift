//
//  ThreeViewController.swift
//  SaveNavigationStateExample
//
//  Created by Varun Naharia on 04/10/17.
//  Copyright © 2017 Varun Naharia. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.setUserDefault(ObjectToSave: self.navigationController, KeyToSave: "Navigation")
        Utilities.setUserDefault(ObjectToSave: true as AnyObject, KeyToSave: "isNavigationStackSaved")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FourViewController") as! FourViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func gotoOne(_ sender: UIButton) {
        self.navigationController?.popTo(controllerToPop: ViewController())
    }
    @IBAction func gotoTwoAction(_ sender: UIButton) {
        self.navigationController?.popTo(controllerToPop: TwoViewController())
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
