//
//  GalleryCoordinator.swift
//  MinGallery
//
//  Created by Nicolau Atala on 24/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//

import UIKit

class GalleryCoordinator: Coordinator {
	private let navigationController: UINavigationController
//	private let galleryViewController: GalleryViewController?
	
	internal init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let galleryViewController = GalleryViewController(nibName: nil, bundle: nil)
		self.navigationController.setNavigationBarHidden(true, animated: false)
		self.navigationController.pushViewController(galleryViewController, animated: false)
	}
}
