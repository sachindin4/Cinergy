//
//  BookingViewController.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/17/24.
//

import UIKit

class BookingViewController: UIViewController {
    
    var movieInfo: HomeModel.MoviesList!
    var showTimeInfo : [BookingModel.MovieInfo.ShowTime]!
    var dateSelectedIndex: IndexPath?

    @IBAction func continueButton(_ sender: Any) {

    }
    @IBOutlet weak var timeCollectionView: UICollectionView!
    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewContent()
        setupCollectionViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        selectCell(at: IndexPath(item: 0, section: 0))
        timeCollectionView.reloadData()
    }
    
    func setupViewContent() {
        titleLabel.text = movieInfo.title
        if let imageURL = URL(string: movieInfo.imageUrl){
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL){
                    DispatchQueue.main.async {
                        self.posterImage.image = UIImage(data: imageData)
                    }
                }
            }
        }
        ratingLabel.text = movieInfo.rating
        timeLabel.text = movieInfo.runTime + "min"
    }
        
    func setupCollectionViews() {
        DispatchQueue.main.async {
            self.dateCollectionView.delegate = self
            self.dateCollectionView.dataSource = self
            self.timeCollectionView.delegate = self
            self.timeCollectionView.dataSource = self
            self.dateSelectedIndex = IndexPath(item: 0, section: 0)

        }
    }
    
    func selectCell(at indexPath: IndexPath) {
        dateSelectedIndex = indexPath
        if let cell = dateCollectionView.cellForItem(at: indexPath) {
            let hexColor = 0xd4dec3
            let red = CGFloat((hexColor & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((hexColor & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(hexColor & 0x0000FF) / 255.0
            let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            cell.contentView.backgroundColor = color
        }
    }
}

extension BookingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == dateCollectionView {
            return showTimeInfo.count
        } else if collectionView == timeCollectionView {
            if let dateSelectedIndex = dateSelectedIndex {
                return showTimeInfo[dateSelectedIndex.item].sessions.count
            } else {
                return 0
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == dateCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingDateCollectionViewCell", for: indexPath) as? BookingDateCollectionViewCell {
                let inputFormatter = DateFormatter()
                inputFormatter.dateFormat = "yyyy-MM-dd"
                if let inputDate = inputFormatter.date(from: showTimeInfo[indexPath.item].date) {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MMM dd"
                    let date = dateFormatter.string(from: inputDate)
                    cell.dateLabel.text = date
                    
                    let dayFormatter = DateFormatter()
                    dayFormatter.dateFormat = "EEE"
                    let day = dayFormatter.string(from: inputDate)
                    cell.dayLabel.text = day
                }
                if indexPath == dateSelectedIndex {
                    selectCell(at: indexPath)
                } else {
                    cell.contentView.backgroundColor = UIColor.clear
                }
                return cell
            }
        } else if collectionView == timeCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingTimeCollectionViewCell", for: indexPath) as? BookingTimeCollectionViewCell {
                cell.timeLabel.text = showTimeInfo[dateSelectedIndex?.item ?? 0].sessions[indexPath.item].showTime
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == dateCollectionView{
            if let dateSelectedIndex = dateSelectedIndex, let selectedCell = dateCollectionView.cellForItem(at: dateSelectedIndex) {
                selectedCell.contentView.backgroundColor = .clear
            }
            selectCell(at: indexPath)
            timeCollectionView.reloadData()
        } else if collectionView == timeCollectionView{
            if let selectedIndexPaths = collectionView.indexPathsForSelectedItems {
                for selectedIndex in selectedIndexPaths {
                    collectionView.deselectItem(at: selectedIndex, animated: false)
                }
            }
        }
    }
}
