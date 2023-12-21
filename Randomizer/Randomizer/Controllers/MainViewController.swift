//
//  MainViewController.swift
//  Randomizer
//
//  Created by Nikolai Maksimov on 20.12.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Random Number"
        setupRightBarButton()
    }
    
    private func setupRightBarButton() {
        let settingsButton = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(openSettingsScreen))
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    @objc
    private func openSettingsScreen() {
        let settingsVC = SettingsViewController()
        settingsVC.settingsViewDelegate = mainView
        settingsVC.minimumValue = mainView.minimumNumberLabel.text
        settingsVC.maximumValue = mainView.maximumNumberLabel.text
        navigationController?.pushViewController(settingsVC, animated: true)
    }
}
