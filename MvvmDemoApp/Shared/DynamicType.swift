//
//  DynamicType.swift
//  MvvmDemoApp
//
//  Created by ashish on 26/06/18.
//  Copyright © 2018 dawbrack. All rights reserved.
//

import Foundation


class Dynamic<T> {
    
    typealias  Listener = (T) -> Void
    var listner : Listener?

    var value : T? {
        didSet{
            self.listner?(value!)
        }
    }

    init(_ value : T){
        self.value = value
    }
    
    func bind(completetion : @escaping (T) -> ()){
        self.listner = completetion
        self.listner?(value!)
    }
}
