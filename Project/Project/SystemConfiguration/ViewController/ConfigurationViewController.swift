
//
//  ConfigurationViewController.swift
//  Project
//
//  Created by 姚君 on 17/3/6.
//  Copyright © 2017年 certus. All rights reserved.
//

import UIKit

class ConfigurationViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataList: Array<String> = ["新增项目","新增人员","新增角色","项目管理","产品线项目","人员管理","角色管理","日志管理","其他",]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth/3-8, height: screenWidth/3)
        layout.sectionInset = UIEdgeInsets(top: 0, left: -2, bottom: 0, right: -2)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.headerReferenceSize = CGSize(width: screenWidth, height: screenWidth/4)
        layout.footerReferenceSize = CGSize(width: screenWidth, height: screenWidth/4)

        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib.init(nibName: "ConfigurationCell", bundle: nil), forCellWithReuseIdentifier: "ConfigurationCell")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footView")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    
        let cell:ConfigurationCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConfigurationCell", for: indexPath) as! ConfigurationCell
        cell.backgroundColor = UIColor.white
        cell.titleLabel.text = dataList[indexPath.row]
        cell.imageView.image = UIImage.init(named: dataList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView", for: indexPath)
            header.backgroundColor = UIColor.lightGray
            return header
        }else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footView", for: indexPath)
            footer.backgroundColor = UIColor.lightGray
            return footer
        }
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        switch indexPath.row {
        case 0:
            let productList = ProductListViewController()
            self.navigationController?.pushViewController(productList, animated: true)

        case 1:
            let productList = ProductListViewController()
            self.navigationController?.pushViewController(productList, animated: true)

        case 2:
            let productList = ProductListViewController()
            self.navigationController?.pushViewController(productList, animated: true)

        case 3:
            let productList = ProductListViewController()
            self.navigationController?.pushViewController(productList, animated: true)

        case 4:
            let productList = ProductListViewController()
            self.navigationController?.pushViewController(productList, animated: true)

        case 5:
            let productList = ProductListViewController()
            self.navigationController?.pushViewController(productList, animated: true)

        case 6:
            let productList = ProductListViewController()
            self.navigationController?.pushViewController(productList, animated: true)

        case 7:
            let productList = ProductListViewController()
            self.navigationController?.pushViewController(productList, animated: true)

        case 8:
            let productList = ProductListViewController()
            self.navigationController?.pushViewController(productList, animated: true)

        default:
            return
        }

    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
