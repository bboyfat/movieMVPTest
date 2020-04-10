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
        detailView = DetailsView(frame: self.view.frame)
        detailView.backgroundColor = .white
        self.view.addSubview(detailView)
        setViews()
    }
    
    func setViews() {
        detailView.titleLb.text = movie?.title
        detailView.posterImageView.load(movie?.poster ?? "")
        detailView.disMissBtn.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
    }
    
    @objc func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}


class DetailsView: UIView {
    
    let posterImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    let titleLb: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "System", size: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let disMissBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.backgroundColor = #colorLiteral(red: 0.523394227, green: 0.5023386478, blue: 0.8578795791, alpha: 1)
        btn.setTitle("Dismiss", for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImageView)
        addSubview(titleLb)
        addSubview(disMissBtn)
        
        posterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        posterImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.8).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.5).isActive = true
        
        titleLb.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 30).isActive = true
        titleLb.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        titleLb.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16).isActive = true
        
        disMissBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50).isActive = true
        disMissBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        disMissBtn.widthAnchor.constraint(equalToConstant: self.bounds.width * 0.8).isActive = true
        disMissBtn.heightAnchor.constraint(equalToConstant: self.bounds.height * 0.1).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
