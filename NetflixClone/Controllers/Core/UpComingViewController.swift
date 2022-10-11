//
//  UpComingViewController.swift
//  NetflixClone
//
//  Created by EKINCARE on 07/10/22.
//

import UIKit

class UpComingViewController: UIViewController {
    
    var titles : [Title] = [Title]()
    
    private let upComingTable : UITableView = {
          let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UpComing"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
       // navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upComingTable)
        upComingTable.delegate = self
        upComingTable.dataSource = self
        
        getUpComingMovies()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upComingTable.frame = view.bounds
    }
    
    private func getUpComingMovies(){
        
        APICaller.shared.getTrendingTvs{ results in
              
            switch results {
            case .success(let titles):
                self.titles = titles
                DispatchQueue.main.async {
                    self.upComingTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
}


extension UpComingViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        let title = titles[indexPath.row]
          cell.configure(with: TitleViewModel(titleName: (title.original_title ?? title.original_name) ?? "Unknow Title Name", posterUrl: title.poster_path ?? ""))
        
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
    
}
