//
//  tagsAndProducts.swift
//  shopifyMobileApplication
//
//  Created by Kashturi V on 2018-09-16.
//  Copyright © 2018 Kashturi V. All rights reserved.
/**  Purpose of tagsAndProducts
     This class is used to parse the JSON data, and uses
     various classes to correctly receive the JSON data
     from the API.
 */


import UIKit
class Products: Codable {
    let products: [tagsAndProducts]
    
    init(products: [tagsAndProducts])
    {
        self.products = products
    }
}

class tagsAndProducts: Codable {
    let id: Int
    let title: String
    let body_html: String
    let vendor: String
    let product_type: String
    let created_at: String
    let handle: String
    let updated_at: String
    let published_at: String
    let template_suffix: String?
    let tags: String
    let published_scope: String
    let admin_graphql_api_id: String
    let variants: [variants]
    let options: [options]
    let images: [images]
    let image: images
    
    init( id: Int, title: String, body_html: String, vendor: String, product_type: String, created_at: String, handle: String, updated_at: String, published_at: String, template_suffix: String?, tags: String, published_scope: String, admin_graphql_api_id: String, variants: [variants], options: [options], images: [images], image: images)
    {
        self.id = id
        self.title = title
        self.body_html = body_html
        self.vendor = vendor
        self.product_type = product_type
        self.created_at = created_at
        self.handle = handle
        self.updated_at = updated_at
        self.published_at = published_at
        self.template_suffix = template_suffix
        self.tags = tags
        self.published_scope = published_scope
        self.admin_graphql_api_id = admin_graphql_api_id
        self.variants = variants
        self.options = options
        self.images = images
        self.image = image
    }
}

class variants: Codable {
    let id: Int
    let product_id: Int
    let title: String
    let price: String
    let sku: String?
    let position: Int
    let inventory_policy: String
    let compare_at_price: String?
    let fulfillment_service: String
    let inventory_management: String?
    let option1: String
    let option2: String?
    let option3: String?
    let created_at: String
    let updated_at: String
    let taxable: Bool
    let barcode: String?
    let grams: Int
    let image_id: String?
    let inventory_quantity: Int
    let weight: Double
    let weight_unit: String
    let inventory_item_id: Int
    let delayed_sellable_online_quantity: Int?
    let old_inventory_quantity: Int
    let requires_shipping: Bool
    let admin_graphql_api_id: String
    
    init ( id: Int, product_id: Int, title: String, price: String, sku: String?, position: Int, inventory_policy: String, compare_at_price: String?, fulfillment_service: String, inventory_management: String?, option1: String, option2: String?, option3: String?, created_at: String, updated_at: String, taxable: Bool, barcode: String?, grams: Int, image_id: String?, inventory_quantity: Int, weight: Double, weight_unit: String, inventory_item_id: Int, delayed_sellable_online_quantity: Int?, old_inventory_quantity: Int, requires_shipping: Bool, admin_graphql_api_id: String)
    {
        self.id = id
        self.product_id = product_id
        self.title = title
        self.price = price
        self.sku = sku
        self.position = position
        self.inventory_policy = inventory_policy
        self.compare_at_price = compare_at_price
        self.fulfillment_service = fulfillment_service
        self.inventory_management = inventory_management
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.created_at = created_at
        self.updated_at = updated_at
        self.taxable = taxable
        self.barcode = barcode
        self.grams = grams
        self.image_id = image_id
        self.inventory_quantity = inventory_quantity
        self.weight = weight
        self.weight_unit = weight_unit
        self.inventory_item_id = inventory_item_id
        self.delayed_sellable_online_quantity = delayed_sellable_online_quantity
        self.old_inventory_quantity = old_inventory_quantity
        self.requires_shipping = requires_shipping
        self.admin_graphql_api_id = admin_graphql_api_id
    }
}
class options: Codable{
    let id: Int
    let product_id: Int
    let name: String
    let position: Int
    let values: Array<String>
    
    init ( id: Int, product_id: Int, name: String, position: Int, values: Array<String>)
    {
        self.id = id
        self.product_id = product_id
        self.name = name
        self.position = position
        self.values = values
    }
}

class images: Codable
{
    let id: Int
    let product_id: Int
    let position: Int
    let created_at: String
    let updated_at: String
    let alt: String?
    let width: Int
    let height: Int
    let src: URL
    let variant_ids: Array<String>
    let admin_graphql_api_id: String
    
    init( id: Int, product_id: Int, position: Int, created_at: String, updated_at: String, alt: String?, width: Int, height: Int, src: URL, variant_ids: Array<String>, admin_graphql_api_id: String)
    {
        self.id = id
        self.product_id = product_id
        self.position = position
        self.created_at = created_at
        self.updated_at = updated_at
        self.alt = alt
        self.width = width
        self.height = height
        self.src = src
        self.variant_ids = variant_ids
        self.admin_graphql_api_id = admin_graphql_api_id
    }
}



