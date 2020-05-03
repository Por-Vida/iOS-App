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
    var rest: [PFObject]!
    var ordered = [PFObject]()
    var rowCount = [Int]()
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
        //let query = PFQuery(className: "Restaurants")
        
        /*
         Pulls data from Heroku to display in tableview
         */
        let pull = PFQuery(className: "Restaurant")
        pull.includeKeys(["name", "managerLast", "managerFirst", "street", "city", "state", "zip", "Meals"])//I edited this
        
        /*
         Uses data query under var title, and sets that query to restaurantObj as PFObject
         */
//        pull.findObjectsInBackground { (title, error) in
//            if title != nil {
//                print("ZBep")
//                self.restaurantObj = title!
//                self.tableView.reloadData()
//            }
//        }
        
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
                //print("Place: \(place)")
                //print("Rest: \(ordered.count)")
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
                print("Match: \(ordered[index]["name"] as! String)")
                counting += 1
            } else {
                hold = ordered[index]["name"] as! String
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
        rowCount.append(ordered.count - max)
        
        for index in 0 ..< rowCount.count {
            print(rowCount[index])
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Rows based on how many of the same restaurant
//                for count in 0 ..< ordered.count {
//            print("Rows: \(ordered[count]["name"] as! String)")
//        }
        
        print("SECTION \(section)")
        
        return rowCount[section] + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        for count in 0 ..< ordered.count {
//            print("Main: \(ordered[count]["name"] as! String)")
//        }
//        Seems to run row * section
        
        print(ordered[indexPath.row]["name"] as! String)
        var t = ordered[indexPath.row]["name"] as! String
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayCell", for: indexPath) as! DisplayCell//Display cell will be used as "Post" cell, to hold all of the similar restaurants
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
            
            print(ordered[indexPath.row]["name"] as! String)
            
            //cell.location.text = t//This label needs to be renamed
//
//            cell.location.text = location
            
            return cell
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //solve the section based
        
        
        
//                for count in 0 ..< ordered.count {
//            print("sections: \(ordered[count]["name"] as! String)")
//        }
        
        var restaurant = ordered
        var counter = 1
//        print(counter)
//        counter += 1
        
        var held = restaurant[0]["name"] as! String
        for index in 0 ..< restaurant.count {
            if held != restaurant[index]["name"] as! String {
                held = restaurant[index]["name"] as! String
                counter += 1
            }
        }
        
        print(counter)
        
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

