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
import Parse

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    @Published var currentLatitude: Double = 0.0
    @Published var currentLongitude: Double = 0.0
    
    var restaurants = [PFObject]()
    var mapRestaurants = [mapRestaurant]()
    
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
        
        // Creating the restaurants for the map:
        let query = PFQuery(className: "Restaurant")
                
        // Query to get all of the restaurants into a usable array
        do {
            restaurants = try query.findObjects()
        } catch {
            print("error")
        }
    }
    
    // Function to add the user's current location to the map and center the map view on the user
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        currentLatitude = location.coordinate.latitude
        currentLongitude = location.coordinate.longitude
        
        let userLocation = MKPointAnnotation()
        userLocation.coordinate.latitude = currentLatitude
        userLocation.coordinate.longitude = currentLongitude
        userLocation.title = "Current Location"
        mapView.addAnnotation(userLocation)
        
        let center = CLLocationCoordinate2D(latitude: currentLatitude, longitude: currentLongitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
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

    override func viewDidAppear(_ animated: Bool) {
        
        // For loop to create a map object for each restaurant in the array
        for index in restaurants {
            
            // Restaurant name on the map
            let name = index["name"] as! String
            
            // Getting the restaurant's coordinates for the map
            let lat = index["latitude"] as! Double
            let long = index["longitude"] as! Double
            let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
            
            // Testing the coordinates
            print("location")
            
            // information is required to add an annotation
            let information = index["name"] as! String
            
            // Creating the restaurant
            mapRestaurants.append(mapRestaurant(title: name, coordinate: location, info: information))
            
            // Creating the annotation
            let restaurantAnnotation = MKPointAnnotation()
            restaurantAnnotation.coordinate.latitude = lat
            restaurantAnnotation.coordinate.longitude = long
            restaurantAnnotation.title = name
            
            // Adding the Restaurants to the map
            mapView.addAnnotation(restaurantAnnotation)
        }
    }
}

