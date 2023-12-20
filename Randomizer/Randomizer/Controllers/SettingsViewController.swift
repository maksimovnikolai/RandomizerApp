//
//  SettingsViewController.swift
//  Randomizer
//
//  Created by Nikolai Maksimov on 20.12.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    private let settingsView = SettingsView()
    
    override func loadView() {
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
