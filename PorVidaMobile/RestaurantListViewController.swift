//
//  RestaurantListViewController.swift
//  PorVidaMobile
//
//  Created by cory on 4/13/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import Parse

class RestaurantListViewController: UIViewController {
    @IBOutlet weak var newRestaurantField: UITextField!//Field that takes new restaurant name
    @IBOutlet weak var restaurantLocationView: UIView!//View that appears to create new restaurant; always starts as hidden
    @IBOutlet weak var streetAddressField: UITextField!//Restaurant street address
    @IBOutlet weak var cityField: UITextField!//Restaurant city
    @IBOutlet weak var stateField: UITextField!//Restaurant state; might not be neccessary
    @IBOutlet weak var zipCodeField: UITextField!//Restaurant zip code
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onRestaurantSubmit(_ sender: Any) {
        //Check that all values are possible; classname will be restaurant-[Location]
        print("Creating restaurant")
        //Update the tableview
    }
    
    @IBAction func onCancel(_ sender: Any) {
        restaurantLocationView.isHidden = true
        print("Cancelling")
        //Wipe all the fields in the restLocView
    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        let newRestaurantName: String// = newRestaurantField.text
        if !newRestaurantField.text!.isEmpty {
            //print("The text: \(newRestaurantName!)")
            newRestaurantName = newRestaurantField.text!
            showAlert(restaurantName: newRestaurantName)
        }
        //print("\(newRestaurantName!)")
    }
    
    func showAlert(restaurantName: String) {
        let alert = UIAlertController(title: "You Are About to Make a New Restaurant", message: "You are about to create a new restaurant \"\(restaurantName)\". Are you sure you want to continue?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (UIAlertAction) in
            self.restaurantLocationView.isHidden = false
            //self.createRestaurant()
            //print("Created new restaurant \(restaurantName)")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    //func createRestaurant() {}
    
    func updateView() {}
    
    
    @IBAction func onBack(_ sender: Any) {
        performSegue(withIdentifier: "toMain", sender: nil)
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
