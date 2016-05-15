//
//  ItemControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class ItemControllersFactory {
    
    func createItemsListController() -> FlowController {
        return ItemsListController.controllerFromStoryboard(.Items)
    }
    
    func createItemDetailController<T: FlowController>(item item: ItemList) -> T {
        let itemDetailController = ItemDetailController.controllerFromStoryboard(.Items)
        itemDetailController.item = item
        return itemDetailController as! T
    }
}