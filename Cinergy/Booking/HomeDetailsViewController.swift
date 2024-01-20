//
//  HomeDetailsViewController.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/19/24.
//

import UIKit

protocol HomeViewModelDelegate {
    func bookNowClicked(movieId: String?)
}

class HomeDetailsViewController: UIViewController, UISheetPresentationControllerDelegate {
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func bookNoButton(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            self.delegate?.bookNowClicked(movieId: self.selectedMovie.movieId)
        })
//        self.dismiss(animated: false)
//        delegate?.bookNowClicked(movieId: selectedMovie.movieId)
    }
    var delegate: HomeViewModelDelegate?
    @IBOutlet weak var movieImage: UIImageView!
    var selectedMovie: HomeModel.MoviesList!
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sheetPresentationController.delegate = self
        sheetPresentationController.prefersGrabberVisible = false
        sheetPresentationController.detents = [
            .medium()]
        
        configureUI()
    }

    func configureUI() {
        if let imageURL = URL(string: selectedMovie.imageUrl){
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL){
                    DispatchQueue.main.async {
                        self.movieImage.image = UIImage(data: imageData)
                    }
                }
            }
        }
        titleLabel.text = selectedMovie.title
        timeLabel.text = "60" + "mins"
        countLabel.text = "Upto 10 members"
        synopsisLabel.text = selectedMovie.synopsis
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
