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
        let v1 = Video(authorName: "Macklin Thomas", videoFileName: "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/CoriDuzzItLondonBridges.mp4?alt=media&token=32c14cac-5b08-4f19-bd4f-8f85d7367062", description: "This is an example of local video.", thumbnailFileName: "v1")
        let v2 = Video(authorName: "Anthony Powell", videoFileName: "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/CoriDuzzItBroken.mp4?alt=media&token=39ddfb1c-0aed-47dc-9dcb-90cbeb56277e", description: "This is an example of local video.", thumbnailFileName: "v2")
        let v3 = Video(authorName: "Decorian Johnson", videoFileName: "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/CoriDuzzItNightTimeftCompanyatnite.mp4?alt=media&token=cb76db16-76b8-464e-8b98-fc348d149211", description: "This is an example of local video.", thumbnailFileName: "v3")
        let v4 = Video(authorName: "Enchantirse Barrett", videoFileName: "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/Concerto%20-%2011832.mp4?alt=media&token=107ea09b-7365-4147-a4c7-bb080e8a29d9", description: "This is an example of local video.", thumbnailFileName: "v4")
        let v5 = Video(authorName: "Tiffant Henderson", videoFileName: "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/Cherry%20-%2035629.mp4?alt=media&token=dd2466a0-f87d-4a86-a030-8cee273f1726", description: "This is an example of local video.", thumbnailFileName: "v5")
        
        return [v1, v2, v3, v4, v5]
    }
}
