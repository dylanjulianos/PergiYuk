//
//  GroupChatParty+CoreDataProperties.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 05/10/22.
//
//

import Foundation
import CoreData


extension GroupChatParty {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupChatParty> {
        return NSFetchRequest<GroupChatParty>(entityName: "GroupChatParty")
    }

    @NSManaged public var groupChatId: String?
    @NSManaged public var partyDescription: String?
    @NSManaged public var partyId: String?
    @NSManaged public var partyImageUrl: [String]?
    @NSManaged public var role: String?
    @NSManaged public var userId: [String]?
    @NSManaged public var vacationParty: NSSet?

}

// MARK: Generated accessors for vacationParty
extension GroupChatParty {

    @objc(addVacationPartyObject:)
    @NSManaged public func addToVacationParty(_ value: VacationParty)

    @objc(removeVacationPartyObject:)
    @NSManaged public func removeFromVacationParty(_ value: VacationParty)

    @objc(addVacationParty:)
    @NSManaged public func addToVacationParty(_ values: NSSet)

    @objc(removeVacationParty:)
    @NSManaged public func removeFromVacationParty(_ values: NSSet)

}

extension GroupChatParty : Identifiable {

}
