//
//  VacationParty+CoreDataProperties.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 05/10/22.
//
//

import Foundation
import CoreData


extension VacationParty {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VacationParty> {
        return NSFetchRequest<VacationParty>(entityName: "VacationParty")
    }

    @NSManaged public var partyDescription: String?
    @NSManaged public var partyImageUrl: [String]?
    @NSManaged public var role: String?
    @NSManaged public var maximumUser: Int16
    @NSManaged public var users: NSSet?
    @NSManaged public var partyGroupChat: GroupChatParty?

}

// MARK: Generated accessors for users
extension VacationParty {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

extension VacationParty : Identifiable {

}
