//
//  BookingViewController.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/17/24.
//

import UIKit

class BookingViewController: UIViewController {
    
    var bookingViewModel = BookingViewModel()
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
        titleLabel.text = bookingViewModel.movieInfo.title
        if let imageURL = URL(string: bookingViewModel.movieInfo.imageUrl){
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL){
                    DispatchQueue.main.async {
                        self.posterImage.image = UIImage(data: imageData)
                    }
                }
            }
        }
        ratingLabel.text = bookingViewModel.movieInfo.rating
        timeLabel.text = bookingViewModel.movieInfo.runTime + "min"
    }
        
    func setupCollectionViews() {
        DispatchQueue.main.async {
            self.dateCollectionView.delegate = self
            self.dateCollectionView.dataSource = self
            self.timeCollectionView.delegate = self
            self.timeCollectionView.dataSource = self
            self.bookingViewModel.dateSelectedIndex = IndexPath(item: 0, section: 0)

        }
    }
    
    func selectCell(at indexPath: IndexPath) {
        bookingViewModel.dateSelectedIndex = indexPath
        if let cell = dateCollectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = bookingViewModel.getColor()
        }
    }
}

extension BookingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == dateCollectionView {
            return bookingViewModel.showTimeInfo.count
        } else if collectionView == timeCollectionView {
            if let dateSelectedIndex = bookingViewModel.dateSelectedIndex {
                return bookingViewModel.showTimeInfo[dateSelectedIndex.item].sessions.count
            } else {
                return 0
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == dateCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingDateCollectionViewCell", for: indexPath) as? BookingDateCollectionViewCell {
                cell.dateLabel.text = bookingViewModel.dateFormatConverter(index: indexPath.item).0
                cell.dayLabel.text = bookingViewModel.dateFormatConverter(index: indexPath.item).1
                if indexPath == bookingViewModel.dateSelectedIndex {
                    selectCell(at: indexPath)
                } else {
                    cell.contentView.backgroundColor = UIColor.clear
                }
                return cell
            }
        } else if collectionView == timeCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingTimeCollectionViewCell", for: indexPath) as? BookingTimeCollectionViewCell {
                cell.timeLabel.text = bookingViewModel.showTimeInfo[bookingViewModel.dateSelectedIndex?.item ?? 0].sessions[indexPath.item].showTime
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == dateCollectionView{
            if let dateSelectedIndex = bookingViewModel.dateSelectedIndex, let selectedCell = dateCollectionView.cellForItem(at: dateSelectedIndex) {
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
