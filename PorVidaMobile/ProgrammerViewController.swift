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
    var name: String!//Name of the restaurant
    var location: String!//Location of the restaurant
    var phone: String!//Restaurant phone number
    var website: String!//Restaurant phone number
    var hours: String!//Restaurant hours
    var breakfastMenu: [String] = []//Breakfast menu for restaurant
    var lunchMenu: [String] = []//Lunch menu for restaurant
    var dinnerMenu: [String] = []//Dinner menu for restaurant
    var kidsMenu: [String] = []//Kids menu for restaurant
    var sidesMenu: [String] = []//Sides menu for restaurant
    var id: Int = 0//Restaurant ID

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
