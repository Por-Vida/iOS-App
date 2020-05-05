//
//  EditInfoViewController.swift
//  PorVidaMobile
//
//  Created by cory on 5/3/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit

class EditInfoViewController: UIViewController {
//    @IBOutlet weak var monAMStep: UIStepper!
//    @IBOutlet weak var monPMStep: UIStepper!
//    @IBOutlet weak var tueAMStep: UIStepper!
//    @IBOutlet weak var tuePMStep: UIStepper!
//    @IBOutlet weak var wedAMStep: UIStepper!
//    @IBOutlet weak var wedPMStep: UIStepper!
//    @IBOutlet weak var thurAMStep: UIStepper!
//    @IBOutlet weak var thurPMStep: UIStepper!
//    @IBOutlet weak var friAMStep: UIStepper!
//    @IBOutlet weak var friPMStep: UIStepper!
//    @IBOutlet weak var satAMStep: UIStepper!
//    @IBOutlet weak var satPMStep: UIStepper!
//    @IBOutlet weak var sunAMStep: UIStepper!
//    @IBOutlet weak var sunPMStep: UIStepper!
//
//    @IBOutlet weak var monAMLabel: UILabel!
//    @IBOutlet weak var monPMLabel: UILabel!
//    @IBOutlet weak var tueAMLabel: UILabel!
//    @IBOutlet weak var tuePMLabel: UILabel!
//    @IBOutlet weak var wedAMLabel: UILabel!
//    @IBOutlet weak var wedPMLabel: UILabel!
//    @IBOutlet weak var thurAMLabel: UILabel!
//    @IBOutlet weak var thurPMLabel: UILabel!
//    @IBOutlet weak var friAMLabel: UILabel!
//    @IBOutlet weak var friPMLabel: UILabel!
//    @IBOutlet weak var satAMLabel: UILabel!
//    @IBOutlet weak var satPMLabel: UILabel!
//    @IBOutlet weak var sunAMLabel: UILabel!
//    @IBOutlet weak var sunPMLabel: UILabel!
//
//    @IBOutlet weak var websiteField: UITextField!
//    @IBOutlet weak var phoneNumField: UITextField!
    
    var monAMMin = 0
    var monAMHour = 1
    var loadmonAM = true
    var currentmonAM: Int!
    var lastmonAM: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
//    @IBAction func onMonAMStep(_ sender: UIStepper) {
//
//
//        monAMMin = Int(sender.value)
//        print("Sender: \(sender.value)")
//
//        if monAMMin % 60 == 0 {
//            monAMHour += 1
//            monAMMin = 0
//        } else {
//            monAMMin = 30
//        }
//
//        print("\(monAMHour):\(monAMMin)")
//    }
    
    
    
    @IBAction func onBack(_ sender: Any) {
        //Save whatever is in the fields
        dismiss(animated: true, completion: nil)
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
