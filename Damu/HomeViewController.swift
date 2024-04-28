//
//  HomeViewController.swift
//  Damu
//
//  Created by Yernur Adilbek on 12/6/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var gender: String?
    var userName: String?
    var userAge: Int?
    var userWeight: Int?
    var userHeight: Int?

    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "homeBack"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var characterImage: UIImageView = {
        if let gender = gender {
                return UIImageView(image: UIImage(named: gender))
        } else {
            return UIImageView(image: UIImage(named: "def"))
        }
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var levelIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "level"))
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var moneyIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "money"))
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var giftIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "gift"))
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var clothesIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "clothes"))
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var settingsIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "settings"))
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var userIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "user"))
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var leftView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var cartIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "cart"))
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var mealIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "meal"))
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var rightView: UIView = {
        let view  = UIView()
        return view
    }()
    
    private lazy var gameIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "game"))
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var jobIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "job"))
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        view.insertSubview(backgroundImage, at: 0)
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backgroundImage.frame = view.bounds
    }

}

// MARK: - setting iui methods
private extension HomeViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(characterImage)
        
        view.addSubview(topView)
        topView.addSubview(levelIcon)
        topView.addSubview(moneyIcon)
        topView.addSubview(giftIcon)
        topView.addSubview(clothesIcon)
        topView.addSubview(settingsIcon)
        topView.addSubview(userIcon)
        
        view.addSubview(leftView)
        leftView.addSubview(mealIcon)
        leftView.addSubview(cartIcon)
        
        view.addSubview(rightView)
        rightView.addSubview(gameIcon)
        rightView.addSubview(jobIcon)
    }
    
    func setupConstraints() {
        characterImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(50)
            make.height.equalToSuperview().multipliedBy(0.7)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        levelIcon.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        moneyIcon.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(levelIcon.snp.trailing).offset(20)
        }
        giftIcon.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(moneyIcon.snp.trailing).offset(120)
        }
        clothesIcon.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(giftIcon.snp.trailing).offset(10)
        }
        settingsIcon.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(clothesIcon.snp.trailing).offset(10)
        }
        userIcon.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(settingsIcon.snp.trailing).offset(10)
        }
        
        leftView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.1)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
        }
        mealIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        cartIcon.snp.makeConstraints { make in
            make.top.equalTo(mealIcon.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        rightView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.1)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
        }
        gameIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        jobIcon.snp.makeConstraints { make in
            make.top.equalTo(gameIcon.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
    }
}
