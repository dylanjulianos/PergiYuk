//
//  PergiYukApp.swift
//  PergiYuk
//
//  Created by Anastasia Agustine on 23/09/22.
//

import SwiftUI

@main
struct PergiYukApp: App {
    @StateObject private var dataController = CoreDataController()
    var body: some Scene {
        WindowGroup {
            SignUpView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
