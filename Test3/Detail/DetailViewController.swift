//
//  DetailViewController.swift
//  Test3
//
//  Created by Thanh Nguyen Viet on 20/05/2024.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {

    @IBOutlet weak var objectImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descripTextView: UITextView!
    @IBOutlet weak var toARScreenButton: UIButton!
    var object: ARObject?
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objectImg.image = UIImage(named: object!.image)
        titleLabel.text = object?.name
        locationLabel.text = object?.location
        descripTextView.text = object?.description
        
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

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        audioPlayer!.stop()
    }
    
    @IBAction func toARScreenTap(_ sender: Any) {
        performSegue(withIdentifier: "ToMainVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let desVC = segue.destination as! ViewController
        desVC.ARLink = object?.ARLink
    }
    
    @IBAction func backTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func playAudioTap(_ sender: Any) {
        print("1")
        audioPlayer!.play()
    }
}
