import UIKit
import AVKit
import AVFoundation
import SnapKit

class MusicViewController: UIViewController {
    
    let downloadService = DownloadService()
    
    lazy var downloadsSession: URLSession = {
        let configuration = URLSessionConfiguration.background(withIdentifier: "me.henriquemarques.bkgsessionconfiguration")
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    
    lazy var setAppleMusicImageView: UIImageView = {
        let image = UIImage(named: "music")
        let imageview = UIImageView(image: image)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    
    lazy var setDownloadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Download Musics"
        label.textAlignment = .center
        return label
    }()
    
    lazy var setDownloadButton: UIButton = {
        let download = UIButton(frame: .zero)
        download.translatesAutoresizingMaskIntoConstraints = false
        download.backgroundColor = .systemPurple
        download.setTitle("Download", for: .normal)
        download.translatesAutoresizingMaskIntoConstraints = false
        download.layer.cornerRadius = 7
        download.addTarget(self, action: #selector(downloadTapped), for: .touchUpInside)
        return download
    }()
    
    lazy var setPlayButton: UIButton = {
        let play = UIButton(frame: .zero)
        play.translatesAutoresizingMaskIntoConstraints = false
        play.backgroundColor = .systemPurple
        play.setTitle("Play", for: .normal)
        play.layer.cornerRadius = 7
        play.addTarget(self, action: #selector(playDownload), for: .touchUpInside)
        return play
    }()
    
            
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        downloadService.downloadsSession = downloadsSession
        view.backgroundColor = .black
        
    }
    
    @objc func downloadTapped(_ sender: UIButton) {
        for url in urlDownloads {
            downloadService.startDownload(URL(string: url)!)
        }
    }
    
    @objc func playDownload(_ sender: UIButton) {
        let playerViewController = AVPlayerViewController()
        present(playerViewController, animated: true, completion: nil)
        let url = URL(string: String(describing: urlDownloads.first!))!
        let player = AVPlayer(url: url)
        playerViewController.player = player
        player.play()
    }
        
    
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    func localFilePath(for url: URL) -> URL {
        return documentsPath.appendingPathComponent(url.lastPathComponent)
    }
}


extension MusicViewController: ViewCodeBuild {
    
    func buildViewHierarchy() {
        self.view.addSubview(self.setDownloadLabel)
        self.view.addSubview(self.setDownloadButton)
        self.view.addSubview(self.setPlayButton)
        self.view.addSubview(self.setAppleMusicImageView)
    }
    
    func configAppleMusicImageConstraint() {
        self.setAppleMusicImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalTo(view.snp.leading).offset(100)
            make.trailing.equalTo(view.snp.trailing).inset(100)
            make.height.equalTo(100)
        }
    }

    func configDownloadLabelConstraint() {
        self.setDownloadLabel.snp.makeConstraints { make in
            make.top.equalTo(setAppleMusicImageView.snp.bottom).offset(50)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.height.equalTo(20)
        }
    }
    
    func configDownloadButtonConstraint() {
        self.setDownloadButton.snp.makeConstraints { make in
            make.top.equalTo(setDownloadLabel.snp.bottom).offset(50)
            make.leading.equalTo(view.snp.leading).offset(40)
            make.trailing.equalTo(view.snp.trailing).inset(40)
            make.height.equalTo(50)
        }
    }
    
    func configPlayButtonConstraint() {
        self.setPlayButton.snp.makeConstraints { make in
            make.top.equalTo(setDownloadButton.snp.bottom).offset(30)
            make.leading.equalTo(setDownloadButton.snp.leading)
            make.trailing.equalTo(setDownloadButton.snp.trailing)
            make.height.equalTo(setDownloadButton.snp.height)
        }
    }
    
    func setupAdditionalConfiguration() { }
    
}
