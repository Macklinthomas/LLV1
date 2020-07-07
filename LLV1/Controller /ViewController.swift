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
import GoogleMobileAds

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    //var interstitial: GADInterstitial!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        //interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")

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
            url = "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/IMG_4426.mov?alt=media&token=6b343acf-8300-4718-949b-bdbe1e4d92c1"
            break
        case "appleMouse":
            url = "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/MC.mov?alt=media&token=18c80ecf-ad54-467f-a0bd-4c00e8dd00bb"
            break
        case "Funk Shui-Artwork":
            url = "https://firebasestorage.googleapis.com/v0/b/llv1-d7b95.appspot.com/o/IMG_4426.mov?alt=media&token=6b343acf-8300-4718-949b-bdbe1e4d92c1"
            break
        default: break
        }
        guard let videoLink = URL(string: url) else {
            return
        }
        DispatchQueue.main.async {
            print("Image found")
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
