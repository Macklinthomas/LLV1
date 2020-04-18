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

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        let configuration = ARImageTrackingConfiguration()
        
        if let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "String", bundle: Bundle.main){
            configuration.trackingImages = trackedImages
            configuration.maximumNumberOfTrackedImages = 2
        }
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor{
        
            let size = imageAnchor.referenceImage.physicalSize
            
            var video = SKVideoNode()
            //Add video files plus images.
//            switch imageAnchor.name{
//            case " ":
//                videoNode = SKVideoNode(fileNamed: " ")
//            case " ":
//                videoNode = SKVideoNode(fileNamed: " ")
//            default:
//                break
//            }
            
            let plane = SCNPlane(width: size.width, height: size.height)
            plane.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.6)
            let planeNode = SCNNode(geometry: plane)
            plane.firstMaterial?.isDoubleSided = true
            
            node.addChildNode(planeNode)
            return node
        }
        
        return nil
    }
}
