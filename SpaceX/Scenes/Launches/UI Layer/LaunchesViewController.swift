//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Karim Ezzedine on 25/08/2022.
//

import UIKit

class LaunchesViewController: DefaultViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var launchesCollectionView: UICollectionView!
    @IBOutlet weak var launchesCollectionFlow: UICollectionViewFlowLayout!
    
    @IBOutlet weak var lblBigLaunchTitle: UILabel!
    @IBOutlet weak var viewGold: UIView!
    @IBOutlet weak var lblGold: UILabel!
    @IBOutlet weak var lblBigLaunchName: UILabel!
    @IBOutlet weak var bigLaunchImageGradient: UIView!
    @IBOutlet weak var viewBigLaunch: UIView!
    @IBOutlet weak var viewAuthorImage: UIView!
    
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblArticleTitle: UILabel!
    @IBOutlet weak var lblBigLaunchNumber: UILabel!
    @IBOutlet weak var lblBigLaunchDate: UILabel!
    @IBOutlet weak var lblBigLaunchDetail: UILabel!
    
    //MARK: - Private Object
    
    private var launchesViwModel: LaunchesViewModel!
    
    
    //MARK: - UIViewController Methods & Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async { [unowned self] in
            self.launchesViwModel = LaunchesViewModel()
            self.setStyle()
            self.binding()
        }
    }
    
    //MARK: - Private Standard Function
    
    private func setStyle() {
        
        launchesCollectionFlow.minimumInteritemSpacing = 0
        launchesCollectionFlow.minimumLineSpacing = 15
        launchesCollectionView.delegate = self
        launchesCollectionView.dataSource = self
        launchesCollectionView.backgroundColor = .clear
        launchesCollectionView?.register(UINib(nibName: "LaunchesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LaunchesCollectionViewCellID")
        
        lblTitle.setLabelStyle(labelStyle: .title(text: "Launches"))
        lblBigLaunchTitle.setLabelStyle(labelStyle: .title(text: "The Big Launch"))
        
        viewGold.setViewStyle(viewStyle: .custom(color: AppColors.mustard, cornerRadius: viewGold.frame.height/2))
        
        lblGold.setLabelStyle(labelStyle: .custom(
            text: "GOLD",
            textColor: .white,
            font: getBoldLatoFont(size: 10)
        ))
        
        lblBigLaunchName.setLabelStyle(labelStyle: .custom(
            text: "SPACE SHIPS",
            textColor: AppColors.primaryTextColor,
            font: getBoldLatoFont(size: 10)
        ))
        
        self.lblGold.spaceBetweenCharacter(space: 1.8)
        self.lblBigLaunchName.spaceBetweenCharacter(space: 1.8)
        
        self.bigLaunchImageGradient.addVetricalGradient(topColor: UIColor.white.withAlphaComponent(0.1), bottomColor: UIColor.black.withAlphaComponent(0.85), opacity: 0.9)
        
        viewBigLaunch.setViewStyle(viewStyle: .custom(cornerRadius: 8))
        viewAuthorImage.setViewStyle(viewStyle: .custom(
            color: AppColors.mustard,
            cornerRadius: viewAuthorImage.frame.height/2
        ))
        
        lblAuthorName.setLabelStyle(labelStyle: .custom(
            text: "by Eng. Dieter Rams",
            textColor: .white,
            font: getMediumLatoFont(size: 11)
        ))
        
        lblArticleTitle.setLabelStyle(labelStyle: .custom(
            text: "ISS geosynchronous and is it stationary",
            textColor: .white,
            font: getBoldLatoFont(size: 16),
            numberOfLines: 2
        ))
        
        lblBigLaunchNumber.setLabelStyle(labelStyle: .custom(
            text: "2355",
            textColor: .white,
            font: getExtraBoldLatoFont(size: 18),
            numberOfLines: 1
        ))
        
        lblBigLaunchDate.setLabelStyle(labelStyle: .custom(
            text: "24 Feb 202\n11:25 GMT+5",
            textColor: .white,
            font: getBoldLatoFont(size: 12),
            numberOfLines: 2
        ))
        
        lblBigLaunchDetail.setLabelStyle(labelStyle: .custom(
            textColor: .white,
            font: getMediumLatoFont(size: 11),
            numberOfLines: 0
        ))
        
        lblBigLaunchDetail.spaceBetweenLine(space: 2)
    }
    
    private func binding() {
        launchesViwModel.showProgress.bind { [weak self] showProgress in
            self?.showProgress(show: showProgress)
        }
        
        launchesViwModel.showAlert.bind { [weak self] alert in
            switch alert {
            case .custom(let title, let msg, let btnText):
                appDelegate.showAlert(vc: self, titleTxt: title, msgTxt: msg, btnTxt: btnText)
            default:
                break
            }
        }
        
        launchesViwModel.lauches.bind { [weak self] lauches in
            print("Rockets launchesc data count :", lauches.count)
            self?.launchesCollectionView.reloadData()
        }
    }

}


//MARK: - Collection View

extension LaunchesViewController: UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = collectionView.frame.height - 10
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return launchesViwModel.lauches.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LaunchesCollectionViewCellID", for: indexPath as IndexPath) as! LaunchesCollectionViewCell
        
        let item = launchesViwModel.lauches.value[indexPath.item]
        cell.data = item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = Storyboard.rockets.instantiateViewController(withIdentifier: ViewControllerID.rocketsViewID) as? RocketsViewController {
            self.modalPresentationStyle = pageModale
            vc.rocketViwModel = RocketViewModel(id: launchesViwModel.lauches.value[indexPath.row].rocketId)
            self.present(vc, animated: true)
        }
    }
}

