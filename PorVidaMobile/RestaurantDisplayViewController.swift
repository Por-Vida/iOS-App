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
    
    var tmp = 0
    
    var restaurantObj = [PFObject]()
    var rest: [PFObject]!
    var ordered = [PFObject]()
    var currentRestaurant: PFObject!/* = nil*/
    var rowCount = [Int]()
    var nameStrings = [String]()
    var displayCount = 0
    
    var restCollection: PFObject!
    var isHeld = false
    
    
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
    }
    
    func updateTableview() {
        /*
         Creates an array of all Restaurant objects
         */
        let pull = PFQuery(className: "Restaurant")
        pull.includeKeys(["name", "managerLast", "managerFirst", "street", "city", "state", "zip", "Meals"])//I edited this
        
        do {
            try restaurantObj = pull.findObjects()
        } catch let error {
            print("ERROR: \(error)")
        }
        
        /*
         Creates an array that contains the restaurant objects in order of similar names
         */
        rest = restaurantObj
        var i = restaurantObj.count - 1
        var place = 0
        while !rest.isEmpty {
            ordered.append(rest.remove(at: 0))
            place = rest.count - 1
            
            while place >= 0 {
                if rest[place]["name"] as! String == ordered[ordered.count - 1]["name"] as! String {
                    ordered.append(rest.remove(at: place))
                }
                place -= 1
            }
        }
        
        /*
         Creates an array that holds the names of restaurants to be displayed when printing the cells where similar names fall under
         */
        var restCounter = 0
        var rest = ordered
        var restCompare = ordered[0]["name"] as! String
        
        for index in 0 ..< ordered.count {
            
            if restCompare == ordered[index]["name"] as! String {
                restCounter += 1
            } else {
                nameStrings.append(restCompare)
                restCompare = ordered[index]["name"] as! String
                rowCount.append(restCounter)
                restCounter = 1
            }
        }
        nameStrings.append(ordered[ordered.count - 1]["name"] as! String)
        //print("ARRAY: \(nameStrings)")
        
        /*
         Creates an array that holds the total amount of each same name restaurant for calculating the cells per section
         */
        var max = 0
        for count in 0 ..< rowCount.count {
            max += rowCount[count]
        }
        rowCount.append(ordered.count - max)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount[section] + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            /*
             When every new section is introduced, adds a cell that defines the rows below it as restaurants under the same name
             */
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayCell", for: indexPath) as! DisplayCell//Display cell will be used as "Post" cell, to hold all of the similar restaurants
            if displayCount - 1 < ordered.count {
                cell.restaurantName.text = nameStrings[indexPath.section]
                print("HEADER: \(nameStrings[indexPath.section])")
            }
            
            return cell
        } else {
            
            /*
             Creates cells of restaurant information
             */
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
            
            /*
             A small algorithm to calculate the next cell to be placed by adding the sum of rowCount by an indexPath section to find how many cells have been placed previously
             */
            var rowCountSum = 0
            
            if indexPath.section > 0 {
                for i in 0 ..< indexPath.section {
                    rowCountSum += rowCount[i]
                    print("Sec \(indexPath.section) w/ \(indexPath.section - 1)")
                }
            }
            rowCountSum += indexPath.row
            
            /*
             Creates the location, and sets the location and name to the cell
             */
            let street = ordered[rowCountSum - 1]["street"] as! String
            let city = ordered[rowCountSum - 1]["city"] as! String
            let state = ordered[rowCountSum - 1]["state"] as! String
            let zip = ordered[rowCountSum - 1]["zip"] as! String
            
            let location = "\(street), \(city), \(state), \(zip)"
            
            cell.restaurant.text = (ordered[rowCountSum - 1]["name"] as! String)
            cell.location.text = location
            
            return cell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        /*
         Calculates the amount of sections based on when the held value is not the same as a name of a restaurant in an array of PFObjects
         
         Note: this might be simplified by returning the count of "nameStrings" array
         */
        var restaurant = ordered
        var counter = 1
        
        var held = restaurant[0]["name"] as! String
        for index in 0 ..< restaurant.count {
            if held != restaurant[index]["name"] as! String {
                held = restaurant[index]["name"] as! String
                counter += 1
            }
        }
        
        return counter
    }
    
    @IBAction func toRestaurantList(_ sender: Any) {
        
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = tableView.indexPathForSelectedRow!
        print(indexPath)
        
        if indexPath.row != 0 {
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
            
            var rowCountSum = 0
            
            if indexPath.section > 0 {
                for i in 0 ..< indexPath.section {
                    rowCountSum += rowCount[i]
                    print("Sec \(indexPath.section) w/ \(indexPath.section - 1)")
                }
            }
            rowCountSum += indexPath.row
            
            currentRestaurant = ordered[rowCountSum - 1]
        }
        
        let restaurantDetails = segue.destination as! MenuDetailsViewController
        restaurantDetails.restaurant = currentRestaurant!
    }
    
    
    
    
}

