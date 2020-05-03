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
    var currentRestaurant: PFObject! = nil
    var rowCount = [Int]()
    var arr = [String]()
    var displayCount = 0
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
        
        print(ordered.count)
        var counting = 0
        var rest = ordered
        var hold = ordered[0]["name"] as! String
        
        for index in 0 ..< ordered.count {
            
            if hold == ordered[index]["name"] as! String {
                counting += 1
            } else {
                arr.append(hold)
                hold = ordered[index]["name"] as! String
                //print(hold)
                //print("COUNTING: \(counting)")
                rowCount.append(counting)
                counting = 1
            }
        }
        arr.append(ordered[ordered.count - 1]["name"] as! String)
        print("ARRAY: \(arr)")
        
        var max = 0
        for count in 0 ..< rowCount.count {
            //print("LOOK \(rowCount[count])")
            max += rowCount[count]
        }
        //print("MAX: \(max)")
        rowCount.append(ordered.count - max)
        
        for index in 0 ..< rowCount.count {
            print(rowCount[index])
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount[section] + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var orderCopy = ordered
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayCell", for: indexPath) as! DisplayCell//Display cell will be used as "Post" cell, to hold all of the similar restaurants
            if displayCount - 1 < ordered.count {
                cell.restaurantName.text = arr[indexPath.section]
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
            
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
            
            let street = ordered[restaurantIndex - 1]["street"] as! String
            let city = ordered[restaurantIndex - 1]["city"] as! String
            let state = ordered[restaurantIndex - 1]["state"] as! String
            let zip = ordered[restaurantIndex - 1]["zip"] as! String
            
            let location = "\(street), \(city), \(state), \(zip)"
            
            cell.restaurant.text = (ordered[restaurantIndex - 1]["name"] as! String)
            cell.location.text = location
            
            orderCopy.remove(at: indexPath.row)
            
            return cell
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        var restaurant = ordered
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
            //let selectedCell = tableView.cellForRow(at: indexPath) as! RestaurantDisplayCell
            
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
            
            currentRestaurant = ordered[restaurantIndex-1]
        }
        
        let restaurantDetails = segue.destination as! MenuDetailsViewController
        restaurantDetails.restaurant = currentRestaurant!
        //print("CURRENT: \(currentRestaurant)")
        //print(restaurantDetails.restaurant["name"] as! String)
    }
    
    
    
    
}

