//
//  ViewController.swift
//  App_Map2
//
//  Created by CICE on 5/4/16.
//  Copyright © 2016 CICE. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

enum MapType : Int {
    case standard = 0
    case satellite = 1
    case hybrid = 2
}


class ViewController: UIViewController {
    
    var locationManager = CLLocationManager()
    
    //MARK: - IOBOUNDS
    @IBOutlet weak var mapMyMap: MKMapView!
    @IBOutlet weak var labelShowData: UILabel!
    @IBOutlet weak var selectMapType: UISegmentedControl!
    
    //MARK: - IOACTIONS
    @IBAction func buttonClicked(sender: AnyObject) {
        super.viewDidLoad()
        //crear manualmente una posicion
        let latitude = 3.117116
        let longitude = 101.691636
        let latDelta = 0.005
        let lngDelta = 0.005
        let location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        locationManager.pausesLocationUpdatesAutomatically = true
        mapMyMap.setRegion(region, animated: true)
    }
    
    
    @IBAction func mapTypeChanged(sender: AnyObject) {
        let mapType = MapType(rawValue: selectMapType.selectedSegmentIndex)
        
        switch(mapType!){
        case.standard:
            mapMyMap.mapType = MKMapType.Standard
        case.satellite:
            mapMyMap.mapType = MKMapType.Satellite
        case.hybrid:
            mapMyMap.mapType = MKMapType.Hybrid
            break
        }
    }

    //MARK: - LIFE VIEW CONTROLLER
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = CLLocationAccuracy.
            locationManager.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: - DELEGATE
extension  ViewController : CLLocationManagerDelegate{
}

