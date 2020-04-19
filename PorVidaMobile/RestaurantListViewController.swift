//
//  RestaurantListViewController.swift
//  PorVidaMobile
//
//  Created by cory on 4/13/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import Parse

class RestaurantListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!//The tableview of restaurants
    
    @IBOutlet weak var newRestaurantField: UITextField!//Field that takes new restaurant name
    @IBOutlet weak var restaurantLocationView: UIView!//View that appears to create new restaurant; always starts as hidden
    @IBOutlet weak var streetAddressField: UITextField!//Restaurant street address
    @IBOutlet weak var cityField: UITextField!//Restaurant city
    @IBOutlet weak var stateField: UITextField!//Restaurant state; might not be neccessary
    @IBOutlet weak var zipCodeField: UITextField!//Restaurant zip code
    @IBOutlet weak var managerFirstField: UITextField!//First name of manager
    @IBOutlet weak var managerLastField: UITextField!//Last name of manager
    //Note: State and city can be removed, and added automatically, and a manager middle name can be included
    
    var id: Int!//A counter for restaurants
    var location: String = ""//Location of the restaurant
    var phone: String!//Restaurant phone number
    var website: String!//Restaurant phone number
    var restaurantName: String = ""// = newRestaurantField.text
    var restaurantObj = [PFObject]()//Restaurant name and manager
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let pull = PFQuery(className: "Restaurant")
        pull.includeKeys(["name", "managerLast", "managerFirst", "street", "city", "state", "zip"])
        //pull.coun
        
        pull.findObjectsInBackground { (title, error) in
            if title != nil {
                self.restaurantObj = title!
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return restaurantTitle.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantObj.count
    }
    
    /*
     Prepares the cell to show details requested (in our case, basic restaurant title)
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
        //let user = restaurantTitle[indexPath.row]["user"] as! PFObject
        let name = restaurantObj[indexPath.row]["name"] as! String
        //print("THE NAME: \(name)")
        let managerLast = restaurantObj[indexPath.row]["managerLast"] as! String
        let managerFirst = restaurantObj[indexPath.row]["managerFirst"] as! String
        let street = restaurantObj[indexPath.row]["street"] as! String
        let city = restaurantObj[indexPath.row]["city"] as! String
        let state = restaurantObj[indexPath.row]["state"] as! String
        let zip = restaurantObj[indexPath.row]["zip"] as! String
        
        let location = "\(street), \(city), \(state), \(zip)"
        let manager = "\(managerLast), \(managerFirst)"
        let title = "\(name) - \(manager)"
        
        cell.location.text = location
        cell.restaurant.text = title
        //cell.restaurant.test
        
        return cell
    }
    
    /*
     Uses parameters taken from storyboard to create a new restaurant object
     */
    @IBAction func onRestaurantSubmit(_ sender: Any) {
        //Check that all values are possible; classname will be restaurant-[Location]
        var street: String = "Default"
        var city: String = "Default"
        var state: String = "Default"
        var zip: String = "Default"
        var managerLast = "Default"
        var managerFirst = "Default"
        
        var restaurant = PFObject(className: "Restaurant")
        
        if !streetAddressField.text!.isEmpty {
            street = streetAddressField.text!
            print(street)
        }
        if !cityField.text!.isEmpty {
            city = cityField.text!
        }
        if !stateField.text!.isEmpty {
            state = stateField.text!
        }
        if !zipCodeField.text!.isEmpty {
            zip = zipCodeField.text!
        }
        if !managerFirstField.text!.isEmpty {
            managerFirst = managerFirstField.text!
        }
        if !managerLastField.text!.isEmpty {
            managerLast = managerLastField.text!
        }
        
        if (street == "Default" || city == "Default" || state == "Default" || zip == "Default" || managerFirst == "Default" || managerLast == "Default") {
            let alert = UIAlertController(title: "Missing Information", message: "You have not filled all of the blanks. Please go back and fill the blanks with required information.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (UIAlertAction) in
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            
            self.location = "\(street), \(city), \(state), \(zip)"
            let alert = UIAlertController(title: "Create New Restaurant", message: "You are about to add the restaurant \"\(restaurantName)\" at \(location). Are you sure you want to add this?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (UIAlertAction) in
                
                //Create new PFObject
                let restaurant = PFObject(className: "Restaurant")
                restaurant["name"] = self.restaurantName
                //restaurant["location"] = self.location
                restaurant["street"] = street
                restaurant["city"] = city
                restaurant["state"] = state
                restaurant["zip"] = zip
                restaurant["managerFirst"] = managerFirst
                restaurant["managerLast"] = managerLast
                
                restaurant.saveInBackground { (success, error) in
                    if success {
                        //self.dismiss(animated: true, completion: nil)
                        print("Saved")
                    } else {
                        print("\(error)")
                    }
                }
                
                
                
                self.restaurantLocationView.isHidden = true
                self.newRestaurantField.text = ""
                self.streetAddressField.text = ""
                self.cityField.text = ""
                self.stateField.text = ""
                self.zipCodeField.text = ""
                self.managerLastField.text = ""
                self.managerFirstField.text = ""
                print("Creating restaurant at: \(self.location)")
                print("Here")
                
            }))
            print("there")
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true, completion: nil)
            print("Again")
            
        }
        //Update the tableview
    }
    
    /*
     Cancels the restaurant creation
     */
    @IBAction func onCancel(_ sender: Any) {
        restaurantLocationView.isHidden = true
        print("Cancelling")
        //Wipe all the fields in the restLocView
    }
    
    /*
     Creates the new restaurant name
     */
    @IBAction func onSubmit(_ sender: Any) {
        
        if !newRestaurantField.text!.isEmpty {
            //print("The text: \(newRestaurantName!)")
            restaurantName = newRestaurantField.text!
            //showAlert(/*restaurantName: newRestaurantName*/)
            let alert = UIAlertController(title: "You Are About to Make a New Restaurant", message: "You are about to create a new restaurant \"\(restaurantName)\". Are you sure you want to continue?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (UIAlertAction) in
                self.restaurantLocationView.isHidden = false
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true, completion: nil)
        }
        //print("\(newRestaurantName!)")
    }
    
    //    func showAlert(/*restaurantName: String*/) {
    //
    //    }
    
    @IBAction func onBack(_ sender: Any) {
        print("An error?")//This may be cause of a warning about window heirachy
        performSegue(withIdentifier: "toMain", sender: nil)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("Transition from cell")
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let restaurant = restaurantObj[indexPath.row]
        let restaurantDetails = segue.destination as! RestaurantDetailViewController
        restaurantDetails.restaurantObj = restaurantObj
    }
    
}
