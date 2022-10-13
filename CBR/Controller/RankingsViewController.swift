//
//  VoteViewController.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import UIKit

extension RankingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rankingsViewModel.loadedRankings.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
//        cell.selectionStyle = .none;
        
        let loadedRank = self.rankingsViewModel.loadedRankings[indexPath.row];
        
        cell.textLabel?.text = String(loadedRank.rank + 1);
        cell.detailTextLabel?.text = loadedRank.location.name;
        
        return cell;
    }
}

extension RankingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let newDetailController = self.storyboard?.instantiateViewController(withIdentifier: "LocationDetailViewController") as? LocationDetailViewController {
            self.navigationController?.present(newDetailController, animated: true);
        }
    }
}

class RankingsViewController: UIViewController, RankingsViewDelegate {
    @IBOutlet var activityIndicator: UIActivityIndicatorView!;
    @IBOutlet var mainContent: UIView!;
    @IBOutlet var tableView: UITableView!;
    
    func onRankingsLoaded() {
        DispatchQueue.main.async {
            self.mainContent.isHidden = false;
            self.activityIndicator.isHidden = true;
            self.tableView.reloadData();
        }
    }
    
    func onRankingsLoading() {
        DispatchQueue.main.async {
            self.mainContent.isHidden = true;
            self.activityIndicator.isHidden = false;
        }
    }
    
    var rankingsViewModel: RankingsViewModel!;
    var rankingsRepository: RankingsRepository!;
    
    func loadRankings() {
        Task {
            await rankingsViewModel.loadRankings();
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRankings();
        
        rankingsRepository = APIRankingsRepositoryImpl();
        rankingsViewModel = RankingsViewModel(rankingsRepository: rankingsRepository, rankingsViewDelegate: self);
        tableView.dataSource = self;
        tableView.delegate = self;

        // Do any additional setup after loading the view.
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
