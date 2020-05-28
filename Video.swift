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
        let v1 = Video(authorName: "Macklin Thomas", videoFileName: "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/MC.mov?alt=media&token=18c80ecf-ad54-467f-a0bd-4c00e8dd00bb", description: "This is an example of local video.", thumbnailFileName: "v1")
        let v2 = Video(authorName: "Anthony Powell", videoFileName: "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/Rock%20-%2015527.mp4?alt=media&token=6c645317-b12a-4e2d-aa9c-e120ee697d78", description: "This is an example of local video.", thumbnailFileName: "v2")
        let v3 = Video(authorName: "Decorian Johnson", videoFileName: "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/Drone%20-%2028261.mp4?alt=media&token=c28c9e82-697d-4f30-935c-05cd8207446b", description: "This is an example of local video.", thumbnailFileName: "v3")
        let v4 = Video(authorName: "Enchantirse Barrett", videoFileName: "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/Concerto%20-%2011832.mp4?alt=media&token=107ea09b-7365-4147-a4c7-bb080e8a29d9", description: "This is an example of local video.", thumbnailFileName: "v4")
        let v5 = Video(authorName: "Tiffant Henderson", videoFileName: "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/Cherry%20-%2035629.mp4?alt=media&token=dd2466a0-f87d-4a86-a030-8cee273f1726", description: "This is an example of local video.", thumbnailFileName: "v5")
        
        return [v1, v2, v3, v4, v5]
    }
}
