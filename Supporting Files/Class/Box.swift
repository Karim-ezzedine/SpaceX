//
//  Box.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import Foundation

//MARK: - Note:
/// Box Class is used for value binding
class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
