//
//  Box.swift
//  MVVMApp
//
//  Created by Дарья Кобелева on 31.07.2024.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: (Listener)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
