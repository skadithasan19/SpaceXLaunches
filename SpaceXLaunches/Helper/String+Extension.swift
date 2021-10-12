//
//  String+Extension.swift
//  SpaceXLaunches
//
//  Created by Adit Hasan on 10/12/21.
//

import Foundation

extension String {
  func transformToDate() -> Date {
    let isoFormatter = DateFormatter()
    isoFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssX"
    isoFormatter.locale = Locale(identifier: "en_US_POSIX")
    isoFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    guard let date = isoFormatter.date(from: self) else { return Date() }
    return date
  }
  
  func transformDateToString() -> String {
    let isoFormatter = DateFormatter()
    isoFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssX"
    isoFormatter.locale = Locale(identifier: "en_US_POSIX")
    isoFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    guard let date = isoFormatter.date(from: self) else { return "" }
    
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d, yyyy"
    let result = formatter.string(from:date)
    return result
  }
  
  func getYoutubeThumnailURL() -> String {
    let youtubeID = self.extractYoutubeId()
    let Thumbnails = "https://img.youtube.com/vi/\(youtubeID)/maxresdefault.jpg"
    return Thumbnails
  }
  
  func extractYoutubeId() -> String {
    let regexString: String = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
    let regExp = try? NSRegularExpression(pattern: regexString, options: .caseInsensitive)
    let array: [Any] = (regExp?.matches(in: self, options: [], range: NSRange(location: 0, length: (self.count ))))!
    
    if let result = array.first as? NSTextCheckingResult {
      return (self as NSString).substring(with: result.range)
    }
    return ""
  }
}
