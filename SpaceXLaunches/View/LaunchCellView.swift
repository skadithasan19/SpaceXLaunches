//
//  LaunchCellView.swift
//  SpaceXLaunches
//
//  Created by Adit Hasan on 10/12/21.
//

import SwiftUI

struct LaunchCellView: View {
  public typealias LaunchesPastQuery = PastLaunchesQuery.Data.LaunchesPast
  var launch: LaunchesPastQuery
  var body: some View {
    NavigationLink(destination: LauncheDetailVIew(launch: launch)) {
      HStack {
        UrlImageView(urlString: launch.links?.missionPatchSmall)
          .frame(width: 100, height: 100, alignment: .center)
        VStack(alignment: .leading, spacing: 5) {
          Text(launch.missionName ?? "")
            .font(.headline)
          Text(launch.launchSite?.siteNameLong ?? "")
            .font(.subheadline)
          Text(launch.launchDateLocal?.transformDateToString() ?? "")
            .font(.footnote)
            .fontWeight(.medium)
        }
      }
    }
  }
}

//struct LaunchCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchCellView()
//    }
//}
