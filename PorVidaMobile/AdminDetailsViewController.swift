//
//  AdminDetailsViewController.swift
//  PorVidaMobile
//
//  Created by cory on 4/20/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import Parse

class AdminDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var newMealView: UIView!
    @IBOutlet weak var mealTableView: UITableView!
    
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
    var meals: [[String: String]] = []
    //var id: Int = 0//Restaurant ID
    
    var restaurantObj: PFObject!
    var mealCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealTableView.delegate = self
        mealTableView.dataSource = self
        
        var name = restaurantObj["name"] as! String
        restaurantNameLabel.text = name
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        let pull = PFQuery(className: "Restaurant")
        //        pull.includeKeys(["name", "managerLast", "managerFirst", "street", "city", "state", "zip"])
        //
        //        pull.findObjectsInBackground { (title, error) in
        //            if title != nil {
        //                self.restaurantObj = title!
        //                self.tableView.reloadData()
        //            }
        //        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        if let arr: [[String: String]] = restaurantObj["lunchMeal"] as? [[String : String]] {
        //            print(arr[0]["meal"]!)
        //        } else {
        //            print("No meals exist here!")
        //        }
        
        
        
        if let mealList: [[String: String]] = restaurantObj["lunchMeal"] as? [[String: String]] {
            meals = mealList
            
//            print("THIS IS WHERE TABLEVIEW() IS!")
//            print(meals[0]["meal"] as! String)
            print(meals[mealCounter]["meal"] as! String)
            
            mealCounter += 1
            return mealList.count
        } else {
            return 0
        }
        
        //        meals = (restaurantObj["lunchMeal"] as? [[String: String]])!//Fails if there is no meal array
        
        //
        //        if meals.count == 0 {
        //            return 0
        //        } else {
//            return meals.count
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealCell
        
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return restaurantTitle.count
        return 1
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
        
        if (mealName == "Default" || calories == "Default" || totalFat == "Default" || satFat == "Default" || sodium == "Default" || carbs == "Default" || fiber == "Default" || sugar == "Default" || protein == "Default") {
            let alert = UIAlertController(title: "Incomplete Fields", message: "Please fill out all of the fields with appropriate information!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Before Completion", message: "Check your fields before submission! When you are ready, press \"Continue\"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (UIAlertAction) in
                //Add to an array, upload that array
                /*
                 var item = ["meal": food, "ingredients": ingredient]
                 var arr: [[String: String]] = []
                 arr.append(item)
                 print(arr[0])
                 //Calories, total fat, saturated fat, sodium, carbohydrates, fiber, added sugar, protein
                 */
                
                //        var beep = restaurantObj["name"] as! String
                //        print(beep)
                //        restaurantObj["website"] = "www.somewebsite.com"
                //        var web = restaurantObj["website"] as! String
                //        print(web)
                
                
                
                let item = ["meal": mealName, "description": description, "calories": calories, "totalFat": totalFat, "satFat": satFat, "sodium": sodium, "carbs": carbs, "fiber": fiber, "sugar": sugar, "protein": protein]
                print(item["meal"]!)//Check
                
                if var lunchMeals: [[String: String]] = self.restaurantObj["lunchMeal"] as? [[String: String]] {
                    
                    lunchMeals.append(item)
                    self.restaurantObj["lunchMeal"] = lunchMeals
                    
                    self.restaurantObj.saveInBackground { (success, error) in
                        if success {
                            //Dismiss the view, clear the fields, update the tableview
                            print("Saved")
                        } else {
                            print("\(error)")
                        }
                    }
                    
                }
                
//                var lunchMeals: [[String: String]] = (self.restaurantObj["lunchMeal"] as? [[String: String]])!

                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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
