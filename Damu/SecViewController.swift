//
//  SecViewController.swift
//  Damu
//
//  Created by Yernur Adilbek on 12/5/23.
//

import SnapKit
import UIKit

class SecViewController: UIViewController {
    
    var gender: String


    init(gender: String) {
        self.gender = gender
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var nameView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your name:"
        return label
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private lazy var ageView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Select your age:"
        return label
    }()

    private lazy var agePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()

    private lazy var weightView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Select your weight(kg):"
        return label
    }()

    private lazy var weightPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()

    private lazy var heightView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Select your height(cm):"
        return label
    }()

    private lazy var heightPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()

    private lazy var nextPage: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(openThirdPage), for: .touchUpInside)
        return button
    }()

    private let ageData: [Int] = Array(16...100)
    private let weightData: [Int] = Array(45...150)
    private let heightData: [Int] = Array(150...200)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    @objc private func openThirdPage() {
        let thirdViewController = HomeViewController()
        thirdViewController.userName = nameTextField.text
        thirdViewController.userAge = ageData[agePicker.selectedRow(inComponent: 0)]
        thirdViewController.userWeight = weightData[weightPicker.selectedRow(inComponent: 0)]
        thirdViewController.userHeight = heightData[heightPicker.selectedRow(inComponent: 0)]
        thirdViewController.gender = gender
        navigationController?.pushViewController(thirdViewController, animated: true)
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension SecViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePicker{
            return ageData.count
        }else if pickerView == weightPicker{
            return weightData.count
        }else{
            return heightData.count
        }
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePicker{
            return "\(ageData[row])"
        }else if pickerView == weightPicker{
            return "\(weightData[row])"
        }else{
            return "\(heightData[row])"
        }
    }
    
}

// MARK: - Setting UI methods
private extension SecViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.addSubview(nameView)
        nameView.addSubview(nameLabel)
        nameView.addSubview(nameTextField)

        view.addSubview(ageView)
        ageView.addSubview(ageLabel)
        ageView.addSubview(agePicker)

        view.addSubview(weightView)
        weightView.addSubview(weightLabel)
        weightView.addSubview(weightPicker)

        view.addSubview(heightView)
        heightView.addSubview(heightLabel)
        heightView.addSubview(heightPicker)

        view.addSubview(nextPage)
    }

    func setupConstraints() {
        nameView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        nameTextField.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }

        ageView.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        ageLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        agePicker.snp.makeConstraints { make in
//            make.leading.equalTo(ageLabel.snp.trailing).offset(10)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }

        weightView.snp.makeConstraints { make in
            make.top.equalTo(ageView.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        weightLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        weightPicker.snp.makeConstraints { make in
//            make.leading.equalTo(weightLabel.snp.trailing).offset(10)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }

        heightView.snp.makeConstraints { make in
            make.top.equalTo(weightView.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        heightLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        heightPicker.snp.makeConstraints { make in
//            make.leading.equalTo(heightLabel.snp.trailing)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }

        nextPage.snp.makeConstraints { make in
            make.top.equalTo(heightView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
    }
}
