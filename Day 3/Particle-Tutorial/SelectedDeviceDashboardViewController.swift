//
//  SelectedDeviceDashboardViewController.swift
//  rasmussen
//
//  Created by Kai Perez on 2/4/17.
//  This code is intended for learning purposes and is free to use and share 
//

import UIKit

class SelectedDeviceDashboardViewController: UIViewController {

    var selectedDevice: SparkDevice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedDevice)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
