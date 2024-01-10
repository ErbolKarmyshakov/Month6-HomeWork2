//
//  StudentCollectionViewCell.swift
//  Month6-HomeWork2
//
//  Created by Mac User on 10/1/24.
//

import UIKit

class StudentCollectionViewCell: UICollectionViewCell {
    
    private let studentName: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let studentImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let studentSurName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        allSetUpConstraints()
        contentView.backgroundColor = .yellow
    }
    
    private func allSetUpConstraints() {
        setUpConstraintsForStudentImage()
        setUpConstraintsForStudentName()
        setUpConstraintsForStudentSurName()
    }
    
    func initCellData(_ item: Student) {
        studentImage.image = UIImage(systemName: item.studentImage)
        studentName.text = item.studentName
        studentSurName.text = item.studentSurName
    }
    
    private func setUpConstraintsForStudentImage() {
        contentView.addSubview(studentImage)
        NSLayoutConstraint.activate([
            studentImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            studentImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            studentImage.heightAnchor.constraint(equalToConstant: 100),
            studentImage.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setUpConstraintsForStudentName() {
        contentView.addSubview(studentName)
        NSLayoutConstraint.activate([
            studentName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            studentName.leadingAnchor.constraint(equalTo: studentImage.trailingAnchor, constant: 10),
            studentName.heightAnchor.constraint(equalToConstant: 100),
            studentName.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func setUpConstraintsForStudentSurName() {
        contentView.addSubview(studentSurName)
        NSLayoutConstraint.activate([
            studentSurName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            studentSurName.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            studentSurName.heightAnchor.constraint(equalToConstant: 100),
            studentSurName.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
