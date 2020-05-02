//
//  mapRestaurant.swift
//  PorVidaMobile
//
//  Created by Jonathan on 5/2/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import MapKit
import UIKit

class mapRestaurant: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String

    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
