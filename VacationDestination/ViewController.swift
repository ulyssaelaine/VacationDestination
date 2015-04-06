//
//  ViewController.swift
//  VacationDestination
//
//  Created by Elaine Reyes on 4/6/15.
//  Copyright (c) 2015 UlyssaElaine. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var destinations: [Destination] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //createDestinations()
    }

    override func viewWillAppear(animated: Bool) {
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        var request = NSFetchRequest(entityName: "Destination")
        self.destinations = context.executeFetchRequest(request, error: nil)! as [Destination]
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createDestinations(){
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        
        
        var destination1 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as Destination
        destination1.name = "Tokyo"
        destination1.lati = 35.726038
        destination1.longi = 139.73199
        destination1.latiDelta = 5
        destination1.longiDelta = 5
        
        var destination2 = NSEntityDescription.insertNewObjectForEntityForName("Destination", inManagedObjectContext: context) as Destination
        destination2.name = "Provo"
        destination2.lati = 40.23384
        destination2.longi = -111.65853
        destination1.latiDelta = 1
        destination1.longiDelta = 1
        
        context.save(nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.destinations.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var destination = self.destinations[indexPath.row]
        var cell = self.tableView.dequeueReusableCellWithIdentifier("mapCell") as MapCell
        cell.nameLabel.text = destination.name
        
        var coordinate = CLLocationCoordinate2DMake(destination.lati.doubleValue, destination.longi.doubleValue)
        var span = MKCoordinateSpanMake(destination.latiDelta.doubleValue, destination.longiDelta.doubleValue)
        var region = MKCoordinateRegionMake(coordinate, span)
        cell.mapView.setRegion(region, animated: false)
        
        return cell
    }

}

