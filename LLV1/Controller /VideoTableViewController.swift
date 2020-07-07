//
//  VideoTableViewController.swift
//  LLV1
//
//  Created by Macklin Thomas on 5/27/20.
//  Copyright © 2020 Macklin Thomas. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import SceneKit



class VideosTableViewController: UITableViewController
{

    let videos: [Video] = Video.fetchVideos()
    var player = AVPlayer()
    var playerViewController = AVPlayerViewController()
    
    
 
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(videos.count)
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        let video = videos[indexPath.row]
        cell.video = video
        return(cell)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        playVideo(at: indexPath)
    }
    
    func playVideo(at indexPath: IndexPath){
        let selectedVideo = videos[indexPath.row]
        let videoPath = selectedVideo.videoFileName
        guard let videoPathLink = URL(string: videoPath) else {
            return
        }
        player = AVPlayer(url: videoPathLink)
        playerViewController.player = player
        
        
        
        
        self.present(playerViewController, animated: true, completion: {
            self.playerViewController.player?.play()
        })
    }
    

}
