//
//  UrlImageView.swift
//  SpaceXLaunches
//
//  Created by Adit Hasan on 10/12/21.
//

import SwiftUI

struct UrlImageView: View {
  @ObservedObject var urlImageModel: UrlImageModel
  
  init(urlString: String?) {
    urlImageModel = UrlImageModel(urlString: urlString)
  }
  
  var body: some View {
    Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
      .resizable()
      .scaledToFit()
      .cornerRadius(10)
  }
  
  static var defaultImage = UIImage(systemName: "photo")
}
