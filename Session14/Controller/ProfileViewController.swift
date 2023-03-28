//
//  ViewController.swift
//  Session14
//
//  Created by shqiperimramadani on 25.03.23.
//

import UIKit
import Photos

class ProfileViewController: UIViewController  {
    
    @IBOutlet weak var postsCollectionView: UICollectionView!
    @IBOutlet weak var highlightsCollectionView: UICollectionView!
    @IBOutlet weak var buttonsCollectionView: UICollectionView!
    @IBOutlet weak var footerButtonsCollectionView: UICollectionView!
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var addToolsButton: UIButton!
    @IBOutlet weak var insightButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    var imagePicker: UIImagePickerController?
    
    
    var postArray: [Post] = []
    var highlistArray: [Heighlight] = []
    var buttonsArray: [Buttons] = []
    var footerBArray: [Footer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImagePicker()
        setUpcolletionView()
        creatPost()
        creatHighlight()
        createButtons()
        createFooter()
        setButtons()
        setImage()
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        if PHPhotoLibrary.authorizationStatus() == .authorized {
            if let imagePic = imagePicker {
                present(imagePic, animated: true)
            }else {
                let alert = UIAlertController(title: "No access!", message: "You have no access to the Photo Library", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    func setImage() {
        topImage.layer.cornerRadius = topImage.frame.width / 2
        topImage.layer.borderWidth = 1
        topImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setButtons() {
        plusButton.layer.cornerRadius = plusButton.frame.width / 2
        plusButton.layer.borderWidth = 1
        plusButton.layer.borderColor = UIColor.black.cgColor
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        
        addToolsButton.layer.cornerRadius = 5
        addToolsButton.layer.borderWidth = 1
        addToolsButton.layer.borderColor = UIColor.lightGray.cgColor
        
        insightButton.layer.cornerRadius = 5
        insightButton.layer.borderWidth = 1
        insightButton.layer.borderColor = UIColor.lightGray.cgColor
        
        emailButton.layer.cornerRadius = 5
        emailButton.layer.borderWidth = 1
        emailButton.layer.borderColor = UIColor.lightGray.cgColor
        emailButton.layer.shadowRadius = 5
        emailButton.layer.shadowOpacity = 0.5
        emailButton.layer.shadowColor = UIColor.gray.cgColor
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

//MARK: - UIImagePickerControllerDelegate and UINavigationControllerDelegate
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func setupImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker?.sourceType = .photoLibrary
        imagePicker?.delegate = self
        
        PHPhotoLibrary.requestAuthorization { status in
            print("Requst authorization status: \(status)")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        topImage.image = selectedImage
        imagePicker?.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker?.dismiss(animated: true)
    }
}
