//
//  EditInfoViewController.swift
//  PorVidaMobile
//
//  Created by cory on 5/3/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import Parse

class EditInfoViewController: UIViewController {
    var restaurant: PFObject!
    
    @IBOutlet weak var websiteUrlField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    
    @IBOutlet weak var monHrLeft: UITextField!
    @IBOutlet weak var monMinLeft: UITextField!
    @IBOutlet weak var monHrRight: UITextField!
    @IBOutlet weak var monMinRight: UITextField!
    
    @IBOutlet weak var tueHrLeft: UITextField!
    @IBOutlet weak var tueMinLeft: UITextField!
    @IBOutlet weak var tueHrRight: UITextField!
    @IBOutlet weak var turMinRight: UITextField!
    
    @IBOutlet weak var wedHrLeft: UITextField!
    @IBOutlet weak var wedMinLeft: UITextField!
    @IBOutlet weak var wedHrRight: UITextField!
    @IBOutlet weak var wedMinRight: UITextField!
    
    @IBOutlet weak var thurHrLeft: UITextField!
    @IBOutlet weak var thurMinLeft: UITextField!
    @IBOutlet weak var thurHrRight: UITextField!
    @IBOutlet weak var thurMinRight: UITextField!
    
    @IBOutlet weak var friHrLeft: UITextField!
    @IBOutlet weak var friMinLeft: UITextField!
    @IBOutlet weak var friHrRight: UITextField!
    @IBOutlet weak var firMinRight: UITextField!
    
    @IBOutlet weak var satHrLeft: UITextField!
    @IBOutlet weak var satMinLeft: UITextField!
    @IBOutlet weak var satHrRight: UITextField!
    @IBOutlet weak var satMinRight: UITextField!
    
    @IBOutlet weak var sunHrLeft: UITextField!
    @IBOutlet weak var sunMinLeft: UITextField!
    @IBOutlet weak var sunHrRight: UITextField!
    @IBOutlet weak var sunMinRight: UITextField!
    
    @IBOutlet weak var monLeftSwitch: UISwitch!
    @IBOutlet weak var monRightSwitch: UISwitch!
    @IBOutlet weak var tueLeftSwitch: UISwitch!
    @IBOutlet weak var tueRightSwitch: UISwitch!
    @IBOutlet weak var wedLeftSwitch: UISwitch!
    @IBOutlet weak var wedRightSwitch: UISwitch!
    @IBOutlet weak var thurLeftSwitch: UISwitch!
    @IBOutlet weak var thurRightSwitch: UISwitch!
    @IBOutlet weak var friLeftSwitch: UISwitch!
    @IBOutlet weak var friRightSwitch: UISwitch!
    @IBOutlet weak var satLeftSwitch: UISwitch!
    @IBOutlet weak var satRightSwitch: UISwitch!
    @IBOutlet weak var sunLeftSwitch: UISwitch!
    @IBOutlet weak var sunRightSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set textFields to some pulled object to insert existing operating hours
        //satLeftSwitch.setOn(<#T##on: Bool##Bool#>, animated: <#T##Bool#>)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func onSaveAndBack(_ sender: Any) {
        let monHrLeft = self.monHrLeft.text ?? ""
        let monMinLeft = self.monMinLeft.text ?? ""
        let monHrRight = self.monHrRight.text ?? ""
        let monMinRight = self.monMinLeft.text ?? ""
        
        let tueHrLeft = self.tueHrLeft.text ?? ""
        let tueMinLeft = self.tueMinLeft.text ?? ""
        let tueHrRight = self.tueHrRight.text ?? ""
        let tueMinRight = self.tueMinLeft.text ?? ""
        
        let wedHrLeft = self.wedHrLeft.text ?? ""
        let wedMinLeft = self.wedMinLeft.text ?? ""
        let wedHrRight = self.wedHrRight.text ?? ""
        let wedMinRight = self.wedMinLeft.text ?? ""
        
        let thurHrLeft = self.thurHrLeft.text ?? ""
        let thurMinLeft = self.thurMinLeft.text ?? ""
        let thurHrRight = self.thurHrRight.text ?? ""
        let thurMinRight = self.thurMinLeft.text ?? ""
        
        let friHrLeft = self.friHrLeft.text ?? ""
        let friMinLeft = self.friMinLeft.text ?? ""
        let friHrRight = self.friHrRight.text ?? ""
        let friMinRight = self.friMinLeft.text ?? ""
        
        let satHrLeft = self.satHrLeft.text ?? ""
        let satMinLeft = self.satMinLeft.text ?? ""
        let satHrRight = self.satHrRight.text ?? ""
        let satMinRight = self.satMinLeft.text ?? ""
        
