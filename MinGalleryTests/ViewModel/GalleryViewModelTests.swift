@testable import MinGallery
import XCTest

final class GalleryViewModelTests: XCTestCase {
	
	var sut: GalleryViewModelMock!
	
	override func setUp() {
		sut = GalleryViewModelMock()
	}
	
	func test_view_model_initialization() {
		XCTAssertNotNil(sut.service)
		XCTAssertEqual(sut.page, 1)
		XCTAssertEqual(sut.searches.value.count, 0)
		XCTAssertEqual(sut.tag.value, "")
	}
	
	func test_load_gallery_should_be_change_view_model() {
		let tagTest = "cat"
		sut.loadGallery(tag: tagTest)
		XCTAssertEqual(sut.tag.value, tagTest)
		XCTAssertEqual(sut.searches.value.count, 1)
	}
	
	func test_get_square_image_should_be_return_url() {
		sut.getSquareImage(id: "123") { urlResponse in
			XCTAssertNotNil(urlResponse)
		}
	}
}
