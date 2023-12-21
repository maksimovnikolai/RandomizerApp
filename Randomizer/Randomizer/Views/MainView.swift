//
//  MainView.swift
//  Randomizer
//
//  Created by Nikolai Maksimov on 20.12.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setNewValues(minimum: String, maksimum: String)
}

final class MainView: UIView {
    
    lazy var minimumNumberLabel = makeLabel(with: "0", size: .boldSystemFont(ofSize: 50))
    lazy var maximumNumberLabel = makeLabel(with: "100", size: .boldSystemFont(ofSize: 50))
    
    private lazy var fromTextLabel = makeLabel(with: "от", size: .boldSystemFont(ofSize: 29))
    private lazy var toTextLabel = makeLabel(with: "до", size: .boldSystemFont(ofSize: 29))
    private lazy var randomValueLabel = makeLabel(with: "?", size: .boldSystemFont(ofSize: 98))
    
    private lazy var stackView = makeStackView()
    private lazy var getResultButton = makeButton(withTitle: "Получить число")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Methods
extension MainView {
    
    private func commonInit() {
        backgroundColor = .systemBackground
        configureStackView()
        setupConstraintsАForRandomValueLabel()
        setupConstraintsForButton()
    }
    
    private func configureStackView() {
        setupConstraintsForStackView()
        stackView.addArrangedSubview(fromTextLabel)
        stackView.addArrangedSubview(minimumNumberLabel)
        stackView.addArrangedSubview(toTextLabel)
        stackView.addArrangedSubview(maximumNumberLabel)
    }
    
    @objc
    private func getRandomNumber() {
        let minimumNumber = Int(minimumNumberLabel.text ?? "") ?? 0
        let maximumNumber = Int(maximumNumberLabel.text ?? "") ?? 20
        randomValueLabel.text = String(Int.random(in: minimumNumber...maximumNumber))
    }
}

// MARK: SettingsViewControllerDelegate
extension MainView: SettingsViewControllerDelegate {
    
    func setNewValues(minimum: String, maksimum: String) {
        minimumNumberLabel.text = minimum
        maximumNumberLabel.text = maksimum
    }
}

// MARK: UI-elements
extension MainView {
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 33
        stackView.alignment = .bottom
        return stackView
    }
    
    private func makeLabel(with title: String, size: UIFont) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.font = size
        label.textAlignment = .center
        return label
    }
    
    private func makeButton(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.title = title
        button.addTarget(self, action: #selector(getRandomNumber), for: .touchUpInside)
        return button
    }
}

// MARK: Constraints
extension MainView {
    
    private func setupConstraintsForStackView() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupConstraintsАForRandomValueLabel() {
        addSubview(randomValueLabel)
        NSLayoutConstraint.activate([
            randomValueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            randomValueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func setupConstraintsForButton() {
        addSubview(getResultButton)
        NSLayoutConstraint.activate([
            getResultButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            getResultButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            getResultButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80)
        ])
    }
}
