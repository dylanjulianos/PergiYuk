//
//  VacationPartyRepositoryProtocol.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 07/11/22.
//

import Foundation
import Combine

protocol VacationPartyRepository{
    func getAllParty() -> Future<[VacationParty],Error>
    func addParty(party: VacationParty) -> Future<[VacationParty],Error>
    func removeParty(party: VacationParty) -> Future<VacationParty,Error>
}

// Ini apa aja ya?
enum VacationPartyRepositoryError: Error{
    case PartyNotFound
    case PartyAlreadyExists
    case PartyNotValid
}
