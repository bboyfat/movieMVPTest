//
//  DetailsController.swift
//  TestiOSDev
//
//  Created by Andrey Petrovskiy on 10.04.2020.
//  Copyright © 2020 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    
    var detailView: DetailsView!
    var movie: Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        detailView = DetailsView(frame: self.view.frame)
        detailView.backgroundColor = .white
        self.view.addSubview(detailView)
        setViews()
    }
    
    private func setViews() {
        detailView.titleLb.text = movie?.title
        detailView.posterImageView.load(movie?.poster ?? "")
        detailView.disMissBtn.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
    }
    
    @objc func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}