        let sunHrLeft = self.sunHrLeft.text ?? ""
        let sunMinLeft = self.sunMinLeft.text ?? ""
        let sunHrRight = self.sunHrRight.text ?? ""
        let sunMinRight = self.sunMinLeft.text ?? ""
        
        var monLeftBool = monLeftSwitch.isOn
        var monRightBool = monRightSwitch.isOn
        var tueLeftBool = tueLeftSwitch.isOn
        var tueRightBool = tueRightSwitch.isOn
        var wedLeftBool = wedLeftSwitch.isOn
        var wedRightBool = wedRightSwitch.isOn
        var thurLeftBool = thurLeftSwitch.isOn
        var thurRightBool = thurRightSwitch.isOn
        var friLeftBool = friLeftSwitch.isOn
        var friRightBool = friRightSwitch.isOn
        var satLeftBool = satLeftSwitch.isOn
        var satRightBool = satRightSwitch.isOn
        var sunLeftBool = sunLeftSwitch.isOn
        var sunRightBool = sunRightSwitch.isOn
        
        if Int(monHrLeft) == nil || Int(monMinLeft) == nil || Int(monHrRight) == nil || Int(monMinRight) == nil || Int(tueHrLeft) == nil || Int(tueMinLeft) == nil || Int(tueHrRight) == nil || Int(tueMinRight) == nil || Int(wedHrLeft) == nil || Int(wedMinLeft) == nil || Int(wedHrRight) == nil || Int(wedMinRight) == nil || Int(thurHrLeft) == nil || Int(thurMinLeft) == nil || Int(thurHrRight) == nil || Int(thurMinRight) == nil || Int(friHrLeft) == nil || Int(friMinLeft) == nil || Int(friHrRight) == nil || Int(friMinRight) == nil || Int(satHrLeft) == nil || Int(satMinLeft) == nil || Int(satHrRight) == nil || Int(satMinRight) == nil || Int(sunHrLeft) == nil || Int(sunMinLeft) == nil || Int(sunHrRight) == nil || Int(sunMinRight) == nil {
            let alert = UIAlertController(title: "Incomplete Fields", message: "Please fill out the operating hours table to save and complete the form.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            print(restaurant["name"] as! String)
        } else {
            
            let hours = PFObject(className: "Hours")
            
            hours["monHourFirst"] = monHrLeft
            hours["monMinFirst"] = monMinLeft
            hours["monHourSecond"] = monHrRight
            hours["monMinSecond"] = monMinRight
            
            hours["tueHourFirst"] = tueHrLeft
            hours["tueMinFirst"] = tueMinLeft
            hours["tueHourSecond"] = tueHrRight
            hours["tueMinSecond"] = tueMinRight
            
            hours["wedHourFirst"] = wedHrLeft
            hours["wedMinFirst"] = wedMinLeft
            hours["wedHourSecond"] = wedHrRight
            hours["wedMinSecond"] = wedMinRight
            
            hours["thurHourFirst"] = thurHrLeft
            hours["thurMinFirst"] = thurMinLeft
            hours["thurHourSecond"] = thurHrRight
            hours["thurMinSecond"] = thurMinRight
            
            hours["friHourFirst"] = friHrLeft
            hours["friMinFirst"] = friMinLeft
            hours["friHourSecond"] = friHrRight
            hours["friMinSecond"] = friMinRight
            
            hours["satHourFirst"] = satHrLeft
            hours["satMinFirst"] = satMinLeft
            hours["satHourSecond"] = satHrRight
            hours["satMinSecond"] = satMinRight
            
            hours["sunHourFirst"] = sunHrLeft
            hours["sunMinFirst"] = sunMinLeft
            hours["sunHourSecond"] = sunHrRight
            hours["sunMinSecond"] = sunMinRight
            
            hours["restaurant"] = self.restaurant
            
            let website = websiteUrlField.text ?? ""
            let phone = phoneNumberField.text ?? ""
            
            self.restaurant.add(hours, forKey: "Hours")
            self.restaurant.add(website, forKey: "website")
            self.restaurant.add(phone, forKey: "phone")
            self.restaurant.saveInBackground { (success, error) in
                if success {
                    print("Complete of upload")
                } else {
                    print("Faile to upload details")
                }
            }
            
            self.dismiss(animated: true, completion: nil)
            //reload
        }
    }
    
    @IBAction func onBack(_ sender: Any) {
        let alert = UIAlertController(title: "Unsaved Changes", message: "You are about to go back to the previous page without saving. Are you sure you want to continue?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
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
