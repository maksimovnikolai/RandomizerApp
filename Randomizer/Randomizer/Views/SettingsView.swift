//
//  SettingsView.swift
//  Randomizer
//
//  Created by Nikolai Maksimov on 20.12.2023.
//

import UIKit

final class SettingsView: UIView {
    
    private lazy var textFieldsStackView = makeStackView(axis: .vertical)
    private lazy var buttonsStackView = makeStackView(axis: .vertical)
    
    private lazy var minimumValueTF = makeTextField(placeholder: "Minimum value")
    private lazy var maximumValueTF = makeTextField(placeholder: "Maximum value")
    
    private lazy var saveButton = makeButton(withTitle: "Save")
    private lazy var cancelButton = makeButton(withTitle: "Cancel", textColor: .red)
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Methods
extension SettingsView {
    
    private func commonInit() {
        backgroundColor = .systemBackground
        configureTextFieldStackView()
        configureButtonStackView()
       
    }
    
    private func configureTextFieldStackView() {
        setupConstraintsForTextFieldStackView()
        textFieldsStackView.spacing = 24
        textFieldsStackView.addArrangedSubview(minimumValueTF)
        textFieldsStackView.addArrangedSubview(maximumValueTF)
    }
    
    private func configureButtonStackView() {
        setupConstraintsForButtonStackView()
        buttonsStackView.spacing = 8
        buttonsStackView.addArrangedSubview(saveButton)
        buttonsStackView.addArrangedSubview(cancelButton)
    }
}

// MARK: UI-elements
extension SettingsView {
    
    private func makeStackView(axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        return stackView
    }
    
    private func makeTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        return textField
    }
    
    
    private func makeButton(withTitle title: String, textColor: UIColor? = nil) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .plain()
        button.configuration?.title = title
        button.configuration?.attributedTitle?.font = .boldSystemFont(ofSize: 30)
        button.configuration?.attributedTitle?.foregroundColor = textColor
        return button
    }
}

// MARK: Constraints
extension SettingsView {
    
    private func setupConstraintsForTextFieldStackView() {
        addSubview(textFieldsStackView)
        NSLayoutConstraint.activate([
            textFieldsStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            textFieldsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            textFieldsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
        ])
    }
    
    private func setupConstraintsForButtonStackView() {
        addSubview(buttonsStackView)
        NSLayoutConstraint.activate([
            buttonsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
