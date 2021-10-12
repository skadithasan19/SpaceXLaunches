//
//  ContentView.swift
//  SpaceXLaunches
//
//  Created by Adit Hasan on 10/12/21.
//

import SwiftUI
import CoreData

struct Launches: View {
  @StateObject var viewModel = LaunchesViewModel()
  
  var body: some View {
    NavigationView {
      List {
        ForEach(self.viewModel.pastLaunches, id: \.id) { launch in
          LaunchCellView(launch: launch)
        }
        if self.viewModel.showLoadMore {
          ProgressView().frame(maxWidth: .infinity)
            .onAppear {
              self.viewModel.loadLaunchDetails()
            }
        }
      }.navigationBarTitle(Text("SpaceX launches (\(viewModel.totalResultsCount))"), displayMode: .inline)
    }
  }
}
struct Launches_Previews: PreviewProvider {
    static var previews: some View {
      Launches()
    }
}
