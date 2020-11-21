//
//  SMSVerificationView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit

protocol SMSVerificationInput: class {
    func initView(with: String)
}

class SMSVerificationView: UIViewController {
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var otp_one: UITextField!
    @IBOutlet weak var otp_two: UITextField!
    @IBOutlet weak var otp_three: UITextField!
    @IBOutlet weak var otp_four: UITextField!
    @IBOutlet weak var otp_five: UITextField!
    @IBOutlet weak var otp_six: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var resendMsg: UILabel!
    @IBOutlet weak var resendBtn: UIButton!
    
    static let storyboardID = "sms-verification"
    
    var presenter: SMSPresenterInput!
    
    // Max seconds within we should receive a confirmation SMS
    var seconds: UInt8 = .MAX_TIME
    // timer initialisation
    var timer : Timer!
    
    var userPhone: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction func resendDidTapped(_ sender: UIButton) {
        if sender.isEnabled {
            seconds = .MAX_TIME
            triggerTimer()
            sender.isEnabled = false
            // call the auth func
        }
    }
}

// MARK: - Methods
extension SMSVerificationView {
    private func initView() {
        resendBtn.isEnabled = false
        resendBtn.setTitleColor(UIColor.colorAccent!, for: .disabled)
        triggerTimer()
    }
    
    private func triggerTimer() {
        timer = Timer()
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(self.decreaseSeconds),
            userInfo: nil, repeats: true
        )
    }
    
    private func displayTimer() {
        DispatchQueue.main.async { [unowned self] in
            self.timeLabel.text = "0:\(self.seconds)"
        }
    }
    
    @objc func decreaseSeconds() {
        if seconds != 0 {
            seconds -= 1 // decreased the seconds by 1
        } else {
            // invalidate timer to reset it
            timer.invalidate()
            seconds = 0 // reset the seconds value
            resendBtn.isEnabled = true
            timer = nil
            // Hack to just redirect the user to the location setting
            presenter.showLocation()
        }
        displayTimer()
    }
}

// MARK: - extends landing content view
extension SMSVerificationView: SMSVerificationInput {
    func initView(with phone: String) {
        phoneNumber.text = phone
        userPhone = phone
        initView()
    }
    
}
