//
//  ApplicationCoordinator.swift
//  MinGallery
//
//  Created by Nicolau Atala on 24/09/20.
//  Copyright © 2020 Nicolau Atala. All rights reserved.
//
import UIKit

class ApplicationCoordinator: Coordinator {
	
	let window: UIWindow
	
	internal init(window: UIWindow) {
		self.window = window
	}
	
	func start() {
		let navigationController = UINavigationController()
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
		
		let startCoordinator = GalleryCoordinator(navigationController: navigationController)
		coordinate(to: startCoordinator)
	}
}
