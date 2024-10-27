//
//  ViewController.swift
//  Calculator
//
//  Created by Dinmukhammed Begaly on 27.10.2024.
//

import UIKit
import SnapKit

class CalculatorView: UIView {
  
    private let buttons = [
    ["C","?","%","/"],
    ["7","8","9","*"],
    ["4","5","6","-"],
    ["1","2","3","+"],
    ["0",",","="],
    ]

    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 60)
        label.textAlignment = .right
        label.backgroundColor = .black
        label.textColor = .white

        return label
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10

        return stackView
    }()

    var buttonTupped: ((String) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(resultLabel)
        addSubview(buttonStackView)

        for row in buttons {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 10
            buttonStackView.addArrangedSubview(rowStackView)

            for symbol in row {
                let button = UIButton(type: .system)
                button.setTitle(symbol, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
                if (symbol == "+" || symbol == "-" || symbol == "*" || symbol == "/" || symbol == "=") {
                    button.backgroundColor = .orange
                } else if (symbol == "%" || symbol == "C" || symbol == "?" ) {
                    button.backgroundColor = .gray
                } else {
                    button.backgroundColor = .darkGray
                }
                button.layer.cornerRadius = 20
                button.setTitleColor(.white, for: .normal)
                button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
                rowStackView.addArrangedSubview(button)
            }
        }
    }

   private func constraints() {
        resultLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.right.left.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }

        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(70)
        }
    }
    @objc private func buttonPressed(_ sender: UIButton) {
        if let title = sender.title(for: .normal) {
            buttonTupped?(title)
        }
    }
    func getTitle(_ number: String){
        self.resultLabel.text = number
    }
}


