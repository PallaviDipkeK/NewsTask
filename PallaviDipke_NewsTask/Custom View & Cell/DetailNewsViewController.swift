//
//  DetailNewsViewController.swift
//  PallaviDipke_NewsTaskTests
//
//  Created by Admin on 4/8/21.
//

import XCTest

@testable import PallaviDipke_NewsTask

class DetailNewsViewControllerTest: XCTestCase {
    var detailNewsViewController: NewsDetailsViewController?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        configureViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - UI Related Unit Test
    private func configureViewController() {
        detailNewsViewController = StoryBoard.mainStoryboard.instantiateViewController(withIdentifier: SegueIdentifier.NewsDetailsViewController) as? NewsDetailsViewController
        detailNewsViewController?.loadViewIfNeeded()
    }
    
    func testViewControllerExists() {
        XCTAssertNotNil(detailNewsViewController, "detailNewsViewController does not exist")
    }
    
    func testTableViewOutletAdded() {
        let tableView: UITableView? = detailNewsViewController?.newsTableView
        XCTAssertNotNil(tableView, "Table not initialized")
    }

}
