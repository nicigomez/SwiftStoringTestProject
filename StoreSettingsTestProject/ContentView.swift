//
//  ContentView.swift
//  StoreSettingsTestProject
//
//  Created by Nicolas Lerch on 12.01.23.
//

import SwiftUI

struct ContentView: View {
    @State private var isOpenString = false
    @State private var isOpenSettings = false
    
    
    var body: some View {
        VStack {
            Button("open String") {
                isOpenString.toggle()
            }
            Button("open Settings") {
                isOpenSettings.toggle()
            }
        }
        .padding()
        .sheet(isPresented: $isOpenString) {
            StringView()
        }
        .sheet(isPresented: $isOpenSettings) {
            SettingsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
