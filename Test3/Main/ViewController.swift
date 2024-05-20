import UIKit
import SceneKit
import ARKit
import RealityKit
import FocusEntity

class ViewController: UIViewController, ARSessionDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var arView: ARView!
    var modelEntity: ModelEntity?
    var focusEntity: FocusEntity?
    var placeButton: UIButton!
    var ARLink: String!
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = Bundle.main.url(forResource: "NhaThaiTrangVoice", withExtension: "mp3") else {
            print(0)
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        } catch let error {
            print(error.localizedDescription)
        }
        
        // Set up ARView
        arView = ARView(frame: view.bounds, cameraMode: .ar, automaticallyConfigureSession: true)
        arView.session.delegate = self
        arView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(arView)

        NSLayoutConstraint.activate([
            arView.topAnchor.constraint(equalTo: view.topAnchor),
            arView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            arView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            arView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        // Set up FocusEntity
        focusEntity = FocusEntity(on: arView, style: .classic())

        // Load the ModelEntity but don't add it to the scene yet
        
        let scene = SCNScene(named: ARLink)!
        if let scnNode = scene.rootNode.childNodes.first {
            modelEntity = convertToModelEntity(node: scnNode)
            modelEntity?.generateCollisionShapes(recursive: true)
        }

        // Set up the "Place" button
        placeButton = UIButton(type: .system)
        placeButton.setTitle("Place", for: .normal)
        placeButton.setTitleColor(.white, for: .normal)
        placeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        placeButton.translatesAutoresizingMaskIntoConstraints = false
        placeButton.addTarget(self, action: #selector(placeObject), for: .touchUpInside)
        placeButton.layer.cornerRadius = 5
        placeButton.layer.borderWidth = 3
        placeButton.layer.borderColor = UIColor.white.cgColor
        view.addSubview(placeButton)

        NSLayoutConstraint.activate([
            placeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            placeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeButton.widthAnchor.constraint(equalToConstant: 100),
            placeButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        // Set up the "Back" button
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitle("Back", for: .normal)
        backButton.tintColor = UIColor.white
        backButton.setTitleColor(.white, for: .normal)
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton)

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 80),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Set up the "Play Audio" button
        let playAudioButton = UIButton(type: .system)
        playAudioButton.setImage(UIImage(systemName: "headphones.circle"), for: .normal)
        playAudioButton.setTitleColor(.white, for: .normal)
        playAudioButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        playAudioButton.tintColor = UIColor.white
        playAudioButton.translatesAutoresizingMaskIntoConstraints = false
        playAudioButton.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        view.addSubview(playAudioButton)

        NSLayoutConstraint.activate([
            playAudioButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            playAudioButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            playAudioButton.widthAnchor.constraint(equalToConstant: 80),
            playAudioButton.heightAnchor.constraint(equalToConstant: 40)
        ])

    }
    
    @objc func playAudio() {
        audioPlayer.play()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal

        // Run the view's session
        arView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Pause the view's session
        arView.session.pause()
    }

    @objc func backAction() {
        self.dismiss(animated: true)
    }

    @objc func placeObject() {
        guard let modelEntity = modelEntity, let focusEntity = focusEntity else { return }

        // Place the modelEntity at the focusEntity's position
        modelEntity.position = focusEntity.position
        let anchorEntity = AnchorEntity(world: focusEntity.position)
        anchorEntity.addChild(modelEntity)
        arView.scene.addAnchor(anchorEntity)

        // Install gesture recognizers on the placed model entity
        arView.installGestures([.translation, .rotation, .scale], for: modelEntity)

        // Hide the focus entity after placing the object
        focusEntity.isEnabled = false
        placeButton.isHidden = true
    }

    // Helper method to convert SCNNode to ModelEntity
    func convertToModelEntity(node: SCNNode) -> ModelEntity? {
        let scene = SCNScene(named: ARLink)!
        scene.rootNode.addChildNode(node.clone())

        // Create a temporary directory
        let tempDirectory = FileManager.default.temporaryDirectory
        let uuid = UUID().uuidString
        let tempFileURL = tempDirectory.appendingPathComponent("\(uuid).usdz")

        if FileManager.default.fileExists(atPath: tempFileURL.path) {
            do {
                try FileManager.default.removeItem(at: tempFileURL)
            } catch {
                print("Failed to delete existing temp.usdz file: \(error)")
            }
        }

        // Export the SCNNode to USDZ
        let success = scene.write(to: tempFileURL, options: nil, delegate: nil, progressHandler: nil)
        guard success else {
            print("Failed to export SCNNode to USDZ")
            return nil
        }

        // Load the USDZ into a ModelEntity
        do {
            let modelEntity = try ModelEntity.loadModel(contentsOf: tempFileURL)
            return modelEntity
        } catch {
            print("Failed to load USDZ file into ModelEntity: \(error)")
            return nil
        }
    }

    // MARK: - ARSessionDelegate

    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
    }

    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
    }

    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
    }
}
extension SCNVector3 {
    static func + (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left.x + right.x, left.y + right.y, left.z + right.z)
    }

    static func - (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left.x - right.x, left.y - right.y, left.z - right.z)
    }

    static func += (left: inout SCNVector3, right: SCNVector3) {
        left = left + right
    }
}
