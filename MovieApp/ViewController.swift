//
//  ViewController.swift
//  MovieApp
//
//  Created by Asad mero on 2/2/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    

   //Outlets
    @IBOutlet weak var movieTableView: UITableView!
    
    //data array
    var movies: [Movie] = []
    
    //DId load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movies = Movie.mockMovies
        
        movieTableView.dataSource=self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        movies.count
        
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

            // Get the track that corresponds to the table view row
            let movie = movies[indexPath.row]

            // Configure the cell with it's associated track
            cell.setCellElements(with: movie)

            // return the cell for display in the table view
            return cell
        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = movieTableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {
            
            // Use the index path to get the associated track
            let movie = movies[indexPath.row]
            
            // Set the track on the detail view controller
            detailViewController.movie = movie
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = movieTableView.indexPathForSelectedRow {
            
            // Deselect the row at the corresponding index path
            movieTableView.deselectRow(at: indexPath, animated: true)
        }
    }


    
}

