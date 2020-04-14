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
    var name: String!
    var location: String!
    var phone: String!
    var website: String!
    var hours: String!
    var breakfastMenu: [String] = []//We append these arrays
    var lunchMenu: [String] = []
    var dinnerMenu: [String] = []
    var kidsMenu: [String] = []
    var sidesMenu: [String] = []
    var id: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func uploadRestaurantInfo() {
        let restaurant = PFObject(className: "\(name)")
        //let rest = 
        //restaurant["name"] = "McDonalds"
        restaurant["id"] = id
        restaurant["location"] = location
        restaurant["phone"] = phone
        restaurant["website"] = website
        restaurant["hours"] = hours
        restaurant["breakfastMenu"] = breakfastMenu
        restaurant["lunchMenu"] = lunchMenu
        restaurant["dinnerMenu"] = dinnerMenu
        restaurant["sidesMenu"] = sidesMenu
        restaurant["kidMenu"] = kidsMenu
        
        restaurant.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("Saved")
            } else {
                print("\(error)")
            }
        }
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
