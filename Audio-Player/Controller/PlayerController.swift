//
//  PlayerController.swift
//  Audio-Player
//
//  Created by Zenya Kirilov on 3.09.22.
//

import UIKit
import AVFoundation

class PlayerController: UIViewController {
    
    // player entity
    var player: PlayerProtocol!
    
    // timer var
    var timer: Timer!
    
    // song duration
    var timeSong = Double()

    // getting top static label
    lazy var topStaticLabel = getStaticTopLabel()
    
    // getting artist label
    lazy var artistLabel = getArtistLabel()
    
    // getting the back button
    lazy var backButton = getBackButton()
    
    // getting share button
    lazy var shareButton = getShareButton()
    
    // getting song image view
    lazy var songImageView = getSongImageView()
    
    // getting 'add to favourites' button
    lazy var addToFavouritesButton = getAddToFavouritesButton()
    
    // getting 'more' button
    lazy var moreButton = getMoreButton()
    
    // getting central song label
    lazy var centralSongLabel = getCentralSongLabel()
    
    // getting central artist label
    lazy var centralArtistLabel = getCentralArtistLabel()
    
    // getting duration slider
    lazy var durationSlider = getDurationSlider()
    
    // getting left duration label
    lazy var leftDurationLabel = getLeftDurationLabel()
    
    // getting right duration label
    lazy var rightDurationLabel = getRightDurationLabel()
    
    // getting pause/play button
    lazy var pausePlayButton = getPlayPauseButton()
    
    // getting previous song button
    lazy var previousSongButton = getPreviousSongButton()
    
    // getting next song button
    lazy var nextSongButton = getNextSongButton()
    
    // getting song shuffle button
    lazy var songShuffleButton = getSongShuffleButton()
    
    // getting song repeat button
    lazy var songRepeatButton = getSongRepeatButton()
    
    // getting volume slider
    lazy var volumeSlider = getVolumeSlider()
    
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(topStaticLabel)
        view.addSubview(artistLabel)
        view.addSubview(backButton)
        view.addSubview(shareButton)
        view.addSubview(songImageView)
        view.addSubview(addToFavouritesButton)
        view.addSubview(moreButton)
        view.addSubview(centralSongLabel)
        view.addSubview(centralArtistLabel)
        view.addSubview(durationSlider)
        view.addSubview(leftDurationLabel)
        view.addSubview(rightDurationLabel)
        view.addSubview(pausePlayButton)
        view.addSubview(previousSongButton)
        view.addSubview(nextSongButton)
        view.addSubview(songShuffleButton)
        view.addSubview(songRepeatButton)
        view.addSubview(volumeSlider)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        durationSlider.maximumValue = Float(player.audioPlayer.duration)
        
