//
//  Download-Service.swift
//  AppleMusic
//
//  Created by Henrique Marques on 19/06/22.
//

import Foundation

class DownloadService {

  var downloadsSession: URLSession!
  var activeDownloads: [URL: Download] = [:]

  func startDownload(_ track: URL) {
    let download = Download(url: track)
    download.task = downloadsSession.downloadTask(with: track)
    download.task!.resume()
    activeDownloads[download.url] = download
  }
}
