//
//  Video.swift
//  LLV1
//
//  Created by Macklin Thomas on 5/27/20.
//  Copyright © 2020 Macklin Thomas. All rights reserved.
//

import Foundation

struct Video
{
    let authorName: String
    let videoFileName: String
    let description: String
    let thumbnailFileName: String
    
    static func fetchVideos() ->[Video]{
        let v1 = Video(authorName: "Macklin Thomas", videoFileName: "v1", description: "This is an example of local video.", thumbnailFileName: "v1")
        let v2 = Video(authorName: "Anthony Powell", videoFileName: "v2", description: "This is an example of local video.", thumbnailFileName: "v2")
        let v3 = Video(authorName: "Decorian Johnson", videoFileName: "v3", description: "This is an example of local video.", thumbnailFileName: "v3")
        let v4 = Video(authorName: "Enchantirse Barrett", videoFileName: "v4", description: "This is an example of local video.", thumbnailFileName: "v4")
        let v5 = Video(authorName: "Tiffant Henderson", videoFileName: "v5", description: "This is an example of local video.", thumbnailFileName: "v5")
        
        return [v1, v2, v3, v4, v5]
    }
}
