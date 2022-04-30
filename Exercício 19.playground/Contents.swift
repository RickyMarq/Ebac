import UIKit
import Foundation


class SessionDelegate: NSObject, URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("DownloadingLocation:", location)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = round(Float(totalBytesWritten) / Float(totalBytesExpectedToWrite) * 100)
       
        print("carregando \(progress) % ")
    }
}

let downloadSession = URLSession(configuration: .default, delegate: SessionDelegate(), delegateQueue: OperationQueue.main)

let urlDowload = URL(string: "https://web-ebac-ios.herokuapp.com/download/Additional_Tools_for_Xcode_12.5(1).dmg")!

let task = downloadSession.downloadTask(with: urlDowload) { (location, response, error) in
    if let error = error  {
        print(error.localizedDescription)
        return
    }
    
    print("response ==> \(String(describing: response))")
    
}
 
task.resume()
