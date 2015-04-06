//
//  VacationDestination.swift
//  VacationDestination
//
//  Created by Elaine Reyes on 4/6/15.
//  Copyright (c) 2015 UlyssaElaine. All rights reserved.
//

import Foundation
import CoreData

class Destination: NSManagedObject {

    @NSManaged var lati: NSNumber
    @NSManaged var latiDelta: NSNumber
    @NSManaged var longi: NSNumber
    @NSManaged var longiDelta: NSNumber
    @NSManaged var name: String

}
