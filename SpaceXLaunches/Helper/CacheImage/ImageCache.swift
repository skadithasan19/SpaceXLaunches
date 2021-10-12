//
//  ImageCache.swift
//  SpaceXLaunches
//
//  Created by Adit Hasan on 10/12/21.
//

import UIKit

class ImageCache {
  var cache = NSCache<NSString, UIImage>()
  
  func get(forKey: String) -> UIImage? {
    return cache.object(forKey: NSString(string: forKey))
  }
  
  func set(forKey: String, image: UIImage) {
    cache.setObject(image, forKey: NSString(string: forKey))
  }
}

extension ImageCache {
  private static var imageCache = ImageCache()
  static func getImageCache() -> ImageCache {
    return imageCache
  }
}
