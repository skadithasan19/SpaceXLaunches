//
//  LauncheDetailVIew.swift
//  SpaceXLaunches
//
//  Created by Adit Hasan on 10/12/21.
//

import SwiftUI
import SafariServices

struct LauncheDetailVIew: View {
  
  public typealias LaunchesPastQuery = PastLaunchesQuery.Data.LaunchesPast
  var launch: LaunchesPastQuery
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Button(action: {
        self.openLinkToSafariView(urlString: (launch.links?.videoLink ?? ""))
      }, label: {
        ZStack {
          UrlImageView(urlString: launch.links?.videoLink?.getYoutubeThumnailURL() ?? "")
          Image(systemName: "play.circle")
            .font(.system(size: 60))
            .foregroundColor(Color.red)
        }
      })
        .buttonStyle(PlainButtonStyle())
      Text(launch.missionName ?? "")
        .font(.title)
      Text(launch.launchSite?.siteNameLong ?? "")
      Button(action: {
        self.openLinkToSafariView(urlString: (launch.links?.wikipedia ?? ""))
      }, label: {
        Text("Wikipedia")
      })
      Button(action: {
        self.openLinkToSafariView(urlString: (launch.links?.articleLink ?? ""))
      }, label: {
        Text("Article")
      })
      Spacer()
    }
    .padding()
  }
  
  func openLinkToSafariView(urlString: String) {
    guard let rootVC = UIApplication.shared.windows.first?.rootViewController else { return }
    if let url = URL(string: urlString) {
      let config = SFSafariViewController.Configuration()
      let vc = SFSafariViewController(url: url, configuration: config)
      rootVC.present(vc, animated: true, completion: nil)
    } else {
      let alert = UIAlertController(title: "", message: "Invalid URL", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      rootVC.present(alert, animated: true, completion: nil)
    }
  }
}
