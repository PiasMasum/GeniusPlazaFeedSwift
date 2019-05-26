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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.addMenu()
    }
    
    func addMenu(){
        
        let rightMenuButton = UIBarButtonItem(title: "Media", style: .plain, target: self, action: #selector(toggleMenu))
        self.navigationItem.rightBarButtonItem = rightMenuButton
        
        let items = ["Most Popular", "Latest", "Trending", "Nearest", "Top Picks"]
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: BTTitle.index(2), items: items)
        
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
