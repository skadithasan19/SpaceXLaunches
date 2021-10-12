//
//  LaunchesViewModel.swift
//  SpaceXLaunches
//
//  Created by Adit Hasan on 10/12/21.
//

import Foundation
import Apollo

class LaunchesViewModel : ObservableObject {
  public typealias LaunchesPastQuery = PastLaunchesQuery.Data.LaunchesPast
  @Published var pastLaunches = [LaunchesPastQuery]()
  @Published var showLoadMore = true
  private var currentPage = 0
  @Published var totalResultsCount = 0
  func loadLaunchDetails() {
    
    let cachePolicy: CachePolicy = .returnCacheDataElseFetch
    
    GraphAPICall.shared.apollo.fetch(query: PastLaunchesQuery(Offset: currentPage, Limit: 10), cachePolicy: cachePolicy) { [weak self] result in
      guard let self = self else { return }
      
      DispatchQueue.main.async {
        switch result {
        case .failure(let error):
          print(error.localizedDescription)
        case .success(let graphQLResult):
          if let launch = graphQLResult.data?.launchesPast {
            self.pastLaunches += launch.compactMap({ $0 })
            self.pastLaunches.sort(by: { $0.launchDateLocal?.transformToDate().compare($1.launchDateLocal?.transformToDate() ?? Date()) == .orderedDescending})
            self.totalResultsCount = self.pastLaunches.count
            self.currentPage += 1
          } else {
            print("No More Results")
            self.showLoadMore = false
          }
        }
      }
    }
  }
}
