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

    private func createColorView() -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.widthAnchor.constraint(equalToConstant: 40).isActive = true
        view.isUserInteractionEnabled = true
        return view
    }
    
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
            colorsStackView
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
        
        [
            imagesStackView,
            cpuLabel,
            cameraLabel,
            ramLabel,
            sdLabel,
            colorAndCapacityLabel,
            colorsStackView
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
//            colorsStackView.heightAnchor.constraint(equalToConstant: 40)
        ].forEach { $0.isActive = true }
    }

}

extension ProductInfoShopView {
    
    func initializeView(detailedProduct: DetailedProduct) {
        print(13)
        cpuLabel.text = detailedProduct.CPU
        cameraLabel.text = detailedProduct.camera
        ramLabel.text = detailedProduct.ssd
        sdLabel.text = detailedProduct.sd
        configureColorStackView(colors: detailedProduct.colors)
    }
    
    private func configureColorStackView(colors: [UIColor]) {
        for color in colors {
            colorsStackView.addArrangedSubview(createColorButton(color: color))
        }
    }
    
    private func createColorButton(color: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(colorDidTap), for: .touchUpInside)
        return button
    }
    
    @objc private func colorDidTap() {
        print("234")
    }
    
}


