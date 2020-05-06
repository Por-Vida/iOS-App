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
    
    
    
    
    // Function to add the user's current location to the map and center the map view on the user
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        currentLatitude = location.coordinate.latitude
        currentLongitude = location.coordinate.longitude
        let center = CLLocationCoordinate2D(latitude: currentLatitude, longitude: currentLongitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        
        let userLocation = MKPointAnnotation()
        userLocation.coordinate.latitude = currentLatitude
        userLocation.coordinate.longitude = currentLongitude
        userLocation.title = "Current Location"
        mapView.addAnnotation(userLocation)
        
        mapView.setRegion(region, animated: true)
        
        
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
