//
//  MenuDetailsViewController.swift
//  PorVidaMobile
//
//  Created by Christian on 5/2/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import Parse

class MenuDetailsViewController: UIViewController {
    
    var restaurant: PFObject!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("INSIDE: \(restaurant["name"] as! String)")
//       tableView.delegate = self
//       tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBack(_ sender: Any) {
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