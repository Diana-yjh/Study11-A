//
//  ContentView.swift
//  Experiment_SwiftUI
//
//  Created by yagom-academy on 2023/05/01.
//

import SwiftUI

struct ContentView: View {
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            HStack {
                ToggleView()
                ToggleView()
            }
            HStack {
                ToggleView()
                ToggleView()
            }
        }
    }
}
