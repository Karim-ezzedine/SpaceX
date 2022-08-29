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
        
        lblTitle.setLabelStyle(labelStyle: .title())
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
//        cell.btnAdd.addTarget(self, action: #selector(goAddVacancy), for: .touchUpInside)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if homeViewModel.vacationsBalance.value[indexPath.item].isSelected {
//            DispatchQueue.main.async { [unowned self] in
//                self.collectionView.scrollToItem(at: IndexPath(item: self.selectedCollectionCell, section: 0), at: .centeredHorizontally, animated: true)
//            }
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){ [unowned self] in
//                if let vc = Storyboard.vacation.instantiateViewController(withIdentifier: ViewControllerID.vacationsViewControllerID) as? VacationsViewController {
//                    vc.selectedVacationId = homeViewModel.vacationsBalance.value[selectedCollectionCell].vacationID ?? 0
//                    self.navigationController?.pushViewController(vc, animated: true)
//                }
//            }
//        }
//        else {
//            self.selectedCollectionCell = indexPath.item
//            self.collectionView.reloadData()
//        }
    }
}

