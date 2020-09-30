@testable import MinGallery
import XCTest

final class GalleryViewControllerTests: XCTestCase {

	var sut: GalleryViewController!
	
	override func setUp() {
		sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GalleryViewController") as? GalleryViewController
		_ = sut.view
	}
	
	func test_initialize_collection_view() {
		XCTAssertNotNil(sut.collectionView)
	}
	
	func test_collection_view_data_source_not_nil() {
		XCTAssertNotNil(sut.collectionView.dataSource)
		XCTAssertNotNil(sut.collectionView.dataSource is GalleryViewController)
	}
	
}
