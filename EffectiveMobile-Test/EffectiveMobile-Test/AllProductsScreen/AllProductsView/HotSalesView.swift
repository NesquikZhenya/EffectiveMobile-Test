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
            hotSalesScrollView.heightAnchor.constraint(equalToConstant: 180)
        ].forEach { $0.isActive = true }
    }
    
}

extension HotSalesView {
    func configureHotSalesScrollView(hotSalesPhones:[HotSalesPhone]) {
        
        let view1 = HotSalesPhoneView()
        view1.configureHotSalesPhone()
        hotSalesScrollView.addSubview(view1)
        [
            view1.topAnchor.constraint(equalTo: hotSalesScrollView.topAnchor),
            view1.bottomAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor),
            view1.leadingAnchor.constraint(equalTo: hotSalesScrollView.leadingAnchor),
//            view1.trailingAnchor.constraint(equalTo: hotSalesScrollView.trailingAnchor),
            view1.heightAnchor.constraint(equalTo: hotSalesScrollView.heightAnchor),
            view1.widthAnchor.constraint(equalTo: hotSalesScrollView.widthAnchor)
        ].forEach { $0.isActive = true }
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        let view2 = HotSalesPhoneView()
        view2.configureHotSalesPhone()
        hotSalesScrollView.addSubview(view2)
        [
            view2.topAnchor.constraint(equalTo: hotSalesScrollView.topAnchor),
            view2.bottomAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor),
            view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor),
            view2.trailingAnchor.constraint(equalTo: hotSalesScrollView.trailingAnchor),
            view2.heightAnchor.constraint(equalTo: hotSalesScrollView.heightAnchor),
            view2.widthAnchor.constraint(equalTo: hotSalesScrollView.widthAnchor)
        ].forEach { $0.isActive = true }
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        
//        for phone in hotSalesPhones {
//            let view = HotSalesPhoneView()
//            view.configureHotSalesPhone()
//            hotSalesScrollView.addSubview(view)
////            let xCoordinate = hotSalesScrollView.frame.midX + hotSalesScrollView.frame.width * CGFloat((phone.id - 1))
////            view.frame = CGRect(x: xCoordinate, y: hotSalesScrollView.frame.height / 2, width: UIScreen.main.bounds.width - 32, height: hotSalesScrollView.bounds.height)
//            [
//                view.topAnchor.constraint(equalTo: hotSalesScrollView.topAnchor),
//                view.bottomAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor),
//                view.leadingAnchor.constraint(equalTo: hotSalesScrollView.leadingAnchor),
//                view.trailingAnchor.constraint(equalTo: hotSalesScrollView.trailingAnchor, constant: 500),
////                view.centerXAnchor.constraint(equalTo: hotSalesScrollView.centerXAnchor, constant: UIScreen.main.bounds.width * CGFloat((phone.id - 1)))
//            ].forEach { $0.isActive = true }
//            view.translatesAutoresizingMaskIntoConstraints = false
//        }
    }
}

