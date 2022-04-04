//
//  ReplaceSegue.swift
//  Yolla
//
//  Created by Eda Altuntaş on 31.03.2022.
//

import Foundation
import UIKit

class ReplaceSegue : UIStoryboardSegue {
    override func perform() {
        if let navigationController = self.source.navigationController {
            navigationController.setViewControllers([self.destination], animated: true)
        }
    }
}
