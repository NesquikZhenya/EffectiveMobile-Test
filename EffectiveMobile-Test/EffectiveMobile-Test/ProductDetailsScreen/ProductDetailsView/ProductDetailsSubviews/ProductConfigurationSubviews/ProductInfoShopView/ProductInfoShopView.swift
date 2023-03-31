//
//  ProductInfoShopView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 26.03.2023.
//

import UIKit

final class ProductInfoShopView: UIView {
    
    
    lazy var imagesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(createImageView(name: "cpu"))
        stackView.addArrangedSubview(createImageView(name: "camera"))
        stackView.addArrangedSubview(createImageView(name: "ram"))
        stackView.addArrangedSubview(createImageView(name: "sd"))
        return stackView
    }()

    private func createImageView(name: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: name)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    private let cpuLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        label.font = UIFont(name: "MarkPro-Regular", size: 11)
        return label
    }()

    private let cameraLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        label.font = UIFont(name: "MarkPro-Regular", size: 11)
        return label
    }()

    private let ramLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        label.font = UIFont(name: "MarkPro-Regular", size: 11)
        return label
    }()

    private let sdLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.717, green: 0.717, blue: 0.717, alpha: 1)
        label.font = UIFont(name: "MarkPro-Regular", size: 11)
        return label
    }()

    private let colorAndCapacityLabel: UILabel = {
        let label = UILabel()
        label.text = "Select color and Capacity"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Medium", size: 16)
        return label
    }()

    lazy var colorsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        return stackView
    }()
    
    private let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "check")
        return imageView
    }()
    
    lazy var checkX0Constraint = checkImageView.centerXAnchor.constraint(equalTo: colorsStackView.arrangedSubviews[0].centerXAnchor)
    
    lazy var checkY0Constraint = checkImageView.centerYAnchor.constraint(equalTo: colorsStackView.arrangedSubviews[0].centerYAnchor)

    lazy var checkX1Constraint = checkImageView.centerXAnchor.constraint(equalTo: colorsStackView.arrangedSubviews[0].centerXAnchor)
    
    lazy var checkY1Constraint = checkImageView.centerYAnchor.constraint(equalTo: colorsStackView.arrangedSubviews[0].centerYAnchor)
    
    lazy var checkX2Constraint = checkImageView.centerXAnchor.constraint(equalTo: colorsStackView.arrangedSubviews[0].centerXAnchor)
    
    lazy var checkY2Constraint = checkImageView.centerYAnchor.constraint(equalTo: colorsStackView.arrangedSubviews[0].centerYAnchor)
    
    lazy var capacityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        loadViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: Configurating constraints

extension ProductInfoShopView: ViewSetuping {
    
