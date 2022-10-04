
//  CardVoteView.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import UIKit

class TopCardVoteView: UIView {
    
    @IBOutlet var view: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        UINib(nibName: "TopCardVoteView", bundle: nil).instantiate(withOwner: self, options: nil);
        addSubview(view);
        view.frame = self.bounds;
        view.layer.masksToBounds = true;
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor;
        view.layer.borderWidth = 1;
    }
}
