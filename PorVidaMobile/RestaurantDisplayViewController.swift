//
//  RestauarantDisplayViewController.swift
//  PorVidaMobile
//
//  Created by Christian on 4/18/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import Parse



class RestaurantDisplayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var restaurantObj = [PFObject]()
    var restaurant: [PFObject]!
    var orderedRest = [PFObject]()
    var restClone = [PFObject]()
    var currentRestaurant: PFObject! = nil
    var rowCount = [Int]()
    var displayCount = 0
    //var restaurants = [PFObject]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateTableview()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //updateTableview()
    }
    
    func updateTableview() {
        let pull = PFQuery(className: "Restaurant")
        pull.includeKeys(["name", "managerLast", "managerFirst", "street", "city", "state", "zip", "Meals"])//I edited this

        do {
            try restaurantObj = pull.findObjects()
        } catch let error {
            print("ERROR: \(error)")
        }
        
        restaurant = restaurantObj
        
        var place = 0
        
        while !restaurant.isEmpty {
            orderedRest.append(restaurant.remove(at: 0))
            place = restaurant.count - 1
            while place >= 0 {
                //print("Place: \(place)")
                //print("Rest: \(ordered.count)")
                if restaurant[place]["name"] as! String == orderedRest[orderedRest.count - 1]["name"] as! String {
                    orderedRest.append(restaurant.remove(at: place))
                }
                place -= 1
            }
        }
        
        restClone = orderedRest
        
        print(orderedRest.count)
        var counting = 0
        var hold = orderedRest[0]["name"] as! String
        for index in 0 ..< orderedRest.count {
            if hold == orderedRest[index]["name"] as! String {
                print("Match: \(orderedRest[index]["name"] as! String)")
                counting += 1
            } else {
                hold = orderedRest[index]["name"] as! String
                print(hold)
                print("COUNTING: \(counting)")
                rowCount.append(counting)
                counting = 1
            }
        }
        
        var max = 0
        for count in 0 ..< rowCount.count {
            print("LOOK \(rowCount[count])")
            max += rowCount[count]
        }
        print("MAX: \(max)")
        rowCount.append(orderedRest.count - max)
        
        for index in 0 ..< rowCount.count {
            print(rowCount[index])
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Rows based on how many of the same restaurant
        
        print("SECTION \(section)")
        
        return rowCount[section] + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayCell", for: indexPath) as! DisplayCell//Display cell will be used as "Post" cell, to hold all of the similar restaurants
            displayCount += rowCount[indexPath.section]
            //print("LOOKIT: \(indexPath.section)")
//            print("ORDERED: \(rowCount[indexPath.section])")
//            print("DISP: \(displayCount)")
//            print("DISPLAY: \(orderedRest[displayCount - 1]["name"] as! String)")
            print("ERROR \(displayCount - 1)")
            
            if displayCount - 1 < orderedRest.count {
                cell.restaurantName.text = orderedRest[displayCount - 1]["name"] as! String
            }
            
            return cell
        } else {
            
            //while restClone.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantDisplayCell", for: indexPath) as! RestaurantDisplayCell
            
            if restClone.count != 0 {
                print("Boodoo dodo")
                
                let street = restClone[0]["street"] as! String
                let city = restClone[0]["city"] as! String
                let state = restClone[0]["state"] as! String
                let zip = restClone[0]["zip"] as! String
                
                let location = "\(street), \(city), \(state), \(zip)"
                
                cell.locationLabel.text = location
                
                restClone.remove(at: 0)
                //}
                
                return cell
            } else {
                return cell
            }

        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //solve the section based
        
        let restaurant = orderedRest
        var counter = 1
        
        var held = restaurant[0]["name"] as! String
        for index in 0 ..< restaurant.count {
            if held != restaurant[index]["name"] as! String {
                held = restaurant[index]["name"] as! String
                counter += 1
            }
        }
        
        //print(counter)
        
        return counter
    }
    
    @IBAction func toRestaurantList(_ sender: Any) {
        
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row != 0 {
////            print(indexPath)
////            print("\(indexPath.section), \(indexPath.row)")
//            let selectedCell = tableView.cellForRow(at: indexPath) as! RestaurantDisplayCell
//
//            var restaurantIndex = 0
//            var index = 0
//
//            if indexPath.section > 1 {
//                restaurantIndex = (indexPath.section * 2) + (indexPath.row)
//            } else if indexPath.section == 0 {
//                restaurantIndex = indexPath.row
//            } else {
//                index = indexPath.section + 1
//                restaurantIndex = ((index * 2) + (indexPath.row)) - 1
//            }
//
//            currentRestaurant = orderedRest[restaurantIndex-1]
//            print("CURRENT PRE: \(currentRestaurant)")
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("Text")
//        let cell = sender as! UITableViewCell
//        let indexPath = tableView.indexPath(for: cell)!
//        let restaurantPass = orderedRest[indexPath.row]
        //let indexPath = tableView.indexPath(for: cell)!
        
        let indexPath = tableView.indexPathForSelectedRow!
        print(indexPath)
        
        if indexPath.row != 0 {
            //            print(indexPath)
            //            print("\(indexPath.section), \(indexPath.row)")
            let selectedCell = tableView.cellForRow(at: indexPath) as! RestaurantDisplayCell
            
            var restaurantIndex = 0
            var index = 0
            
            if indexPath.section > 1 {
                restaurantIndex = (indexPath.section * 2) + (indexPath.row)
            } else if indexPath.section == 0 {
                restaurantIndex = indexPath.row
            } else {
                index = indexPath.section + 1
                restaurantIndex = ((index * 2) + (indexPath.row)) - 1
            }
            
            currentRestaurant = orderedRest[restaurantIndex-1]
        }
        
        let restaurantDetails = segue.destination as! MenuDetailsViewController
        restaurantDetails.restaurant = currentRestaurant!
        //print("CURRENT: \(currentRestaurant)")
        //print(restaurantDetails.restaurant["name"] as! String)
    }
}

