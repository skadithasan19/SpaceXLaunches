//
//  UrlImageModel.swift
//  SpaceXLaunches
//
//  Created by Adit Hasan on 10/12/21.
//

import UIKit

class UrlImageModel: ObservableObject {
  @Published var image: UIImage? = UIImage(systemName: "photo")
  var urlString: String?
  
  init(urlString: String?) {
    self.urlString = urlString
    loadImage()
  }
  
  func loadImage() {
    loadImageFromUrl()
  }
  
  func loadImageFromUrl() {
    guard let urlString = urlString else {
      return
    }
    
    let url = URL(string: urlString)!
    let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
    task.resume()
  }
  
  
  func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
    guard error == nil else {
      print("Error: \(error!)")
      return
    }
    guard let data = data else {
      print("No data found")
      return
    }
    
    DispatchQueue.main.async {
      guard let loadedImage = UIImage(data: data) else {
        return
      }
      self.image = loadedImage
    }
  }
}
