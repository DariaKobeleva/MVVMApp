//
//  CourseDetailsViewController.swift
//  MVVMApp
//
//  Created by Дарья Кобелева on 30.07.2024.
//


import UIKit

final class CourseDetailsViewController: UIViewController {
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
    
    var courseDetailsViewModel: CourseDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func toggleFavorite() {
        courseDetailsViewModel.favoriteButtonPressed()
    }
    
    private func setupUI() {
        setStatusForFavoriteButton(courseDetailsViewModel.isFavorite.value)
        
        courseDetailsViewModel.isFavorite.bind {[unowned self] value in
            setStatusForFavoriteButton(value)
        }
        courseNameLabel.text = courseDetailsViewModel.courseName
        numberOfLessonsLabel.text = courseDetailsViewModel.numberOfLessons
        numberOfTestsLabel.text = courseDetailsViewModel.numberOfTests
        courseImage.image = UIImage(data: courseDetailsViewModel.imageData ?? Data())
    }
    
    private func setStatusForFavoriteButton(_ status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
