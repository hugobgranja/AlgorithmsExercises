//
//  SNCTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 12/10/2020.
//

import XCTest

final class SocialNetworkConnectivityTests: XCTestCase {
    
    func testSNC() {
        let members = 10
        let logs = [
            SNCTimestamp(date: "2019-12-22", userId1: 0, userId2: 9),
            SNCTimestamp(date: "2020-01-01", userId1: 1, userId2: 2),
            SNCTimestamp(date: "2020-02-05", userId1: 1, userId2: 4),
            SNCTimestamp(date: "2020-02-12", userId1: 4, userId2: 7),
            SNCTimestamp(date: "2020-02-18", userId1: 5, userId2: 6),
            SNCTimestamp(date: "2020-02-22", userId1: 6, userId2: 3),
            SNCTimestamp(date: "2020-03-24", userId1: 3, userId2: 2),
            SNCTimestamp(date: "2020-04-11", userId1: 8, userId2: 7),
            SNCTimestamp(date: "2020-05-23", userId1: 1, userId2: 8),
            SNCTimestamp(date: "2020-06-04", userId1: 9, userId2: 8),
            SNCTimestamp(date: "2020-07-12", userId1: 7, userId2: 9),
        ]

        let snc = SocialNetworkConnectivity(members: members, logs: logs)
        let date = snc.earliestAllConnected()
        XCTAssertEqual(date, "2020-06-04")
    }

}
