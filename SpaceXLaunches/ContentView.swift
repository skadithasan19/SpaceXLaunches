//
//  ContentView.swift
//  SpaceXLaunches
//
//  Created by Adit Hasan on 10/12/21.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        NavigationView {
          List {
            Text("Launch 1")
          }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
