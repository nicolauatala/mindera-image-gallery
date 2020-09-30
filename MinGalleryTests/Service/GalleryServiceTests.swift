@testable import MinGallery
import XCTest

final class GalleryServiceTests: XCTestCase {

	func test_fetch_photos() {
		let requestMock = RequestMock(MockData.photos)
		let service = GalleryService(session: requestMock)
		let expectantion = XCTestExpectation(description: "Service")
		
		service.fetchPhotos("cat", page: 1) { (result) in
			switch result {
			case .success(let response):
				XCTAssertFalse(response.photo.isEmpty)
			case .failure(let error):
				XCTFail(error.localizedDescription)
			}
			expectantion.fulfill()
		}
		wait(for: [expectantion], timeout: 5.0)
	}
	
	func test_get() {
		let requestMock = RequestMock(MockData.sizes)
		let service = GalleryService(session: requestMock)
		let expectantion = XCTestExpectation(description: "Service")
		
		service.sizesURLs("123") { (result) in
			switch result {
			case .success(let sizes):
				XCTAssertGreaterThan(sizes.count, 0)
			case .failure(let error):
				print(error.localizedDescription)
			}
			expectantion.fulfill()
		}
		
		wait(for: [expectantion], timeout: 5.0)
	}
}
