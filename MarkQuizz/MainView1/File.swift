//
//  File.swift
//  MarkQuizz
//
//  Created by Mark Furman on 27.09.2024.
//


private func configSubview() {
            view.addSubview(mainView)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
        
    }