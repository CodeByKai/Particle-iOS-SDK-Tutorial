//
//  MyDevicesListTableViewController.swift
//  rasmussen
//
//  Created by Kai Perez on 2/3/17.
//  This code is intended for learning purposes and is free to use and share 
//

import UIKit

class MyDevicesListTableViewController: UITableViewController {

    var myParticleDevicesArr: [SparkDevice] = []
    var selectedDevice: SparkDevice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SparkCloud.sharedInstance().getDevices { (sparkDevices:[Any]?, error:Error?) -> Void in
            if error != nil {
                print("Check your internet connectivity")
            }
            else {
                if let devices = sparkDevices as? [SparkDevice] {
                    for device in devices {
                        self.myParticleDevicesArr.append(device)
                    }
                }
            }
        }
        
        runAfterDelay(2) {
            self.tableView.reloadData()
        }
    }
    
    func runAfterDelay(_ delay: TimeInterval, block: @escaping ()->()) {
        let time = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: block)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myParticleDevicesArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = myParticleDevicesArr[indexPath.row].name
        
        return cell!
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if myParticleDevicesArr[indexPath.row].connected == false {
            print("Your device is not currently connected.")
        } else {
            selectedDevice = myParticleDevicesArr[indexPath.row]
            performSegue(withIdentifier: "SelectedDeviceDashboardViewControllerSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! SelectedDeviceDashboardViewController
        nextViewController.selectedDevice = selectedDevice
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
