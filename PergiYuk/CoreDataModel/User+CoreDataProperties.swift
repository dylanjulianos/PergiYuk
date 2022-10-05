//
//  User+CoreDataProperties.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 05/10/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int16
    @NSManaged public var descriptionImageUrl: String?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var profileImageUrl: String?
    @NSManaged public var role: String?
    @NSManaged public var status: String?
    @NSManaged public var userDescription: String?
    @NSManaged public var userId: String?
    @NSManaged public var username: String?
    @NSManaged public var parties: NSSet?

}

// MARK: Generated accessors for parties
extension User {

    @objc(addPartiesObject:)
    @NSManaged public func addToParties(_ value: VacationParty)

    @objc(removePartiesObject:)
    @NSManaged public func removeFromParties(_ value: VacationParty)

    @objc(addParties:)
    @NSManaged public func addToParties(_ values: NSSet)

    @objc(removeParties:)
    @NSManaged public func removeFromParties(_ values: NSSet)

}

extension User : Identifiable {

}
