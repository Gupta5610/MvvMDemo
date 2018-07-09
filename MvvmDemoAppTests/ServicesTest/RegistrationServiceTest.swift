//
//  RegistrationServiceTest.swift
//  MvvmDemoAppTests
//
//  Created by ashish on 09/07/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import XCTest
@testable import MvvmDemoApp

class RegistrationServiceTest : XCTestCase{
    
    var webService : WebServiceProtocol!
    
    override func setUp() {
        super.setUp()
        self.webService = MockWebService()
    }
    
    override func tearDown() {
        super.tearDown()
        self.webService = nil
    }
    
    func testRegisterUser(){
        let registrationService = RegistrationService.init(webService: self.webService)
        
        registrationService.registerUser(user: User(email: "mock@mock.com", password: "Nokia@1122", phoneNumber: nil)) { (status, nil) in
            XCTAssertTrue(status)
        }
    }
    
}
