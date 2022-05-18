//
//  AcceptanceTests.swift
//  AcceptanceTests
//
//  Created by Amine Fattas on 18/05/2022.
//

import XCTest

class AcceptanceTests: XCTestCase {

    func test_onLaunch_displaysRemoteUsersWhenCustomerHasConnectivity() {
//        let feed = launch(httpClient: .online(response), store: .empty)
//
//        XCTAssertEqual(feed.numberOfRenderedFeedImageViews(), 2)
//        XCTAssertEqual(feed.renderedFeedImageData(at: 0), makeImageData())
//        XCTAssertEqual(feed.renderedFeedImageData(at: 1), makeImageData())
    }

    func test_onLaunch_displaysCachedUsersWhenCustomerHasNoConnectivity() {
//        let sharedStore = InMemoryFeedStore.empty
//        let onlineFeed = launch(httpClient: .online(response), store: sharedStore)
//        onlineFeed.simulateFeedImageViewVisible(at: 0)
//        onlineFeed.simulateFeedImageViewVisible(at: 1)
//
//        let offlineFeed = launch(httpClient: .offline, store: sharedStore)
//
//        XCTAssertEqual(offlineFeed.numberOfRenderedFeedImageViews(), 2)
//        XCTAssertEqual(offlineFeed.renderedFeedImageData(at: 0), makeImageData())
//        XCTAssertEqual(offlineFeed.renderedFeedImageData(at: 1), makeImageData())
    }

    func test_onLaunch_displaysAlertWhenCustomerHasNoConnectivityAndNoCache() {
//        let feed = launch(httpClient: .offline, store: .empty)
//
//        XCTAssertEqual(feed.numberOfRenderedFeedImageViews(), 0)
    }

    func test_onEnteringBackground_keepsNonExpiredUsersCache() {
//        let store = InMemoryFeedStore.withNonExpiredFeedCache
//
//        enterBackground(with: store)
//
//        XCTAssertNotNil(store.feedCache, "Expected to keep non-expired cache")
    }

    func test_onUserSelection_displaysTasks() {
//        let comments = showCommentsForFirstImage()
//
//        XCTAssertEqual(comments.numberOfRenderedImageCommentsViews(), 1)
//        XCTAssertEqual(comments.commentMessage(at: 0), makeImageCommentMessage())
    }

}
