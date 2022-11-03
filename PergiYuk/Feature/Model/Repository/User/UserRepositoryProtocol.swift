//
//  Protocol.swift
//  PergiYuk
//
//  Created by octavianus on 03/11/22.
//

import Foundation
import Combine

protocol UserRepository{
    func getUser(email: String) -> Future<User,Error>
    func addUser(user: User) -> Future<User,Error>
    func removeUser(email: String) -> Future<User,Error>
}

enum UserRepositoryError: Error{
    case UserAlreadyExists
    case UserNotFound
    case UserIsBanned
}
