//
//  AuthenticationServiceTest.swift
//  MvvmDemoAppTests
//
//  Created by ashish on 09/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import XCTest
@testable import MvvmDemoApp

class AuthenticationServiceTest : XCTestCase {
    
    var webService : WebServiceProtocol!
    
    override func setUp() {
        super.setUp()
        self.webService = WebService.init(firebaseHandler: MockFirebaseHandler())
    }
    
    override func tearDown() {
        super.tearDown()
        self.webService = nil
    }
    
    
    func testAuthenticateUser(){
        let authenticationService = AuthenticationService.init(webService: self.webService)
        authenticationService.AuthenticateUser(user: User(email: "mock@mock.com", password: "Nokia@1122", phoneNumber: nil)) { (status, errorMessage) in
            XCTAssertTrue(status)
        }
    }
}
