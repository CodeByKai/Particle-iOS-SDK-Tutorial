//
//  ViewController.swift
//  Particle-Tutorial
//
//  Created by Kai Perez on 2/2/17.
//  This code is intended for learning purposes and is free to use and share 
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordLoginTextField: UITextField!
    
    @IBOutlet weak var emailLoginTextField: UITextField!
    
    @IBAction func loginToParticleServerButton(_ sender: Any) {
        let email = emailLoginTextField.text
        let password = passwordLoginTextField.text
        
        SparkCloud.sharedInstance().login(withUser: email!, password: password!) { (error:Error?) -> Void in
            if error != nil {
                print("Wrong credentials or no internet connectivity, please try again")
            }
            else {
                //print("Logged in")
                self.performSegue(withIdentifier: "GoToDevicesListTableViewControllerSegue", sender: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

