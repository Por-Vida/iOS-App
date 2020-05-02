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
    
    @IBOutlet weak var tableView: UITableView!
    var restaurant: PFObject!
    override func viewDidLoad() {
        super.viewDidLoad()
//       tableView.delegate = self
//       tableView.dataSource = self
        // Do any additional setup after loading the view.
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
