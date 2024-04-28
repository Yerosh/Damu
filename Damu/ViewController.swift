//
//  ViewController.swift
//  Damu
//
//  Created by Yernur Adilbek on 12/4/23.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    private lazy var myTitle: UILabel = {
        let label = UILabel()
        label.text = "Choose your character's gender:"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var maleView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "male"))
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 15
        imageView.isUserInteractionEnabled = true // Enable user interaction
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openNextPageMale)))
        return imageView
    }()
    
    private lazy var femaleView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "female"))
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 15
        imageView.isUserInteractionEnabled = true // Enable user interaction
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openNextPageFemale)))
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

}

// MARK: - setting iui methods
private extension ViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(myTitle)
        view.addSubview(maleView)
        view.addSubview(femaleView)
    }
    
    func setupConstraints() {
        myTitle.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(70)
            make .centerX.equalToSuperview()
        }
        maleView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        femaleView.snp.makeConstraints { make in
            make.top.equalTo(maleView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
    }
    
    @objc private func openNextPageMale() {
        openNextPage(withGender: "male")
    }

    @objc private func openNextPageFemale() {
        openNextPage(withGender: "female")
    }

    
    @objc func openNextPage(withGender gender: String) {
        let nextViewController = SecViewController(gender: gender)
        
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
