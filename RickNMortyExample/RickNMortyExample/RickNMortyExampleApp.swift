//
//  RickNMortyExampleApp.swift
//  RickNMortyExample
//
//  Created by Maksim Ponomarev on 16/06/2022.
//

import SwiftUI

@main
struct RickNMortyExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                CustomTab()
                    .navigationBarHidden(true)
                //ContentView()
                //    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            
        }
    }
}
