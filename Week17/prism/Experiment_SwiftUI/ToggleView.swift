//
//  EnvironmentToggleView.swift
//  Experiment_SwiftUI
//
//  Created by yagom-academy on 2023/05/01.
//

import SwiftUI

struct ToggleView: View {
    @State private var isStateToggleOn: Bool = false
    @EnvironmentObject var dataModel: DataModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 2)
                .foregroundColor(.red)
            
            VStack {
                Text("State \(isStateToggleOn ? "On" : "Off")")

                VStack {
                    Toggle("State", isOn: $isStateToggleOn)
                        .padding()
                    Toggle("Environment", isOn: $dataModel.isToggleOn)
                        .padding()
                }
            }
        }
        .padding()
    }
}
