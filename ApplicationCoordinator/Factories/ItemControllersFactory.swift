//
//  ItemControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 24/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol ItemControllersFactory {
    
    func createItemsBox() ->
        (controllerForPresent: UIViewController,
        configurator: protocol<FlowControllerInput, ItemsListFlowOutput>)
    
    func createItemDetailBox(item item: ItemList) ->
        (controllerForPresent: UIViewController,
        configurator: protocol<FlowControllerInput, ItemDetailFlowOutput>)
}