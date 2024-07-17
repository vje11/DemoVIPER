//
//  NetworkTypealias.swift
//  
//
//  Created by Vijay  on 16/07/2024.
//

/// A dictionary of parameters to apply to a `URLRequest`.
public typealias Parameters = [String: Any]

/// A dictionary containing request header info
public typealias HTTPHeaders = [String: String]

/// Api response handler
public typealias NetworkResponseHandler<T> = (APIResults<T>) -> Void