        volumeSlider.setValue(player.audioPlayer.volume, animated: false)
    }
    
    private func getStaticTopLabel() -> UILabel {
        // label creation
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        
        // label positioning
        label.frame.origin.y = view.frame.origin.y + 20
        label.center.x = view.center.x
        
        // label appearence settings
        label.text = "Playing from artist"
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        
        return label
        
    }
    
    private func getArtistLabel() -> UILabel {
        // label creation
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        
        // label positioning
        label.frame.origin.y = topStaticLabel.frame.maxY + 5
        label.center.x = view.center.x
        
        // label appearence settings
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-bold", size: 16)
        
        return label
    }
    
    private func getBackButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        // button positioning
        button.frame.origin.x = view.frame.origin.x + 30
        button.frame.origin.y = view.frame.origin.y + 30
        
        // button appearence settings
        button.setBackgroundImage(UIImage(named: "icons8-expand-arrow-50.png"), for: .normal)
        button.addTarget(nil, action: #selector(goBack(_sender:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func goBack(_sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    private func getShareButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        // button positioning
        button.frame.origin.x = view.frame.maxX - 50
        button.frame.origin.y = view.frame.origin.y + 30
        
        // button appearence settings
        button.setBackgroundImage(UIImage(named: "icons8-share-rounded-32.png"), for: .normal)
        
        button.addTarget(nil, action: #selector(shareAction(_:)), for: .touchUpInside)
        
        return button
        
    }
    
    @objc func shareAction(_ sender: UIButton) {
        
    }
    
    private func getSongImageView() -> UIImageView {
        // image view creation
        let side = view.frame.width - 60
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: side, height: side))
        
        // image view positioning
        imageView.center.x = view.center.x
        imageView.frame.origin.y = artistLabel.frame.maxY + 20
        
        // image view appearence settings
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        
        return imageView
    }
    
    private func getAddToFavouritesButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        // button positioning
        button.frame.origin.x = view.frame.origin.x + 30
        button.frame.origin.y = songImageView.frame.maxY + 30
        
        // button appearence settings
        button.setBackgroundImage(UIImage(named: "icons8-plus-64.png"), for: .normal)
        button.addTarget(nil, action: #selector(addToFavourites(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func addToFavourites(_ sender: UIButton) {}
    
    private func getMoreButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        // button positioning
        button.frame.origin.x = view.frame.maxX - 50
        button.frame.origin.y = songImageView.frame.maxY + 30
        
        // button appearence settings
        button.setBackgroundImage(UIImage(named: "icons8-dots-loading-48.png"), for: .normal)
        button.addTarget(nil, action: #selector(getMore(_:)), for: .touchUpInside)
    
        return button
    }
    
    @objc func getMore(_ sender: UIButton) {}
    
    private func getCentralSongLabel() -> UILabel {
        // label creation
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 20))
        // label positioning
        label.center.x = view.center.x
        label.center.y = addToFavouritesButton.center.y
        
        // label appearence settings
        label.font = UIFont(name: "HelveticaNeue-bold", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }
    
    private func getCentralArtistLabel() -> UILabel {
        // label creation
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 20))
        // label positioning
        label.center.x = view.center.x
        label.center.y = centralSongLabel.frame.maxY + 15
        
        // label appearence settings
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        label.textColor = .lightGray
        label.textAlignment = .center
        
        return label
    }
    
    private func getDurationSlider() -> UISlider {
        // slider creation
        let width = view.frame.width - 60
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: width, height: 20))
        // slider positioning
        slider.center.x = view.center.x
        slider.center.y = centralArtistLabel.frame.maxY + 40
        
        // slider appearence settings
        slider.maximumTrackTintColor = .gray
        slider.minimumTrackTintColor = .white
        slider.thumbTintColor = .white
        
        slider.addTarget(nil, action: #selector(durationChanging(_:)), for: .valueChanged)
        
        return slider
    }
    
    @objc func durationChanging(_ sender: UISlider) {
        guard sender == durationSlider else {
            return
        }
        player.audioPlayer.currentTime = TimeInterval(sender.value)
    }
    
    private func getLeftDurationLabel() -> UILabel {
        // label creation
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 35, height: 20))
        // label positioning
        label.frame.origin.x = durationSlider.frame.origin.x + 4
        label.center.y = durationSlider.frame.minY - 15
        
        // label appearence changing
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        
        return label
    }
    
    private func getRightDurationLabel() -> UILabel {
        // label creation
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 35, height: 20))
        // label positioning
        label.frame.origin.x = durationSlider.frame.maxX - 28
        label.center.y = durationSlider.frame.minY - 15
        
        // label appearence changing
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        
        return label
    }
    
    private func getPlayPauseButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        // button positioning
        button.center.x = view.center.x
        button.center.y = durationSlider.frame.maxY + 70
        
        // button appearence settings
        button.setImage(UIImage(named: "icons8-pause-button-100.png"), for: .normal)
        
        button.addTarget(nil, action: #selector(tapPlayPause(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func tapPlayPause(_ sender: UIButton) {
        
        if player.audioPlayer.isPlaying {
            sender.setImage(UIImage(named: "icons8-play-button-circled-100.png"), for: .normal)
            player.audioPlayer.pause()
        } else {
            sender.setImage(UIImage(named: "icons8-pause-button-100.png"), for: .normal)
            player.audioPlayer.play()
        }
    }
    
    private func getPreviousSongButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        // button positioning
        button.center.x = pausePlayButton.frame.minX - 50
        button.center.y = pausePlayButton.center.y
        
        // button appearence settings
        button.setImage(UIImage(named: "icons8-end-100 2.png"), for: .normal)
        
        button.addTarget(nil, action: #selector(previousSong(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func previousSong(_ sender: UIButton) {
        guard player.audioPlayer.currentTime < 7 else {
            player.audioPlayer.currentTime = 0
            return
        }
        switchSongs()
    }
    
    private func getNextSongButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        // button positioning
        button.center.x = pausePlayButton.frame.maxX + 50
        button.center.y = pausePlayButton.center.y
        
        // button appearence settings
        button.setImage(UIImage(named: "icons8-end-100.png"), for: .normal)
        
        button.addTarget(nil, action: #selector(nextSong(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func nextSong(_ sender: UIButton) {
        switchSongs()
    }
   
    private func switchSongs() {
        switch player.songName {
        case SongNames.prayerInC.rawValue:
            player.songName = SongNames.believer.rawValue
            artistLabel.text = "Imagine Dragons"
            centralArtistLabel.text = "Imagine Dragons"
            timeSong = 204
            player.songImage = UIImage(named: "2.png")
            songImageView.image = player.songImage
            centralSongLabel.text = "Believer"
        case SongNames.believer.rawValue:
            player.songName = SongNames.prayerInC.rawValue
            artistLabel.text = "Lilly Wood The Prick"
            centralArtistLabel.text = "Lilly Wood The Prick"
            timeSong = 189
            player.songImage = UIImage(named: "1.png")
            songImageView.image = player.songImage
            centralSongLabel.text = "Prayer in C"
        default:
            break
        }
        if player.audioPlayer.isPlaying {
            player.playSong()
        } else {
            player.playSong()
            player.audioPlayer.pause()
        }
    }
    
    private func getSongShuffleButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        // button positioning
        button.frame.origin.x = view.frame.origin.x + 30
        button.center.y = previousSongButton.center.y
        
        // button appearence settings
        button.setImage(UIImage(named: "icons8-shuffle-30.png"), for: .normal)
        
        button.addTarget(nil, action: #selector(shuffleSongs(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func shuffleSongs(_ sender: UIButton) {}
    
    private func getSongRepeatButton() -> UIButton {
        // button creation
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        // button positioning
        button.frame.origin.x = view.frame.maxX - 50
        button.center.y = previousSongButton.center.y
        
        // button appearence settings
        button.setImage(UIImage(named: "icons8-repeat-30.png"), for: .normal)
        
        button.addTarget(nil, action: #selector(repeatSong(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func repeatSong(_ sender: UIButton) {}
    
    private func getVolumeSlider() -> UISlider {
        // slider creation
        let width = view.frame.width - 60
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: width, height: 20))
        // slider positioning
        slider.center.x = view.center.x
        slider.center.y = pausePlayButton.frame.maxY + 60
        
        // slider appearence settings
        slider.maximumTrackTintColor = .gray
        slider.minimumTrackTintColor = .white
        slider.thumbTintColor = .white
        slider.minimumValueImage = UIImage(named: "icons8-sound-speaker-24.png")
        slider.maximumValueImage = UIImage(named: "icons8-voice-24.png")
        
        slider.addTarget(nil, action: #selector(changeVolume(_:)), for: .valueChanged)
        
        return slider
        
    }
    
    @objc func changeVolume(_ sender: UISlider) {
        guard sender == volumeSlider else {
            return
        }
        player.audioPlayer.volume = sender.value
    }
    
    @objc func updateTime() {
        
        // time count from start
        let timePlayed = player.audioPlayer.currentTime
        let minutes = Int(timePlayed / 60)
        let seconds = Int(timePlayed.truncatingRemainder(dividingBy: 60))
        leftDurationLabel.text = NSString(format: "%02d:%02d", minutes, seconds) as String
        
        // time count from end
        let diffTime = player.audioPlayer.currentTime - timeSong
        let minutes1 = Int(diffTime / 60)
        let seconds1 = Int(-diffTime.truncatingRemainder(dividingBy: 60))
        rightDurationLabel.text = NSString(format: "%02d:%02d", minutes1, seconds1) as String
        
        // moving slider's thumb along the song way
        durationSlider.setValue(Float(player.audioPlayer.currentTime), animated: true)
    }
}
