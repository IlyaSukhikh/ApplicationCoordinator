//
//  NavigationPresenter.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class NavigationPresenter: Presenter {
    
    typealias ViewController = UINavigationController
    weak var rootController: ViewController?
    
    init(rootController: ViewController) {
        self.rootController = rootController
    }
    
    /*func present<T: Presenter>(presenter: T, animated: Bool = true) {
        guard let controller = presenter.rootController else { return }
        present(controller, animated: animated)
    }*/
    
    func present(coordinator: Coordinator, animated: Bool = true) {
        //guard let controller = coordinator.
    }
    
    func present<T: FlowController>(flowController: T, animated: Bool = true) {
        if let controller = flowController as? UIViewController {
            present(controller, animated: animated)
        }
    }
    
    private func present(controller: UIViewController, animated: Bool = true) {
        rootController?.presentViewController(controller, animated: animated, completion: nil)
    }
    
    func push(flowController: FlowController, animated: Bool = true) {
        if let controller = flowController as? UIViewController {
            push(controller, animated: animated)
        }
    }
    
    func push<T: Presenter>(presenter: T, animated: Bool = true)  {
        guard let controller = presenter.rootController else { return }
        push(controller, animated: animated)
    }
    
    private func push(controller: UIViewController, animated: Bool = true)  {
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popController(animated: Bool = true)  {
        rootController?.popViewControllerAnimated(animated)
    }
    
    func dismissController(animated: Bool = true) {
        rootController?.dismissViewControllerAnimated(animated, completion: nil)
    }
}