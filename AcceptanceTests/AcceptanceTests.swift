//
//  AcceptanceTests.swift
//  AcceptanceTests
//
//  Created by Amine Fattas on 18/05/2022.
//

import XCTest
@testable import MAExam

class AcceptanceTests: XCTestCase {
    
    var tableView : UITableView?

    func test_onLaunch_displaysRemoteUsersWhenCustomerHasConnectivity() {
        let (_, usersVC) = launch(httpClient: .online(response), store: .empty)
        usersVC.simulateViewWillAppear()
        
        XCTAssertEqual(usersVC.numberOfRenderedUsers(), 2)
        XCTAssertEqual(usersVC.renderedUserData(at: 0),
                       userDictWithoutId(user: user1))
        XCTAssertEqual(usersVC.renderedUserData(at: 1),
                       userDictWithoutId(user: user2))
    }

    func test_onLaunch_displaysCachedUsersWhenCustomerHasNoConnectivity() {
        let sharedStore = CacheStoreStub.empty
        let (_, onlineFeed) = launch(httpClient: .online(response), store: sharedStore)
        onlineFeed.simulateViewWillAppear()

        let (_, offlineFeed) = launch(httpClient: .offline, store: sharedStore)
        offlineFeed.simulateViewWillAppear()
        
        XCTAssertEqual(offlineFeed.numberOfRenderedUsers(), 2)
        XCTAssertEqual(offlineFeed.renderedUserData(at: 0), userDictWithoutId(user: user1))
        XCTAssertEqual(offlineFeed.renderedUserData(at: 1), userDictWithoutId(user: user2))
    }

    func test_onLaunch_displaysAlertWhenCustomerHasNoConnectivityAndNoCache() {
        let sharedStore = CacheStoreStub.empty
        let (_, offlineFeed) = launch(httpClient: .offline, store: sharedStore)
        
        offlineFeed.simulateViewWillAppear()
        
        XCTAssertEqual(offlineFeed.numberOfRenderedUsers(), 0)
        expectAlertControllerToShow(in: offlineFeed)
    }

    func test_onUserSelection_invokTasksVC() {
        let (sceneDelegate, usersVC) = launch(httpClient: .online(response), store: .empty)
        /// just to silence the warning : value 'sceneDelegate' was never used
        let _ = sceneDelegate
        usersVC.simulateViewWillAppear()
        
        usersVC.simulateTapOnUserItem(at: 1)
        RunLoop.current.run(until: Date() + 10)
        
        
        let nav = usersVC.navigationController
        let tasksVC = nav?.topViewController as? TasksVC
        
        XCTAssertNotNil(tasksVC)
    }
    
    //MARK: - Helpers -
    private func launch(
        httpClient: HTTPClientStub = .offline,
        store: CacheStoreStub = .empty
    ) -> (SceneDelegate, UsersVC) {
        let sut = SceneDelegate(httpClient: httpClient, cacheStore: store)
        sut.window = UIWindow()
        sut.configureWindow()

        let nav = sut.window?.rootViewController as? UINavigationController
        let userVC = nav?.topViewController as! UsersVC
        return (sut, userVC)
    }
    
    private func response(for url: URL) -> (Data, HTTPURLResponse) {
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        return (makeData(from: [user1, user2]), response)
    }
    
    private func makeData(from object: Any) -> Data {
        return try! JSONSerialization.data(withJSONObject: object)
    }
    
    private var user1 : [String : Any] {
        [
            "id": 1,
            "name": "a name",
            "username": "an username",
            "email": "an email",
        ]
    }
    
    private var user2 : [String : Any] {
        [
            "id": 2,
            "name": "another name",
            "username": "another username",
            "email": "another email",
        ]
    }
    
    private func userDictWithoutId(user : [String : Any]) -> NSDictionary {
        var user: Dictionary<String, Any> = user
        user.removeValue(forKey: "id")
        return user.toNSDictionary
    }
    
    private func expectAlertControllerToShow(in vc: UIViewController){
        let expectation = XCTestExpectation(description: "Error alert")
              DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                  XCTAssertTrue(vc.navigationController?.presentedViewController is UIAlertController)
                expectation.fulfill()
              })
        wait(for: [expectation], timeout: 1.5)
    }
}


extension SceneDelegate {
    convenience init(httpClient: HTTPClient, cacheStore: CacheStore) {
        self.init()
        self.httpClient = httpClient
        self.cacheStore = cacheStore
    }
}

extension UsersVC {
    func numberOfRenderedUsers() -> Int {
        tableView.numberOfRows(inSection: 0)
    }
    
    func renderedUserData(at index: Int) -> NSDictionary {
        let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! UserCell
        let dict = cell.getDictFromModel()
        return dict.toNSDictionary
    }
    
    func simulateTapOnUserItem(at row: Int) {
        let delegate = tableView.delegate
        let index = IndexPath(row: row, section: 0)
        delegate?.tableView?(tableView, didSelectRowAt: index)
    }
}

extension UIViewController {
    func simulateViewWillAppear(){
        loadViewIfNeeded()
        beginAppearanceTransition(true, animated: false)
    }
}

extension UserCell {
     func getDictFromModel() -> [String: Any]{
        [
            "name": ul_name.text ?? "",
            "username": ul_username.text ?? "",
            "email": ul_email.text ?? "",
        ]
    }
}

extension Dictionary {
    var toNSDictionary : NSDictionary {
        NSDictionary(dictionary: self, copyItems: true)
    }
}
