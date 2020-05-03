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
            print("ORDERED: \(rowCount[indexPath.section])")
            print("DISP: \(displayCount)")
            print("DISPLAY: \(orderedRest[displayCount - 1]["name"] as! String)")
            cell.restaurantName.text = orderedRest[displayCount - 1]["name"] as! String
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantDisplayCell", for: indexPath) as! RestaurantDisplayCell
            
            let street = restClone[0]["street"] as! String
            let city = restClone[0]["city"] as! String
            let state = restClone[0]["state"] as! String
            let zip = restClone[0]["zip"] as! String
            
            let location = "\(street), \(city), \(state), \(zip)"
            
            cell.locationLabel.text = location
            
            restClone.remove(at: 0)
            
            return cell
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        // Find selected restaurant
//        let cell = sender as! UITableViewCell
//        let indexPath = tableView.indexPath(for: cell)!
//        let restaurant = restaurant[indexPath.row]
//        // Pass the selected restaurant over to next view controller
//        let detailsVC = segue.destination as! MenuDetailsViewController
//        detailsVC.restaurant = restaurant
//        //detailsVC.selectedPet = selectedPet
//        //tableView.deselectRow(at: IndexPath, animated: true)
    }
    
    
    
}

