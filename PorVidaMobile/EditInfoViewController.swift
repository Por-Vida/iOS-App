//
//  EditInfoViewController.swift
//  PorVidaMobile
//
//  Created by cory on 5/3/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit

class EditInfoViewController: UIViewController {
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
        
        print("Test text")
        if Int(monHrLeft) == nil || Int(monMinLeft) == nil || Int(monHrRight) == nil || Int(monMinRight) == nil || tueHrLeft == "Empty" || tueMinLeft == "Empty" || tueHrRight == "Empty" || tueMinRight == "Empty" || wedHrLeft == "Empty" || wedMinLeft == "Empty" || wedHrRight == "Empty" || wedMinRight == "Empty" || thurHrLeft == "Empty" || thurMinLeft == "Empty" || thurHrRight == "Empty" || thurMinRight == "Empty" || friHrLeft == "Empty" || friMinLeft == "Empty" || friHrRight == "Empty" || friMinRight == "Empty" || satHrLeft == "Empty" || satMinLeft == "Empty" || satHrRight == "Empty" || satMinRight == "Empty" || sunHrLeft == "Empty" || sunMinLeft == "Empty" || sunHrRight == "Empty" || sunMinRight == "Empty" {
            print("Is not full")
        } else {
            print(Int(monHrLeft)!)
        }
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
