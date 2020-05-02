//
//  RestauarantDisplayViewController.swift
//  PorVidaMobile
//
//  Created by Christian on 4/18/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import Parse



class RestauarantDisplayViewController: UIViewController/*, UITableViewDelegate, UITableViewDataSource*/ {
    
    var Restaurant = [PFObject]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sampleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateTableview()
    }
    
    func updateTableview() {
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
//                self.restaurantObj = title!
//                self.tableView.reloadData()
//            }
//        }
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
    @IBAction func toRestaurantList(_ sender: Any) {
        
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
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

