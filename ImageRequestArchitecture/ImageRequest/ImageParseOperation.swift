//
//  ImageParseOperation.swift
//  ImageRequest
//
//  Created by Jarrod Parkes on 10/3/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit
import Foundation

// MARK: - ImageParseOperation: BaseOperation

class ImageParseOperation: BaseOperation {
    
    // MARK: Properties
    
    var parsedImage: UIImage?
    var parsedError: Error?
    
    // MARK: Operation
    
    override func start() {
        state = .Executing
        
        // extract data from finished fetch operation
        if let imageFetchOp = dependencies.first as? ImageFetchOperation {
            if let data = imageFetchOp.fetchedImageData {
                parsedImage = UIImage(data: data)
            }
            parsedError = imageFetchOp.fetchedError
        } else {
            print("unexpected operation dependency chain")
        }
        
        state = .Finished
    }
}