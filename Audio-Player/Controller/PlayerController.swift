//
//  PlayerController.swift
//  Audio-Player
//
//  Created by Zenya Kirilov on 3.09.22.
//

import UIKit

class PlayerController: UIViewController {
    
    // player entity
    var player: Player!

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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        player = Player()
        
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
    
    @objc func addToFavourites(_ sender: UIButton) {
        
    }
    
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
    
    @objc func getMore(_ sender: UIButton) {
        
    }
    
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
}
