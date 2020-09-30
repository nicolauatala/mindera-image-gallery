//
//  GalleryCoordinator.swift
//  MinGallery
//
//  Created by Nicolau Atala on 24/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import UIKit

class GalleryCoordinator: Coordinator {
	internal let navigationController: UINavigationController
	
	internal init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let galleryViewController = storyboard.instantiateViewController(identifier: "GalleryViewController")
		self.navigationController.pushViewController(galleryViewController, animated: false)
	}
}