    func loadViews() {
        [
            imagesStackView,
            cpuLabel,
            cameraLabel,
            ramLabel,
            sdLabel,
            colorAndCapacityLabel,
            colorsStackView,
            checkImageView,
            capacityStackView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureImagesStackViewConstraints()
        configureCpuLabelConstraints()
        configureCameraLabelConstraints()
        configureRamLabelConstraints()
        configureSdLabelConstraints()
        configureColorAndCapacityLabelConstraints()
        configureColorsStackViewConstraints()
        configureCapacityStackViewConstraints()

        [
            imagesStackView,
            cpuLabel,
            cameraLabel,
            ramLabel,
            sdLabel,
            colorAndCapacityLabel,
            colorsStackView,
            checkImageView,
            capacityStackView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureImagesStackViewConstraints() {
        [
            imagesStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            imagesStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            imagesStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45)
        ].forEach { $0.isActive = true }
    }

    private func configureCpuLabelConstraints() {
        [
            cpuLabel.topAnchor.constraint(equalTo: imagesStackView.bottomAnchor, constant: 8),
            cpuLabel.centerXAnchor.constraint(equalTo: imagesStackView.arrangedSubviews[0].centerXAnchor)
        ].forEach { $0.isActive = true }
    }

    private func configureCameraLabelConstraints() {
        [
            cameraLabel.topAnchor.constraint(equalTo: imagesStackView.bottomAnchor, constant: 8),
            cameraLabel.centerXAnchor.constraint(equalTo: imagesStackView.arrangedSubviews[1].centerXAnchor)
        ].forEach { $0.isActive = true }
    }

    private func configureRamLabelConstraints() {
        [
            ramLabel.topAnchor.constraint(equalTo: imagesStackView.bottomAnchor, constant: 8),
            ramLabel.centerXAnchor.constraint(equalTo: imagesStackView.arrangedSubviews[2].centerXAnchor)
        ].forEach { $0.isActive = true }
    }

    private func configureSdLabelConstraints() {
        [
            sdLabel.topAnchor.constraint(equalTo: imagesStackView.bottomAnchor, constant: 8),
            sdLabel.centerXAnchor.constraint(equalTo: imagesStackView.arrangedSubviews[3].centerXAnchor)
        ].forEach { $0.isActive = true }
    }

    private func configureColorAndCapacityLabelConstraints() {
        [
            colorAndCapacityLabel.topAnchor.constraint(equalTo: cpuLabel.bottomAnchor, constant: 28),
            colorAndCapacityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        ].forEach { $0.isActive = true }
    }

    private func configureColorsStackViewConstraints() {
        [
            colorsStackView.topAnchor.constraint(equalTo: colorAndCapacityLabel.bottomAnchor, constant: 14),
            colorsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            colorsStackView.trailingAnchor.constraint(lessThanOrEqualTo: self.centerXAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureCheckImageViewConstraints(id: Int) {
        [
            checkX0Constraint,
            checkY0Constraint
        ].forEach { $0.isActive = true }
    }
    
    private func configureCapacityStackViewConstraints() {
        [
            capacityStackView.centerYAnchor.constraint(equalTo: colorsStackView.centerYAnchor),
            capacityStackView.leadingAnchor.constraint(equalTo: colorsStackView.trailingAnchor, constant: 30),
            capacityStackView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20)
        ].forEach { $0.isActive = true }
    }
}

extension ProductInfoShopView {
    
    func initializeView(detailedProduct: DetailedProduct) {
        cpuLabel.text = detailedProduct.CPU
        cameraLabel.text = detailedProduct.camera
        ramLabel.text = detailedProduct.ssd
        sdLabel.text = detailedProduct.sd
        configureColorStackView(colors: detailedProduct.colors)
        configureCapacityStackView(capacity: detailedProduct.capacity)
    }
    
    private func configureColorStackView(colors: [UIColor]) {
        var i: Int = 0
        for color in colors {
            colorsStackView.addArrangedSubview(createColorButton(id: i,color: color))
            i += 1
        }
        configureCheckImageViewConstraints(id: 0)
    }
    
    private func configureCapacityStackView(capacity: [String]) {
        var i: Int = 0
        for cap in capacity {
            capacityStackView.addArrangedSubview(createCapacityButton(id: i, capacity: cap))
            i += 1
        }
    }
        
    private func createColorButton(id: Int, color: UIColor) -> ProductInfoShopColorButton {
        let button = ProductInfoShopColorButton()
        button.configureButton(id: id, color: color)
        button.addTarget(self, action: #selector(colorDidTap), for: .touchUpInside)
        return button
    }
    
    private func createCapacityButton(id: Int, capacity: String) -> ProductInfoShopCapacityButton {
        let button = ProductInfoShopCapacityButton()
        button.configureButton(id: id, capacity: capacity)
        button.addTarget(self, action: #selector(capacityDidTap), for: .touchUpInside)
        return button
    }
    
    @objc private func colorDidTap(_ sender: ProductInfoShopColorButton) {
        print("buttonDidTap")
//        switch sender.id {
//        case 1:
//            print(1)
//            checkX0Constraint.isActive = false
//            checkY0Constraint.isActive = false
//            checkX1Constraint.isActive = true
//            checkY1Constraint.isActive = true
//            checkX2Constraint.isActive = false
//            checkY2Constraint.isActive = false
//        case 2:
//            print(2)
//            checkX0Constraint.isActive = false
//            checkY0Constraint.isActive = false
//            checkX1Constraint.isActive = false
//            checkY1Constraint.isActive = false
//            checkX2Constraint.isActive = true
//            checkY2Constraint.isActive = true
//        default:
//            print(0)
//            checkX0Constraint.isActive = true
//            checkY0Constraint.isActive = true
//            checkX1Constraint.isActive = false
//            checkY1Constraint.isActive = false
//            checkX2Constraint.isActive = true
//            checkY2Constraint.isActive = true
//        }
//        self.layoutIfNeeded()
    }
    
    @objc private func capacityDidTap(_ sender: ProductInfoShopCapacityButton) {
        print("asdfasf")
    }

    
}


