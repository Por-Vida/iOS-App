//
//  RestauarantDisplayViewController.swift
//  PorVidaMobile
//
//  Created by Christian on 4/18/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import Parse



class RestauarantDisplayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    var Restaurant = [PFObject]()
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    

    
    @IBOutlet weak var sampleLabel: UILabel!

    
    //let toys = [String : [String : String]] = [[:]]
        //Dictionary<String, Dictionary<String, String>> = [[:]]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      let query = PFQuery(className: "Restaurant")
      
        query.includeKeys(["zip","street","managerFirst", "managerLast","city","name","phone","state","website","id","lunchMeal", "Meals","logo_path"])
      
      query.findObjectsInBackground {(Restaurant, error) in
          if Restaurant != nil {
            //  self.resturantss = restaurantss!
            self.Restaurant = Restaurant!
            self.tableView.reloadData()
          }
      }
      
     }
    
   // override func viewDidDisappear(_ animated: Bool) {
      //  super.viewDidAppear(animated)
        
  //  }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return resturantss.count
        return Restaurant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayCell", for: indexPath) as! DisplayCell
        let name = Restaurant[indexPath.row]["name"] as! String
       // let baseUrl = "https://www.porvidasa.com/portals/7/images/Restaurants"
        //let logoPath = Restaurant["logo_path"] as! String
       // let logoUrl = URL(string: baseUrl + logoPath)!
        //cell.logoView.af_setImage(withURL: logoUrl)
        cell.restaurantName.text = name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = Restaurant[indexPath.section]
        //let selectedPet = pet["name"] as? [PFObject]
        //selectedPet = petname
    }
    
    
        
  //  }
   

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Find selected restaurant
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let restaurant = Restaurant[indexPath.row]
        // Pass the selected restaurant over to next view controller
        let detailsVC = segue.destination as! MenuDetailsViewController
        detailsVC.restaurant = restaurant
        //detailsVC.selectedPet = selectedPet
        //tableView.deselectRow(at: IndexPath, animated: true)
    }
    
    
    
}

