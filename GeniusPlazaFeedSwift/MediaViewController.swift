//
//  MediaViewController.swift
//  GeniusPlazaFeedSwift
//
//  Created by Pias khan on 5/22/19.
//  Copyright © 2019 Pias khan. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu

class MediaViewController: UIViewController {
    var menuView: BTNavigationDropdownMenu!
    var mediaTableView: UITableView?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.addMenu()
        self.addTable()
    }
    
    func addTable(){
        self.mediaTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
        self.mediaTableView?.register(MediaTableViewCell.self, forCellReuseIdentifier: "mediaTableViewCell")
        self.mediaTableView?.tableFooterView = UIView()
        self.mediaTableView?.delegate = self
        self.mediaTableView?.dataSource = self
        self.mediaTableView?.rowHeight = 240
        self.mediaTableView?.autoresizesSubviews = true
        self.mediaTableView?.autoresizingMask =  [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(self.mediaTableView!)


    }
    
    func addMenu(){
        
        let rightMenuButton = UIBarButtonItem(title: "Media", style: .plain, target: self, action: #selector(toggleMenu))
        self.navigationItem.rightBarButtonItem = rightMenuButton
        
        let items = ["Apple Music", "iTunes Music", "iOS Apps", "Audiobooks", "Books", "TV Shows", "Movies"]
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: BTTitle.index(6), items: items)
        
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> Void in
            print("Did select item at index: \(indexPath)")
        }
        
        rightMenuButton.customView = menuView

    }
    
    @objc func toggleMenu(){
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MediaViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: MediaTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "mediaTableViewCell", for: indexPath) as? MediaTableViewCell
        if (cell == nil) {
            cell = MediaTableViewCell(style: .default, reuseIdentifier: "mediaTableViewCell")
        }
        cell.mediaImageView?.image = UIImage(named: "hello")
        cell.mediaNameLabel?.text = "hello"
        cell.mediaTypeLabel?.text = "bello"
        return cell
    }
}
