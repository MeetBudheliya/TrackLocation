//
//  ViewController.swift
//  LocationDemo
//
//  Created by Meet's MAC on 03/08/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    private let latLngLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemFill
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26)
        return label
    }()

    private var locationManager:CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        latLngLabel.frame = CGRect(x: 20, y: view.bounds.height / 2 - 50, width: view.bounds.width - 40, height: 100)
        view.addSubview(latLngLabel)

        getUserLocation()
    }


    func getUserLocation() {
         locationManager = CLLocationManager()
         locationManager?.requestAlwaysAuthorization()
         locationManager?.startUpdatingLocation()
        locationManager?.allowsBackgroundLocationUpdates = true
        locationManager?.delegate = self
     }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            latLngLabel.text = "Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)"
            print("Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)")
        }
    }
}

