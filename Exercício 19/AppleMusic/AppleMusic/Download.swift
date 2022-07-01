//
//  Download.swift
//  AppleMusic
//
//  Created by Henrique Marques on 19/06/22.
//

import Foundation

class Download: NSObject {
  var url: URL
  var task: URLSessionDownloadTask?
  
  init(url: URL) {
    self.url = url
  }
}
