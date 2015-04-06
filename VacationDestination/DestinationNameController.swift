//
//  DestinationNameController.swift
//  VacationDestination
//
//  Created by Elaine Reyes on 4/6/15.
//  Copyright (c) 2015 UlyssaElaine. All rights reserved.
//

import UIKit

class DestinationNameController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mapSegue" {
            let mapController = segue.destinationViewController as MapViewController
            mapController.destinationName = self.nameTextField.text
        }
    }
}
