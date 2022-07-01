import Foundation
import UIKit


protocol ViewCodeBuild {
    func buildViewHierarchy()
    func configAppleMusicImageConstraint()
    func configDownloadLabelConstraint()
    func configDownloadButtonConstraint()
    func configPlayButtonConstraint()
    func setupAdditionalConfiguration()
    func setUpView()
}

extension ViewCodeBuild {
    func setUpView() {
        buildViewHierarchy()
        setupAdditionalConfiguration()
        configAppleMusicImageConstraint()
        configDownloadLabelConstraint()
        configDownloadButtonConstraint()
        configPlayButtonConstraint()
    }
}
