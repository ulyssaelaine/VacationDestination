//
//  MapViewController.swift
//  VacationDestination
//
//  Created by Elaine Reyes on 4/6/15.
//  Copyright (c) 2015 UlyssaElaine. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var destinationName = ""
    var locationManager : CLLocationManager?
    var firstTime = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager?.requestWhenInUseAuthorization()
        
        self.locationManager?.delegate = self
        self.locationManager?.startUpdatingLocation()

        //self.map.showsUserLocation = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if self.firstTime{
            let region = MKCoordinateRegionMakeWithDistance(self.locationManager!.location.coordinate, 20000,20000)
            self.map.setRegion(region, animated: true)
            self.firstTime = false
        }
        
    }
    
    @IBAction func saveTapped(sender: AnyObject) {
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!

        var destination1 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as Destination
        destination1.name = self.destinationName
        destination1.lati = self.map.region.center.latitude
        destination1.longi = self.map.region.center.longitude
        destination1.latiDelta = self.map.region.span.latitudeDelta
        destination1.longiDelta = self.map.region.span.longitudeDelta
        
        context.save(nil)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
