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
        guard let minValue = settingsView.minimumValueTF.text, !minValue.isEmpty else { return }
        guard let maxValue = settingsView.maximumValueTF.text, !maxValue.isEmpty else { return }
        settingsViewDelegate?.setNewValues(minimum: minValue, maksimum: maxValue)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc
    private func cancel() {
        navigationController?.popToRootViewController(animated: true)
    }
}
