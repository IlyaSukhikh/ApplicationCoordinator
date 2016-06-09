//
//  ItemControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class ItemControllersFactoryImp: ItemControllersFactory {
    
    func createItemsBox() ->
        (controllerForPresent: UIViewController,
        configurator: protocol<FlowControllerInput, ItemsListFlowOutput>) {
            
            let controller = ItemsListController.controllerFromStoryboard(.Items)
            return (controller, controller)
    }
    
    func createItemDetailBox(item item: ItemList) ->
        (controllerForPresent: UIViewController,
        configurator: protocol<FlowControllerInput, ItemDetailFlowOutput>) {
            
            let controller = ItemDetailController.controllerFromStoryboard(.Items)
            controller.itemList = item
            return (controller, controller)
    }
}