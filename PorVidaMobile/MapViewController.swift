//
//  MapViewController.swift
//  PorVidaMobile
//
//  Created by Jonathan on 5/1/20.
//  Copyright © 2020 BigByteDevelopment. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!

    let locationManager = CLLocationManager()
    @Published var currentLatitude: Double = 0.0
    @Published var currentLongitude: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        // Enabling the location manager:
        // Requesting authorization:
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }

        // Setting up the map view
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true

        
        // Creating one test pin
        let mcdonalliesOne = mapRestaurant(title: "McDonallies", coordinate: CLLocationCoordinate2D(latitude: 29.884420, longitude: -97.714650), info: "Test McDonalds")
        
        // Adding it to the map view
        mapView.addAnnotation(mcdonalliesOne)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            self.mapView.setRegion(region, animated: true)
        }
        
        guard let location = locations.last else { return }
        currentLatitude = location.coordinate.latitude
        currentLongitude = location.coordinate.longitude
        
        let userLocation = MKPointAnnotation()
        userLocation.coordinate.latitude = currentLatitude
        userLocation.coordinate.longitude = currentLongitude
        userLocation.title = "Current Location"
        mapView.addAnnotation(userLocation)
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
