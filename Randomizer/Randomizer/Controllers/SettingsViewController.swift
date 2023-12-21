//
//  SettingsViewController.swift
//  Randomizer
//
//  Created by Nikolai Maksimov on 20.12.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    var minimumValue: String!
    var maximumValue: String!
    
    weak var settingsViewDelegate: SettingsViewControllerDelegate?
    private let settingsView = SettingsView()
    
    override func loadView() {
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
    }
}

// MARK: Methods
extension SettingsViewController {
    
    private func commonInit() {
        setCurrentValues()
        addTargetForButtons()
    }
    
    private func setCurrentValues() {
        settingsView.minimumValueTF.text = minimumValue
        settingsView.maximumValueTF.text = maximumValue
    }
    
    private func addTargetForButtons() {
        settingsView.saveButton.addTarget(self, action: #selector(setupNewValuesForMainView), for: .touchUpInside)
        settingsView.cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    @objc
    private func setupNewValuesForMainView() {
        guard let minValue = settingsView.minimumValueTF.text, !minValue.isEmpty,
        let maxValue = settingsView.maximumValueTF.text, !maxValue.isEmpty else {
            showAlert(title: "Отсутствует значение", message: "Поле обязательно для заполнения!")
            return
        }
        
        guard let minIntValue = Int(minValue),  let maxIntValue = Int(maxValue), minIntValue < maxIntValue else {
            showAlert(title: "Некорректно указаны вводные данные",
                      message: "Минимальное число не может быть больше максимального!\n \( minValue) > \(maxValue)")
            return
        }
        
        settingsViewDelegate?.setNewValues(minimum: minValue, maksimum: maxValue)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc
    private func cancel() {
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: AlertController
extension SettingsViewController {
    
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            completion?()
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}
