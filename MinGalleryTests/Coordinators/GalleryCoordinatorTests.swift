@testable import MinGallery
import XCTest

final class GalleryCoordinatorTests: XCTestCase {
	
	var sut: GalleryCoordinator!
	
	override func setUp() {
		super.setUp()
		sut = GalleryCoordinator(navigationController: UINavigationController())
	}
	
	override func tearDown() {
		super.tearDown()
		sut = nil
	}
	
	func test_gallery_coordinator_initialization() {
		XCTAssertTrue(sut.navigationController.viewControllers.isEmpty)
	}
	
	func test_gallery_coordinator_start() {
		sut.start()
		let typeViewController = sut.navigationController.viewControllers[0]
		XCTAssertFalse(sut.navigationController.viewControllers.isEmpty)
		XCTAssert((typeViewController as Any) is GalleryViewController)
	}
	
}
