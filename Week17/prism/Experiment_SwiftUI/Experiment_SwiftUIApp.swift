//
//  Experiment_SwiftUIApp.swift
//  Experiment_SwiftUI
//
//  Created by yagom-academy on 2023/05/01.
//

import SwiftUI

@main
struct Experiment_SwiftUIApp: App {
    @StateObject var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
        }
    }
}
