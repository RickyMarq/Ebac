//
//  ViewCodeBuild.swift
//  AppleMusic
//
//  Created by Henrique Marques on 20/06/22.
//

import Foundation

protocol ViewCodeBuild {
    func buildViewHierarchy()
    func setupAdditionalConfiguration()
    func setupView()
    func configAppleMusicImageConstraint()
    func configDownloadLabelConstraint()
    func configDownloadButtonConstraint()
    func configPlayButtonConstraint()
}

extension ViewCodeBuild {
    func setupView() {
        buildViewHierarchy()
        setupAdditionalConfiguration()
        configAppleMusicImageConstraint()
        configDownloadLabelConstraint()
        configDownloadButtonConstraint()
        configPlayButtonConstraint()
    }
}
