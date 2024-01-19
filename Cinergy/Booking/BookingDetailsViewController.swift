//
//  BookingDetailsViewController.swift
//  Cinergy
//
//  Created by Vignesh VG on 1/19/24.
//

import UIKit

class BookingDetailsViewController: UIViewController, UISheetPresentationControllerDelegate {
    @IBOutlet weak var movieImage: UIImageView!
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sheetPresentationController.delegate = self
//        sheetPresentationController.selectedDetentIdentifier = .medium
        sheetPresentationController.prefersGrabberVisible = false
        sheetPresentationController.detents = [
            .medium()]
        
        if let imageURL = URL(string: "https://tickets.cinergycinemas.com/CDN/media/entity/get/FilmPosterGraphic/HO00001620?referenceScheme=HeadOffice&allowPlaceHolder=true&height=500&vista_cache=05102021"){
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL){
                    DispatchQueue.main.async {
                        self.movieImage.image = UIImage(data: imageData)
                    }
                }
            }
        }
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
