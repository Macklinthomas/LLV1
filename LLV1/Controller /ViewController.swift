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
    
    @objc func playVideo(anchorName: String?){
        var url : String = ""
        switch anchorName{
        case "businessBard":
            url = "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/MC.mov?alt=media&token=18c80ecf-ad54-467f-a0bd-4c00e8dd00bb"
            break
        case "appleMouse":
            url = "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/Run.mp4?alt=media&token=4e07fe65-6595-47a2-bda4-04554363d593"
            break
        default: break
        }
        guard let videoLink = URL(string: url) else {
            return
        }
        DispatchQueue.main.async {
            let player = AVPlayer(url: videoLink)
            let videoNode = SKVideoNode(avPlayer: player)
            let controller = AVPlayerViewController()
            controller.player = player
            self.present(controller, animated: true){
                videoNode.play()
            }
        }
        
    }
    
    @objc func callMain(){
        DispatchQueue.main.async {
        let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "mainTabController") as! mainTabController
        self.present(mainTabController, animated: true, completion: nil)
    }
    }
    
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = (anchor as? ARImageAnchor)else{return}
        if imageAnchor.isTracked{
            
            playVideo(anchorName: imageAnchor.name)

        }
    }
 

    
}
