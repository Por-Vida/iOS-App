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
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var newMealView: UIView!
    
    @IBOutlet weak var mealNameField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var caloriesField: UITextField!
    @IBOutlet weak var totalFatField: UITextField!
    @IBOutlet weak var satFatField: UITextField!
    @IBOutlet weak var sodiumField: UITextField!
    @IBOutlet weak var carbsField: UITextField!
    @IBOutlet weak var fiberField: UITextField!
    @IBOutlet weak var sugarField: UITextField!
    @IBOutlet weak var proteinField: UITextField!
    @IBOutlet weak var mealTypeSegment: UISegmentedControl!
    
    
    
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
        
        var name = restaurantObj["name"] as! String
        restaurantNameLabel.text = name
        
        
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
    
    @IBAction func onEditProfile(_ sender: Any) {
        print("This is the website, etc")
    }
    
    @IBAction func onNewMeal(_ sender: Any) {
        newMealView.isHidden = false
    }
    
    @IBAction func onCancel(_ sender: Any) {
        //Cancel new meal
        let alert = UIAlertController(title: "Cancel Meal?", message: "Cancelling will clear the meal fields. Are you sure you want to cancel creating a new meal?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue Cancel", style: .default, handler: { (UIAlertAction) in
            self.mealNameField.text = ""
            self.descriptionField.text = ""
            self.caloriesField.text = ""
            self.totalFatField.text = ""
            self.satFatField.text = ""
            self.sodiumField.text = ""
            self.carbsField.text = ""
            self.fiberField.text = ""
            self.sugarField.text = ""
            self.proteinField.text = ""
            self.newMealView.isHidden = true
        }))
        alert.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        var mealName: String {
            if let meal = mealNameField.text {
                if meal != "" { return meal }
            }
            return "Default"
        }
        var description: String {
            if let describe = descriptionField.text {
                if describe != "" { return describe }
            }
            return "N/A"
        }
        var calories: String {
            if let cal = caloriesField.text {
                if cal != "" { return cal }
            }
            return "Default"
        }
        var totalFat: String {
            if let tFat = totalFatField.text {
                if tFat != "" { return tFat }
            }
            return "Default"
        }
        var satFat: String {
            if let sFat = satFatField.text {
                if sFat != "" { return sFat }
            }
            return "Default"
        }
        var sodium: String {
            if let sod = sodiumField.text {
                if sod != "" { return sod }
            }
            return "Default"
        }
        var carbs: String {
            if let car = carbsField.text {
                if car != "" { return car }
            }
            return "Default"
        }
        var fiber: String {
            if let fib = fiberField.text {
                if fib != "" { return fib }
            }
            return "Default"
        }
        var sugar: String {
            if let sug = sugarField.text {
                if sug != "" { return sug }
            }
            return "Default"
        }
        var protein: String {
            if let prot = proteinField.text {
                if prot != "" { return prot }
            }
            return "Default"
        }
        
        /*
         self.carbsField.text = ""
         self.fiberField.text = ""
         self.sugarField.text = ""
         self.proteinField.text = ""
         */


        if (mealName == "Default" || calories == "Default" || totalFat == "Default" || satFat == "Default" || sodium == "Default" || carbs == "Default" || fiber == "Default" || sugar == "Default" || protein == "Default") {
            print("FILL IT COMP")
        }else {
            print("sccss")
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
