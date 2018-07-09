//
//  MvvmDemoAppTests.swift
//  MvvmDemoAppTests
//
//  Created by ashish on 08/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import XCTest
@testable import MvvmDemoApp


class WebServiceTest: XCTestCase {
    
    var firebaseHandler : FirebaseProtocol!
    
    override func setUp() {
        super.setUp()
        self.firebaseHandler = MockFirebaseHandler()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.firebaseHandler = nil
    }
    
    func testsignIn(){
        var webService = WebService.init(firebaseHandler: self.firebaseHandler)
        webService.AuthenticateUser(user: User.init(email: "mock@mock.com", password: "Nokia@1122", phoneNumber: nil)) { (status, errorMessage) in
            XCTAssertTrue(status)
        }
    }
    
    func testRegisterUser(){
        WebService.init(firebaseHandler: self.firebaseHandler).registerUser(user: User(email: "mock@mock.com", password: "Nokia@1122", phoneNumber: nil)) { (status, errorMessage) in
            XCTAssertTrue(status)
        }
    }
    
    func testSignOut(){
        WebService.init(firebaseHandler: self.firebaseHandler).signOut { (status, errorMessage) in
            XCTAssertTrue(status)
        }
    }
    
}
