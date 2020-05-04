//
//  MenuDetailsViewController.swift
//  PorVidaMobile
//
//  Created by Christian on 5/2/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import Parse

class MenuDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var mealTableView: UITableView!
    var restaurant: PFObject!
    var selectedRestaurant: PFObject!
    
    var indexCheck = 1
    var (breakfastCount, lunchCount, dinnerCount, sideCount, kidCount) = (0,0,0,0,0)
    var mealsCount = 0
    var (breakfastMeals, lunchMeals, dinnerMeals, sideMeals, kidsMeals): ([PFObject], [PFObject], [PFObject], [PFObject], [PFObject]) = ([], [], [], [], [])
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("INSIDE: \(restaurant["name"] as! String)")
       mealTableView.delegate = self
       mealTableView.dataSource = self
        // Do any additional setup after loading the view.
        updateTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

    }
    
    func updateTableView() {
        restaurantNameLabel.text = restaurant["name"] as! String
        
        let meal = (restaurant["Meals"] as? [PFObject]) ?? []
        print("MEAL: \(meal)")
        
        for index in 0 ..< meal.count {
            if meal[index]["mealType"] as? String == "Breakfast" {
                breakfastCount += 1
            } else if meal[index]["mealType"] as? String == "Lunch" {
                print("UP LUNCH: \(lunchCount)")
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
        
        //print(lunchMeals)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return breakfastCount + 1
        } else if section == 1 {
            print("LUNCH C: \(lunchCount)")
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
//        print(mealTypePicker.numberOfSegments)
//        return mealTypePicker.numberOfSegments - 1
        
        return 5
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
