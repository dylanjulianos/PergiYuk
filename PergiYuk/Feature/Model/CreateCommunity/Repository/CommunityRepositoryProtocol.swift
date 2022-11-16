//
//  CommunityRepositoryProtocol.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 16/11/22.
//

import Foundation
import Combine

protocol CommunityRepository{
    func getAllCommunity() -> AnyPublisher<[CreateCommunity],Error>
    func addCommunity(community: CreateCommunity) -> AnyPublisher<[CreateCommunity],Error>
}

enum CommunityRepositoryError: Error{
    case CommunityNotFound
    case CommunityAlreadyExists
    case CommunityNotValid
}
