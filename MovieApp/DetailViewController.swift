//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Asad mero on 2/2/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    //model data
    var movie: Movie!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
   
    @IBOutlet weak var ratingLabel: UILabel!
   
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var popularityLabel: UILabel!
    //Outlets
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Nuke.loadImage(with: movie.artworkUrl100, into: movieImageView)
        descriptionLabel.text = movie.description
        popularityLabel.text = movie.popularity
        ratingLabel.text = movie.rating
        dateLabel.text = movie.releaseDate
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
