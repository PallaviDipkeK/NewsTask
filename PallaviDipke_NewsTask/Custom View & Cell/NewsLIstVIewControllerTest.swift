//
//  NewsLIstVIewControllerTest.swift
//  PallaviDipke_NewsTaskTests
//
//  Created by Admin on 4/8/21.
//

import XCTest

@testable import PallaviDipke_NewsTask

class NewsListVIewControllerTest: XCTestCase {
    var newsListViewController: NewsListViewController?
    var dataSource: NewListModel? = nil
    override func setUp() {
        super.setUp()
        let article = Article(source: Source(id: "1", name: "TEST_SOURCE_NAME"), author: "TEST_AUTHOR", title: "TEST_TITLE", description: "TEST_DESCRIPTION", url: "TEST_URL", urlToImage: "TEST_IMAGE", publishedAt: "TEST_DATE", content: "TEST_CONTENT")
        let news = NewListModel(status: "ok", totalResults: 1, articles: [article])
        dataSource = news
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        configureViewController()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - DATA SOURCE CHECK TEST
    private  func testDataSourceHasArticles() {
        XCTAssertEqual(dataSource?.articles.count, 1,
                       "DataSource should have correct number of articles")
    }
    
    // MARK: - UI CHECK TEST
    private func configureViewController() {
        newsListViewController = StoryBoard.mainStoryboard.instantiateViewController(withIdentifier: SegueIdentifier.NewsListViewController) as? NewsListViewController
        newsListViewController?.loadViewIfNeeded()
    }
    
    private func testViewControllerExists() {
        XCTAssertNotNil(newsListViewController, "newsListViewController does not exist")
    }
    
    private func testTableViewOutletAdded() {
        let tableView: UITableView? = newsListViewController?.newsTableView
        XCTAssertNotNil(tableView, "Table not initialized")
    }
    
    private func testCheckCelloutlet() {
        let tableView: UITableView? = newsListViewController?.newsTableView
        XCTAssertNotNil(tableView, "Table not initialized")
    }
    
    // MARK: - API CHECK TEST
    
    func testParsingifAPIResponse() {
        let expection = self.expectation(description: "Data is not nil")
        ApiCallManager.shared.getNewListContent { (status, response, error) in
           if let data = response {
                XCTAssertNotNil(data)
            XCTAssertGreaterThan(data.articles.count, 0)
                expection.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    private func testGetNewsDatafromAPI() {
        let moviesExpectation = expectation(description: "Status Ok")
        newsListViewController?.viewModel?.fetchnewsListData{ (status, response,error) in
            if let responseData = response,responseData.status == "ok",status{
                moviesExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 2) { (error) in
            if (error != nil){
                XCTAssert(false, "Api failed with error")
            }
            
        }
    }
    
}
