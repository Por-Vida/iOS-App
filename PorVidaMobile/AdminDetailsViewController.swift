//
//  AdminDetailsViewController.swift
//  PorVidaMobile
//
//  Created by cory on 4/20/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import Parse

class AdminDetailsViewController: UIViewController {
    var phone: String!//Restaurant phone number
    var website: String!//Restaurant phone number
    var hours: String!//Restaurant hours
    var breakfastMenu: [String] = []//Breakfast menu for restaurant
    var lunchMenu: [String] = []//Lunch menu for restaurant
    var dinnerMenu: [String] = []//Dinner menu for restaurant
    var kidsMenu: [String] = []//Kids menu for restaurant
    var sidesMenu: [String] = []//Sides menu for restaurant
    //var id: Int = 0//Restaurant ID
    
    var restaurantObj: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        var beep = restaurantObj["name"] as! String
//        print(beep)
//        restaurantObj["website"] = "www.somewebsite.com"
//        var web = restaurantObj["website"] as! String
//        print(web)
        var food: String; var ingredient: String
        food = "Pizza"
        ingredient = "Tom Sauce, Peppp"
        var item = ["meal": food, "ingredients": ingredient]
        var arr: [[String: String]] = []
        arr.append(item)
        print(arr[0])
        //Calories, total fat, saturated fat, sodium, carbohydrates, fiber, added sugar, protein
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
