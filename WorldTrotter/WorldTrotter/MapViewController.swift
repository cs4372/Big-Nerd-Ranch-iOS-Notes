//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Catherine Shing on 12/24/22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        // Set map view in this view controller
        view = mapView
        
        setupMapType()
        setupCurrentLocation()
        addPins()
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
    }
    
    private func setupMapType() {
        let segmentedControl
                   = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
           segmentedControl.backgroundColor
                   = UIColor.white.withAlphaComponent(0.5)
           segmentedControl.selectedSegmentIndex = 0
           segmentedControl.translatesAutoresizingMaskIntoConstraints = false
           segmentedControl.addTarget(self,
                                     action: #selector(MapViewController.mapTypeChanged(_:)),
       for: .valueChanged)
           view.addSubview(segmentedControl)
        
        // Style map type control
        let topConstraint =
            segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor,
        constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint =
            segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint =
            segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    private func setupCurrentLocation() {
        manager.requestAlwaysAuthorization()
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = kCLDistanceFilterNone
        manager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    private func addPins() {
        let pin1 = MKPointAnnotation()
        let pin2 = MKPointAnnotation()
        let pin3 = MKPointAnnotation()

        pin1.title = "Miami"
        pin1.coordinate = CLLocationCoordinate2D(latitude: 25.761681, longitude: -80.139198)
        pin2.title = "Toronto"
        pin2.coordinate = CLLocationCoordinate2D(latitude: 43.651070, longitude: -79.347015)
        pin3.title = "New Orleans"
        pin3.coordinate = CLLocationCoordinate2D(latitude: 29.9510658, longitude: -90.0715323)
        mapView.addAnnotation(pin1)
        mapView.addAnnotation(pin2)
        mapView.addAnnotation(pin3)
    }
}
