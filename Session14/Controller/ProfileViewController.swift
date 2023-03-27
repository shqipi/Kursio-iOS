//
//  ViewController.swift
//  Session14
//
//  Created by shqiperimramadani on 25.03.23.
//

import UIKit

class ProfileViewController: UIViewController  {
    
    
    @IBOutlet weak var headerTableView: UITableView!
    @IBOutlet weak var postsCollectionView: UICollectionView!
    @IBOutlet weak var highlightsCollectionView: UICollectionView!
    @IBOutlet weak var buttonsCollectionView: UICollectionView!
    @IBOutlet weak var footerButtonsCollectionView: UICollectionView!
    @IBOutlet weak var infoTableView: UITableView!
    
    
    var postArray: [Post] = []
    var highlistArray: [Heighlight] = []
    var buttonsArray: [Buttons] = []
    var footerBArray: [Footer] = []
    var infoArray: [Info] = []
    var headerArray: [Header] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpcolletionView()
        creatPost()
        creatHighlight()
        createButtons()
        createFooter()
        setUpTableView()
        createInfo()
        creatHeader()
    }
    
    func creatHeader() {
        let header = Header(name: "metricool")
        
        headerArray = [header]
//        headerTableView.reloadData()
    }
    
    func creatPost() {
        let post1 = Post(id: 1, image: "car1")
        let post2 = Post(id: 2, image: "car2")
        let post3 = Post(id: 3, image: "car3")
        let post4 = Post(id: 4, image: "car4")
        let post5 = Post(id: 5, image: "car5")
        let post6 = Post(id: 6, image: "car6")
        
        postArray = [post1,post2, post3, post4, post5, post6]
        postsCollectionView.reloadData()
    }
    
    func creatHighlight() {
        let highlight1 = Heighlight(image: "1", name: "Hello")
        let highlight2 = Heighlight(image: "2", name: "Ferizaj")
        let highlight3 = Heighlight(image: "3", name: "Prishtina")
        let highlight4 = Heighlight(image: "4", name: "Peja")
        let highlight5 = Heighlight(image: "6", name: "Gjakova")
        
        highlistArray = [highlight1, highlight2, highlight3, highlight4, highlight5]
        highlightsCollectionView.reloadData()
    }
    
    func createButtons() {
        let button1 = Buttons(name: "square.grid.3x3")
        let button2 = Buttons(name: "play.rectangle")
        let button3 = Buttons(name: "play")
        let button4 = Buttons(name: "book")
        let button5 = Buttons(name: "person.crop.rectangle")
        
        buttonsArray = [button1, button2, button3, button4, button5]
        buttonsCollectionView.reloadData()
    }
    func createFooter() {
        let fButton1 = Footer(name: "Home")
        let fButton2 = Footer(name: "magnifyingglass")
        let fButton3 = Footer(name: "play.rectangle")
        let fButton4 = Footer(name: "bag")
        let fButton5 = Footer(name: "infinity.circle")
        
        footerBArray = [fButton1, fButton2, fButton3, fButton4, fButton5]
        footerButtonsCollectionView.reloadData()
    }
    
    func createInfo() {
        let info1 = Info(id: 1, image: "infinity.circle", postNumberLabel: 810, postNameLabel: "Posts", followerNumberLabel: 23.1, followerNameLabel: "Followers", followingNumberLabel: 986, followingNameLabel: "Followig", titleLabel: "Metricoll ES ∞", firstLabel: "Analyze, manage and grow your digitak presence.", secondLabel: "ANALYSIS 📈 PLANING AN REPORTS 📄 ADS ﹩ 👇 Get", thirdLabel: "Started FREE Now.", linkLabel: "shqipi.com/metricool/265", seeLabel: "See original")

        infoArray = [info1]
        infoTableView.reloadData()
    }
}

//MARK: - UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDataSource {
    
    func setUpcolletionView() {
        postsCollectionView.delegate = self
        postsCollectionView.dataSource = self
        postsCollectionView.register(UINib(nibName: "PostCell", bundle: nil), forCellWithReuseIdentifier: "PostCell")
        
        highlightsCollectionView.delegate = self
        highlightsCollectionView.dataSource = self
        highlightsCollectionView.register(UINib(nibName: "HighlightCell", bundle: nil), forCellWithReuseIdentifier: "HighlightCell")
        
        buttonsCollectionView.delegate = self
        buttonsCollectionView.dataSource = self
        buttonsCollectionView.register(UINib(nibName: "ButtonCell", bundle: nil), forCellWithReuseIdentifier: "ButtonCell")
        
        footerButtonsCollectionView.delegate = self
        footerButtonsCollectionView.dataSource = self
        footerButtonsCollectionView.register(UINib(nibName: "FooterCell", bundle: nil), forCellWithReuseIdentifier: "FooterCell")
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == postsCollectionView {
            return postArray.count
        }else if  collectionView == highlightsCollectionView{
            return highlistArray.count
        }else if collectionView == buttonsCollectionView{
            return buttonsArray.count
        }else if collectionView == footerButtonsCollectionView{
            return footerBArray.count
        }else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == postsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
            cell.setDetails(post: postArray[indexPath.item])
            return cell
        }else if collectionView == highlightsCollectionView {
            let hcell = collectionView.dequeueReusableCell(withReuseIdentifier: "HighlightCell", for: indexPath) as! HighlightCell
            hcell.setDetals(heighlight: highlistArray[indexPath.item])
            return hcell
        }else if collectionView == buttonsCollectionView{
            let bcell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
            bcell.setDetails(button: buttonsArray[indexPath.item])
            return bcell
        }else{
            let fcell = collectionView.dequeueReusableCell(withReuseIdentifier: "FooterCell", for: indexPath) as! FooterCell
            fcell.setDetails(footer: footerBArray[indexPath.item])
            return fcell
        }
    }
}

//MARK: - UICollectionViewDelegate
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == postsCollectionView {
            return CGSize(width: (self.view.frame.width / 3) - 2 , height: CGFloat(self.view.frame.width / 3) - 2)
        }else {
            return CGSize(width: 70, height: 100)
        }
    }
}

//MARK: - UITableViewDelegate and UITableViewDataSource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpTableView(){
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        
//        headerTableView.delegate = self
//        headerTableView.dataSource = self
//        headerTableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == infoTableView {
            return infoArray.count
        }else {
            return headerArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == infoTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") as! InfoCell
            cell.setDetails(info: infoArray[indexPath.row])
            return cell
        }else {
            let hcell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
            hcell.setDetailsNow(header: headerArray[indexPath.row])
            return hcell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == infoTableView {
            return 330
        }else {
            return 31
        }
    }
    
}
