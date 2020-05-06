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
    
    var indexCheck = 1
    var (breakfastCount, lunchCount, dinnerCount, sideCount, kidCount) = (0,0,0,0,0)
    var mealsCount = 0
    
    var (breakfastMeals, lunchMeals, dinnerMeals, sideMeals, kidsMeals): ([PFObject], [PFObject], [PFObject], [PFObject], [PFObject]) = ([], [], [], [], [])
    
    var isClicked = false
    
    var isDuped = false
    
    //var selectedRestaurant: PFObject!
    //var lunchMealCounter: [Int] = [0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In Admin")
        //mealTableView.reloadData()
        
        
        mealTableView.delegate = self
        mealTableView.dataSource = self
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mealTableView.refreshControl?.endRefreshing()
        mealTableView.delegate = self
        mealTableView.dataSource = self
        
//        var indexPath = IndexPath(row: 0, section: 0)
//        mealTableView.deleteRows(at: [indexPath], with: .automatic)
        restaurantNameLabel.text = restaurantObj["name"] as! String
        
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
        mealsCount = meal.count
        
        let query = PFQuery(className: "Restaurants")
        
        query.findObjectsInBackground { (restaurants, error) in
            if restaurants != nil {
                self.restaurants = restaurants!
                self.mealTableView.reloadData()
            }
        }
        
        print(restaurants)
        
        for index in 0 ..< meal.count {
            if meal[index]["mealType"] as! String == "Breakfast" {
                breakfastMeals.append(meal[index] )
            } else if meal[index]["mealType"] as! String == "Lunch" {
                lunchMeals.append(meal[index] )
            } else if meal[index]["mealType"] as! String == "Dinner" {
                dinnerMeals.append(meal[index] )
            } else if meal[index]["mealType"] as! String == "Sides" {
                sideMeals.append(meal[index] )
            } else if meal[index]["mealType"] as! String == "Kids" {
                kidsMeals.append(meal[index] )
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if !isDuped {
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
//        } else {
//            return 0
//        }
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
            //let meal = (restaurantObj["Meals"] as? [PFObject]) ?? []
            
            switch(indexPath.section) {
            case 0:
                //print("LOOKY \(breakfastMeals[0]["name"] as! String)")
                cell.mealLabel.text = (breakfastMeals[indexPath.row - 1]["name"] as! String)
                cell.descriptionLabel.text = (breakfastMeals[indexPath.row - 1]["description"] as! String)
                
                let calories = "\(breakfastMeals[indexPath.row - 1]["calories"] as! String)g"
                let totalFat = "\(breakfastMeals[indexPath.row - 1]["totalFat"] as! String)g"
                let satFat = "\(breakfastMeals[indexPath.row - 1]["satFat"] as! String)g"
                let sodium = "\(breakfastMeals[indexPath.row - 1]["sodium"] as! String)mg"
                let carbs = "\(breakfastMeals[indexPath.row - 1]["carbs"] as! String)g"
                let fiber = "\(breakfastMeals[indexPath.row - 1]["fiber"] as! String)g"
                let sugar = "\(breakfastMeals[indexPath.row - 1]["sugar"] as! String)g"
                let protein = "\(breakfastMeals[indexPath.row - 1]["protein"] as! String)g"
                
                let ingredients = "Calories - \(calories), Total Fat - \(totalFat), Saturated Fat - \(satFat), Sodium - \(sodium), Carbohydrates - \(carbs), Fiber - \(fiber), Sugar - \(sugar), Protein - \(protein)"
                cell.ingredientsLabel.text = ingredients
            case 1:
                cell.mealLabel.text = (lunchMeals[indexPath.row - 1]["name"] as! String)
                cell.descriptionLabel.text = (lunchMeals[indexPath.row - 1]["description"] as! String)
                
                let calories = "\(lunchMeals[indexPath.row - 1]["calories"] as! String)g"
                let totalFat = "\(lunchMeals[indexPath.row - 1]["totalFat"] as! String)g"
                let satFat = "\(lunchMeals[indexPath.row - 1]["satFat"] as! String)g"
                let sodium = "\(lunchMeals[indexPath.row - 1]["sodium"] as! String)mg"
                let carbs = "\(lunchMeals[indexPath.row - 1]["carbs"] as! String)g"
                let fiber = "\(lunchMeals[indexPath.row - 1]["fiber"] as! String)g"
                let sugar = "\(lunchMeals[indexPath.row - 1]["sugar"] as! String)g"
                let protein = "\(lunchMeals[indexPath.row - 1]["protein"] as! String)g"
                
                let ingredients = "Calories - \(calories), Total Fat - \(totalFat), Saturated Fat - \(satFat), Sodium - \(sodium), Carbohydrates - \(carbs), Fiber - \(fiber), Sugar - \(sugar), Protein - \(protein)"
                cell.ingredientsLabel.text = ingredients
            case 2:
                cell.mealLabel.text = (dinnerMeals[indexPath.row - 1]["name"] as! String)
                cell.descriptionLabel.text = (dinnerMeals[indexPath.row - 1]["description"] as! String)
                
                let calories = "\(dinnerMeals[indexPath.row - 1]["calories"] as! String)g"
                let totalFat = "\(dinnerMeals[indexPath.row - 1]["totalFat"] as! String)g"
                let satFat = "\(dinnerMeals[indexPath.row - 1]["satFat"] as! String)g"
                let sodium = "\(dinnerMeals[indexPath.row - 1]["sodium"] as! String)mg"
                let carbs = "\(dinnerMeals[indexPath.row - 1]["carbs"] as! String)g"
                let fiber = "\(dinnerMeals[indexPath.row - 1]["fiber"] as! String)g"
                let sugar = "\(dinnerMeals[indexPath.row - 1]["sugar"] as! String)g"
                let protein = "\(dinnerMeals[indexPath.row - 1]["protein"] as! String)g"
                
                let ingredients = "Calories - \(calories), Total Fat - \(totalFat), Saturated Fat - \(satFat), Sodium - \(sodium), Carbohydrates - \(carbs), Fiber - \(fiber), Sugar - \(sugar), Protein - \(protein)"
                cell.ingredientsLabel.text = ingredients
            case 3:
                cell.mealLabel.text = (sideMeals[indexPath.row - 1]["name"] as! String)
                cell.descriptionLabel.text = (sideMeals[indexPath.row - 1]["description"] as! String)
                
                let calories = "\(sideMeals[indexPath.row - 1]["calories"] as! String)g"
                let totalFat = "\(sideMeals[indexPath.row - 1]["totalFat"] as! String)g"
                let satFat = "\(sideMeals[indexPath.row - 1]["satFat"] as! String)g"
                let sodium = "\(sideMeals[indexPath.row - 1]["sodium"] as! String)mg"
                let carbs = "\(sideMeals[indexPath.row - 1]["carbs"] as! String)g"
                let fiber = "\(sideMeals[indexPath.row - 1]["fiber"] as! String)g"
                let sugar = "\(sideMeals[indexPath.row - 1]["sugar"] as! String)g"
                let protein = "\(sideMeals[indexPath.row - 1]["protein"] as! String)g"
                
                let ingredients = "Calories - \(calories), Total Fat - \(totalFat), Saturated Fat - \(satFat), Sodium - \(sodium), Carbohydrates - \(carbs), Fiber - \(fiber), Sugar - \(sugar), Protein - \(protein)"
                cell.ingredientsLabel.text = ingredients
            case 4:
                cell.mealLabel.text = (kidsMeals[indexPath.row - 1]["name"] as! String)
                cell.descriptionLabel.text = (kidsMeals[indexPath.row - 1]["description"] as! String)
                
                let calories = "\(kidsMeals[indexPath.row - 1]["calories"] as! String)g"
                let totalFat = "\(kidsMeals[indexPath.row - 1]["totalFat"] as! String)g"
                let satFat = "\(kidsMeals[indexPath.row - 1]["satFat"] as! String)g"
                let sodium = "\(kidsMeals[indexPath.row - 1]["sodium"] as! String)mg"
                let carbs = "\(kidsMeals[indexPath.row - 1]["carbs"] as! String)g"
                let fiber = "\(kidsMeals[indexPath.row - 1]["fiber"] as! String)g"
                let sugar = "\(kidsMeals[indexPath.row - 1]["sugar"] as! String)g"
                let protein = "\(kidsMeals[indexPath.row - 1]["protein"] as! String)g"
                
                let ingredients = "Calories - \(calories), Total Fat - \(totalFat), Saturated Fat - \(satFat), Sodium - \(sodium), Carbohydrates - \(carbs), Fiber - \(fiber), Sugar - \(sugar), Protein - \(protein)"
                cell.ingredientsLabel.text = ingredients
            default:
                _=0
            }
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //let restaurant = restaurantObj["Meals"] as? [PFObject]
        print(mealTypePicker.numberOfSegments)
        return mealTypePicker.numberOfSegments - 1
    }
    
    @IBAction func onBack(_ sender: Any) {
        isClicked = true
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onEditProfile(_ sender: Any) {
        //print("This is the website, etc")
        //performSegue(withIdentifier: "toEdit", sender: nil)
//        dismiss(animated: true, completion: nil)
//        let vc = EditInfoViewController(nibName: "EditInfoViewController", bundle: nil)
//        vc.restaurant = restaurantObj
//        navigationController?.pushViewController(vc, animated: true)
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
                
                //self.mealTableView.reloadData()
                
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
     // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("Tet")
        if !isClicked {
            //isDuped = true
            let restaurantInfo = segue.destination as! EditInfoViewController
            restaurantInfo.restaurant = self.restaurantObj
            print("Text is here at the end")
        }
    }
}
