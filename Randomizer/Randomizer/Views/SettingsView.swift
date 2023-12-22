//
//  SettingsView.swift
//  Randomizer
//
//  Created by Nikolai Maksimov on 20.12.2023.
//

import UIKit

final class SettingsView: UIView {
    
    lazy var minimumValueTF = makeTextField(placeholder: "Минимальное число")
    lazy var maximumValueTF = makeTextField(placeholder: "Максимальное число")

    lazy var saveButton = makeButton(withTitle: "Сохранить")
    lazy var cancelButton = makeButton(withTitle: "Выйти", textColor: .red)
    
    private lazy var minimumValueLabel = makeLabel(withTitle: "Минимальное значение")
    private lazy var maximumValueLabel = makeLabel(withTitle: "Максимальное значение")
    
    private lazy var textFieldsStackView = makeStackView(axis: .vertical)
    private lazy var buttonsStackView = makeStackView(axis: .vertical)
    private lazy var minValueStackView = makeStackView(axis: .vertical)
    private lazy var maxValueStackView = makeStackView(axis: .vertical)
    
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
        configureMinValueStackView()
        configureMaxValueStackView()
        configureTextFieldStackView()
        configureButtonStackView()
    }
    
    private func configureTextFieldStackView() {
        setupConstraintsForTextFieldStackView()
        textFieldsStackView.spacing = 20
        textFieldsStackView.addArrangedSubview(minValueStackView)
        textFieldsStackView.addArrangedSubview(maxValueStackView)
    }
    
    private func configureButtonStackView() {
        setupConstraintsForButtonStackView()
        buttonsStackView.spacing = 8
        buttonsStackView.addArrangedSubview(saveButton)
        buttonsStackView.addArrangedSubview(cancelButton)
    }
    
    private func configureMinValueStackView() {
        minValueStackView.spacing = 3
        minValueStackView.addArrangedSubview(minimumValueLabel)
        minValueStackView.addArrangedSubview(minimumValueTF)
    }
    
    private func configureMaxValueStackView() {
        maxValueStackView.spacing = 3
        maxValueStackView.addArrangedSubview(maximumValueLabel)
        maxValueStackView.addArrangedSubview(maximumValueTF)
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
    
    private func makeLabel(withTitle title: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.text = title
        return label
    }
    
    private func makeTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        textField.clearsOnBeginEditing = true
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
            buttonsStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
        ])
    }
}
