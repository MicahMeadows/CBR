//
//  CardVoteView.swift
//  CBR
//
//  Created by Micah Meadows on 10/4/22.
//

import UIKit

class CardVoteView: UIView {
    
    @IBOutlet var view: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        UINib(nibName: "CardVoteView", bundle: nil).instantiate(withOwner: self, options: nil);
        addSubview(view);
        view.frame = self.bounds;
    }
}
