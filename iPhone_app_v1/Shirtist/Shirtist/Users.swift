//
//  Users.swift
//  Shirtist
//
//  Created by Ravi Shankar Jha on 06/12/15.
//  Copyright © 2015 Ravi Shankar Jha. All rights reserved.
//

import UIKit
import CoreData

class Users: NSManagedObject {

    @NSManaged var userName: String
    @NSManaged var password: String
    @NSManaged var email: String
    @NSManaged var dateOfBirth: NSDate
    
}
