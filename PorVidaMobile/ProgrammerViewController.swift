//
//  ProgrammerViewController.swift
//  PorVidaMobile
//
//  Created by cory on 4/11/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import Parse

class ProgrammerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func uploadRestaurantInfo() {
        let restaurant = PFObject(className: "Restaurants")
        restaurant["name"] = "McDonalds"
        restaurant["location"] = "An address"
        restaurant["menu"] = "Items"
        restaurant["phone"] = "(000)000-0000"
        restaurant["website"] = "nul"
        restaurant["hours"] = "Mon-Fri 12am-12pm"
        
        restaurant.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("Saved")
            } else {
                print("\(error)")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
