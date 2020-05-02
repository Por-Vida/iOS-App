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
    @IBOutlet weak var mealTypePicker: UISegmentedControl!
    
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
    //var meals: [[String: String]] = []
    //var id: Int = 0//Restaurant ID
    
    
    //var restaurants = [PFObject]()
    
    var restaurants = [PFObject]()
    var restaurantObj: PFObject!
    //var meals = [PFObject]()
    var selectedRestaurant: PFObject!
    
    var counting = 0
    var (breakfastCount, lunchCount, dinnerCount, sideCount, kidCount) = (0,0,0,0,0)
    
    //var selectedRestaurant: PFObject!
    //var lunchMealCounter: [Int] = [0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealTableView.delegate = self
        mealTableView.dataSource = self
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let meal = (restaurantObj["Meals"] as? [PFObject]) ?? []
        for index in 0 ..< meal.count {
            if meal[index]["mealType"] as? String == "Breakfast" {
                breakfastCount += 1
            } else if meal[index]["mealType"] as? String == "Lunch" {
                lunchCount += 1
            } else if meal[index]["mealType"] as? String == "Dinner" {
                dinnerCount += 1
            } else if meal[index]["mealType"] as? String == "Sides" {
                sideCount += 1
            } else if meal[index]["mealType"] as? String == "Kids" {
                kidCount += 1
            }
        }
        
        let query = PFQuery(className: "Restaurants")
        //query.includeKeys(["name", "street", "city", "state", "zip", "Meals", "Meals.restaurant"])
        
        query.findObjectsInBackground { (restaurants, error) in
            if restaurants != nil {
                self.restaurants = restaurants!
                self.mealTableView.reloadData()
            }
        }
        
        print(restaurants)
        //print()
        //var meal = (restaurantObj["Meals"] as? [PFObject]) ?? []
        let m = meal[0]
        //print(m["name"] as? String)
        print("\(meal[0]["name"] as? String) & \(meal[1]["name"] as? String)")
        //print(meal![0]["name"] as? String)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return breakfastCount + 1
        } else if section == 1 {
            return lunchCount + 1
        } else if section == 2 {
            return dinnerCount + 1
        } else if section == 3 {
            return sideCount + 1
        } else if section == 4 {
            return kidCount + 1
        } else {
            return 0
        }
        
//        if counting == 0 {
//            counting += 1
//            print("First level")
//            print("Counting: \(counting)")
//            return 2//Return a count + 1
//        } else if counting == 1{
//            print("Next level")
//            print("Counting: \(counting)")
//            return 3
//        } else {
//            print("Dead")
//            return 1
//        }
        
        
        //return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealTypeCell", for: indexPath) as! MealTypeCell
            
            switch (indexPath.section) {
            case 0:
                cell.mealTypeLabel.text = "Breakfast"
            case 1:
                cell.mealTypeLabel.text = "Lunch"
            case 2:
                cell.mealTypeLabel.text = "Dinner"
            case 3:
                cell.mealTypeLabel.text = "Sides"
            case 4:
                cell.mealTypeLabel.text = "Kids"
            default:
                _ = 0
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealCell
            
            let meal = (restaurantObj["Meals"] as? [PFObject]) ?? []
            //let m = meal[0]
            //print(m["name"] as? String)
            //print("\(String(describing: meal[0]["name"] as? String)) & \(String(describing: meal[1]["name"] as? String))")
            
            cell.mealLabel.text = meal[indexPath.row - 1]["name"] as? String//Crash occurs with an empty cell
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return restaurantTitle.count
        let restaurant = restaurantObj["Meals"] as? [PFObject]
        //return restaurant!.count
        //return 5
        //return meals.count
        //return restaurants.count//Might be wrong
        print(mealTypePicker.numberOfSegments)
        return mealTypePicker.numberOfSegments - 1
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
        selectedRestaurant = restaurantObj//Might be incorrect
        
        let test = mealTypePicker.selectedSegmentIndex
        print("TEST HERE: \(test)")
        
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
            
        } else if mealTypePicker.selectedSegmentIndex == 0 {
            let alert = UIAlertController(title: "Incomplete Fields", message: "Please select the type of meal at the bottom of the view!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Before Completion", message: "Check your fields before submission! When you are ready, press \"Continue\"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (UIAlertAction) in
                
                let meals = PFObject(className: "Meals")
                
                meals["name"] = mealName
                meals["description"] = description
                meals["calories"] = calories
                meals["totalFat"] = totalFat
                meals["satFat"] = satFat
                meals["sodium"] = sodium
                meals["carbs"] = carbs
                meals["fiber"] = fiber
                meals["sugar"] = sugar
                meals["protein"] = protein
                meals["restaurant"] = self.selectedRestaurant
                
                let mealTypeIndex = self.mealTypePicker.selectedSegmentIndex
                var mealType = ""
                
                switch(mealTypeIndex) {
                case 0:
                    print("Already denied")
                case 1:
                    mealType = "Breakfast"
                case 2:
                    mealType = "Lunch"
                case 3:
                    mealType = "Dinner"
                case 4:
                    mealType = "Sides"
                case 5:
                    mealType = "Kids"
                default:
                    print("An error has occured")
                }
                
                meals["mealType"] = mealType
                
                self.restaurantObj.add(meals, forKey: "Meals")//forKey: "comments"
                self.restaurantObj.saveInBackground { (success, error) in
                    if success {
                        print("Meal saved")
                    } else {
                        print("Failed to save comment")
                    }
                }
                
                self.mealTableView.reloadData()
                
                
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
