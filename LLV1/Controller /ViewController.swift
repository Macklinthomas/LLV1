//
//  ViewController.swift
//  LLV1
//
//  Created by Macklin Thomas on 4/15/20.
//  Copyright © 2020 Macklin Thomas. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation
import AVKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(renderer(_:nodeFor:)), name: .AVPlayerItemDidPlayToEndTime, object: nil)
        let configuration = ARImageTrackingConfiguration()
        
        if let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "My Bros", bundle: Bundle.main){
            configuration.trackingImages = trackedImages
            configuration.maximumNumberOfTrackedImages = 2
        }
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        //sceneView.session.pause()
    }
    
    @objc func playVideo(){
        guard let videoLink = URL(string: "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/MC.mov?alt=media&token=18c80ecf-ad54-467f-a0bd-4c00e8dd00bb") else {
            return
        }
        DispatchQueue.main.async {
            let player = AVPlayer(url: videoLink)
            let controller = AVPlayerViewController()
            controller.player = player
            self.present(controller, animated: true){
                player.play()
            }
        }
    }

    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {

        if let imageAnchor = anchor as? ARImageAnchor{
            switch imageAnchor.name{
            case "businessBard":
                playVideo()
                //videoNode = SKVideoNode(fileNamed: "MC.mov")
            default:
                break
            }
        }
        return nil
    }
    
}
