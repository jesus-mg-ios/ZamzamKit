//
//  UITableView.swift
//  ZamzamKit
//
//  Created by Basem Emara on 3/31/16.
//  Copyright © 2016 Zamzam. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {

    static var defaultCellIdentifier: String {
        return "Cell"
    }
    
    /**
     Register NIB to table view. NIB type and cell reuse identifier can match for convenience.
     
     - parameter nibName: Type of the NIB.
     - parameter cellIdentifier: Name of the reusable cell identifier.
     - parameter bundleIdentifier: Name of the bundle identifier if not local.
     */
    func register<T: UITableViewCell>(nib type: T.Type, cellIdentifier: String = defaultCellIdentifier, bundleIdentifier: String? = nil) {
        register(
            UINib(
                nibName: String(describing: type),
                bundle: bundleIdentifier != nil ? Bundle(identifier: bundleIdentifier!) : nil
            ),
            forCellReuseIdentifier: cellIdentifier
        )
    }
}

public extension UITableView {
    
    static var defaultHeaderFooterIdentifier: String {
        return "Header"
    }
    
    /**
     Register NIB to table view. NIB type and header/footer reuse identifier can match for convenience.
     
     - parameter nibName: Type of the NIB.
     - parameter headerFooterIdentifier: Name of the reusable header/footer identifier.
     - parameter bundleIdentifier: Name of the bundle identifier if not local.
     */
    func register<T: UITableViewHeaderFooterView>(nib type: T.Type, headerFooterIdentifier: String = defaultHeaderFooterIdentifier, bundleIdentifier: String? = nil) {
        register(
            UINib(
                nibName: String(describing: type),
                bundle: bundleIdentifier != nil ? Bundle(identifier: bundleIdentifier!) : nil
            ),
            forHeaderFooterViewReuseIdentifier: headerFooterIdentifier
        )
    }
}

public extension UITableView {

    /**
     Gets the reusable cell with default identifier name.

     - parameter indexPath: The index path of the cell from the table.

     - returns: Returns the table view cell.
     */
    subscript(indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: UITableView.defaultCellIdentifier, for: indexPath)
    }

    /**
     Gets the reusable cell with the specified identifier name.

     - parameter indexPath: The index path of the cell from the table.
     - parameter identifier: Name of the reusable cell identifier.

     - returns: Returns the table view cell.
     */
    subscript(indexPath: IndexPath, identifier: String) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }

}
