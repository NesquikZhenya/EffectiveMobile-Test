//
//  HotSalesView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 08.12.2022.
//

import UIKit


class HotSalesView: UIView {
    
    private let hotSalesLabel: UILabel = {
        let label = UILabel()
        label.text = "Hot Sales"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        return label
    }()
    
    private let seeMoreLabel: UILabel = {
        let label = UILabel()
        label.text = "see more"
        label.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        label.font = UIFont(name: "MarkPro-Regular", size: 15)
        return label
    }()
    
    lazy var hotSalesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)
        loadViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: Configurating constraints

extension HotSalesView: ViewSetuping {

    func loadViews() {
        [
            hotSalesLabel,
            seeMoreLabel,
            hotSalesScrollView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureHotSalesLabelConstraints()
        configureSeeMoreLabelConstraints()
        configureHotSalesScrollViewConstraints()
        
        [
            hotSalesLabel,
            seeMoreLabel,
            hotSalesScrollView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureHotSalesLabelConstraints() {
        [
            hotSalesLabel.topAnchor.constraint(equalTo: self.topAnchor),
            hotSalesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17)
        ].forEach { $0.isActive = true }
    }
    
    private func configureSeeMoreLabelConstraints() {
        [
            seeMoreLabel.centerYAnchor.constraint(equalTo: hotSalesLabel.centerYAnchor),
            seeMoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -27)
        ].forEach { $0.isActive = true }
    }
    
    private func configureHotSalesScrollViewConstraints() {
        [
            hotSalesScrollView.topAnchor.constraint(equalTo: hotSalesLabel.bottomAnchor, constant: 8),
            hotSalesScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hotSalesScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hotSalesScrollView.heightAnchor.constraint(equalToConstant: 190)
        ].forEach { $0.isActive = true }
    }
    
}

extension HotSalesView {
    
    func configureHotSalesScrollView(hotSalesPhones:[HotSalesPhone]) {
        
        var phoneViews: [HotSalesPhoneView] = []
        for phone in hotSalesPhones {
            let view = HotSalesPhoneView()
            view.configureHotSalesPhone(hotSalesPhone: phone)
            phoneViews.append(view)
        }
        
        for i in 0...(phoneViews.count - 1) {

            hotSalesScrollView.addSubview(phoneViews[i])

            if i == 0 {
                [
                    phoneViews[i].topAnchor.constraint(equalTo: hotSalesScrollView.topAnchor),
                    phoneViews[i].bottomAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor),
                    phoneViews[i].leadingAnchor.constraint(equalTo: hotSalesScrollView.leadingAnchor),
                    phoneViews[i].heightAnchor.constraint(equalTo: hotSalesScrollView.heightAnchor),
                    phoneViews[i].widthAnchor.constraint(equalTo: hotSalesScrollView.widthAnchor)
                ].forEach { $0.isActive = true }
                phoneViews[i].translatesAutoresizingMaskIntoConstraints = false
            } else if i == (phoneViews.count - 1) {
                [
                    phoneViews[i].topAnchor.constraint(equalTo: hotSalesScrollView.topAnchor),
                    phoneViews[i].bottomAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor),
                    phoneViews[i].leadingAnchor.constraint(equalTo: phoneViews[i-1].trailingAnchor),
                    phoneViews[i].trailingAnchor.constraint(equalTo: hotSalesScrollView.trailingAnchor),
                    phoneViews[i].heightAnchor.constraint(equalTo: hotSalesScrollView.heightAnchor),
                    phoneViews[i].widthAnchor.constraint(equalTo: hotSalesScrollView.widthAnchor)
                ].forEach { $0.isActive = true }
                phoneViews[i].translatesAutoresizingMaskIntoConstraints = false
            } else {
                [
                    phoneViews[i].topAnchor.constraint(equalTo: hotSalesScrollView.topAnchor),
                    phoneViews[i].bottomAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor),
                    phoneViews[i].leadingAnchor.constraint(equalTo: phoneViews[i-1].trailingAnchor),
                    phoneViews[i].heightAnchor.constraint(equalTo: hotSalesScrollView.heightAnchor),
                    phoneViews[i].widthAnchor.constraint(equalTo: hotSalesScrollView.widthAnchor)
                ].forEach { $0.isActive = true }
                phoneViews[i].translatesAutoresizingMaskIntoConstraints = false
            }

        }
    }
}

extension HotSalesView: HotSalesViewHiding {
    
    var isNowHidden: Bool {
        get {
            self.isHidden
        }
        set {
            self.isHidden = newValue
        }
    }

}
