//
//  SongListController.swift
//  Audio-Player
//
//  Created by Zenya Kirilov on 3.09.22.
//

import UIKit

class SongListController: UIViewController {

    // player entity
    var player: Player!
    
    // player controller entity
    var playerController: PlayerController!
    
    // getting rectangle on the top of the view
    lazy var topRect = addYellowRect()
    
    // getting the top label
    lazy var topLabel = addPlaylistLabel()
    
    // getting first song image
    lazy var firstSongImage = getImageView(imageName: "1.png", x: view.frame.minX + 5, y: topLabel.center.y + 40)
    
    // getting secong song image
    lazy var secondSongImage = getImageView(imageName: "2.png", x: view.frame.minX + 5, y: firstSongImage.frame.maxY + 20)
    
    // getting first song duration label
    lazy var firstDurationLabel = getDurationLabel(duration: "3:09", x: firstSongButton.frame.maxX - 30, y: firstSongButton.center.y)
    
    // getting second duration label
    lazy var secondDurationLabel = getDurationLabel(duration: "3:24", x: secondSongButton.frame.maxX - 30, y: secondSongButton.center.y)
    
    // getting first song button
    lazy var firstSongButton = getSongButtton(forSong: "                Lilly Wood The Prick-Prayer in C", x: firstSongImage.frame.minX, y: firstSongImage.frame.minY)
    
    // getting second song button
    lazy var secondSongButton = getSongButtton(forSong: "                Imagine Dragons - Believer", x: secondSongImage.frame.minX, y: secondSongImage.frame.minY)
    
    override func loadView() {
        super.loadView()
        
        view.layer.addSublayer(topRect)
        view.addSubview(topLabel)
        view.addSubview(firstSongImage)
        view.addSubview(secondSongImage)
        view.addSubview(firstDurationLabel)
        view.addSubview(secondDurationLabel)
        view.addSubview(firstSongButton)
        view.addSubview(secondSongButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        firstSongButton.tag = 0
        secondSongButton.tag = 1
        
        player = Player()
        playerController = PlayerController()
    }
    
    private func addYellowRect() -> CAShapeLayer {
        // layer creation
        let layer = CAShapeLayer()
        let path = UIBezierPath(rect: CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.width, height: 100))
        path.close()
        
        // layer appearence settings
        layer.path = path.cgPath
        layer.fillColor = UIColor(red: 0.9, green: 0.8, blue: 0.6, alpha: 1).cgColor
        
        return layer
    }

    private func addPlaylistLabel() -> UILabel {
        // label creation
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        // label positioning
        label.center.x = view.center.x
        
        // getting access to the current window
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        // define the padding from the top of the window borders to the Safe Area
        let topPadding = window!.safeAreaInsets.top
        // setting an Y coordinate according to the padding
        label.frame.origin.y = topPadding
        
        // label appearence settings
        label.text = "Playlist"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        return label
    }

    private func getImageView(imageName: String, x: CGFloat, y: CGFloat) -> UIImageView {
        // UIImageView entity
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.image = UIImage(named: imageName)
        
        // image view positioning
        imageView.frame.origin.x = x
        imageView.frame.origin.y = y
        
        return imageView
    }
    
    private func getSongButtton(forSong: String, x: CGFloat, y: CGFloat) -> UIButton {
        // button creation
        let width = view.frame.width - 10
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: 60))
        
        // button positioning
        button.frame.origin.x = x
        button.frame.origin.y = y
        
        // button appearence settings
        button.setTitle(forSong, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.backgroundColor = .clear
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
        
        button.addTarget(nil, action: #selector(goToPlayer(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func goToPlayer(_ sender: UIButton) {
        self.present(playerController, animated: true)
        player.songName = sender.tag == 0 ?  "Lilly Wood The Prick - Prayer in C.mp3" : "Imagine Dragons - Believer.mp3"
        playerController.artistLabel.text = sender.tag == 0 ? "Lilly Wood The Prick" : "Imagine Dragons"
        playerController.centralArtistLabel.text = sender.tag == 0 ? "Lilly Wood The Prick" : "Imagine Dragons"
        
        player.songImage = sender.tag == 0 ? UIImage(named: "1.png") : UIImage(named: "2.png")
        playerController.songImageView.image = player.songImage
        playerController.centralSongLabel.text = sender.tag == 0 ? "Prayer in C": "Believer"
    }
    
    private func getDurationLabel(duration: String, x: CGFloat, y: CGFloat) -> UILabel {
        // label creation
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        // label positioning
        label.center.x = x
        label.center.y = y
        
        // label appearence settings
        label.text = duration
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        
        return label
    }
    
}
