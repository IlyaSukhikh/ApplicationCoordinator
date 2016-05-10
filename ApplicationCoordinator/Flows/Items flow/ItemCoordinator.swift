//
//  ItemCoordinator.swift
//  Services
//
//  Created by Andrey Panov on 19.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

enum ItemListActions {
    case ItemSelect(ItemList), Create
}

final class ItemCoordinator: BaseCoordinator {

    let factory: ItemControllersFactory
    let coordinatorFactory: CoordinatorFactory
    var presenter: NavigationPresenter?
    
    init(presenter: NavigationPresenter,
         factory: ItemControllersFactory,
         coordinatorFactory: CoordinatorFactory) {
        
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
        self.presenter = presenter
    }
    
    override func start() {
        
        // Just example
        // In real project we would be call some AuthManager and check user valid session.
        let isUserAuth = false
        if isUserAuth {
            showItemList()
        } else {
            dispatch_async(dispatch_get_main_queue(), {
                self.runAuthCoordinator()
            })
        }
    }
    
//MARK: - Run current flow's controllers
    
    func showItemList() {
        
        let itemListController = factory.createItemsListController()
        itemListController.completionHandler = { [weak self] result in
            
            if case let ItemListActions.ItemSelect(list) = result {
                self?.showItemDetail(list)
            }
            else if case ItemListActions.Create = result {
                self?.runCreationCoordinator()
            }
        }
        presenter?.push(itemListController, animated: false)
    }
    
    func showItemDetail(item: ItemList) {
        
        let itemDetailController = factory.createItemDetailController(item: item)
        itemDetailController.completionHandler = { result in
            /* continue the flow */
        }
        presenter?.push(itemDetailController)
    }
    
//MARK: - Run coordinators (switch to another flow)
    
    func runAuthCoordinator() {
        
        let authTuple = coordinatorFactory.createAuthCoordinatorTuple()
        let authCoordinator = authTuple.authCoordinator
        authCoordinator.flowCompletionHandler = { [weak self] in
            
            self?.presenter?.dismissController()
            self?.removeDependancy(authCoordinator)
            self?.showItemList()
        }
        
        addDependancy(authCoordinator)
        presenter?.present(authTuple.presenter)
        authCoordinator.start()
    }
    
    func runCreationCoordinator() {
        
        let creationTuple = coordinatorFactory.createItemCreationCoordinatorTuple()
        let creationCoordinator = creationTuple.createCoordinator
        creationCoordinator.flowCompletionHandler = { [weak self] in
            
            self?.presenter?.dismissController()
            self?.removeDependancy(creationCoordinator)
        }
        addDependancy(creationCoordinator)
        presenter?.present(creationTuple.presenter)
        creationCoordinator.start()
    }
}