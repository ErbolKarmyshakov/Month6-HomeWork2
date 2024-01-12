//
//  ViewController.swift
//  Month6-HomeWork2
//
//  Created by Mac User on 8/1/24.
//

import UIKit

class StudentViewController: UIViewController {
    
    private let parser = JSONParser()
    
   private var students: [Student] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: 250, height: 200)
        layout.minimumLineSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allSetUpConstraints()
        view.backgroundColor = .white
    }

    private func allSetUpConstraints() {
        setUpConstraintsForCollect()
        getStudents()
        print(students)
    }
    
    private func setUpConstraintsForCollect() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(StudentCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func getStudents() {
        parser.getStudent { [weak self] student in
            guard let self else { return }
            self.students = student
        }
    }
}

extension StudentViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return students.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StudentCollectionViewCell
        let item = students[indexPath.item]
        cell.initCellData(item)
        return cell
    }
}
    
extension StudentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}



