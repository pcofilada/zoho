# Items

An item is the product that is offered for sale. Nature of the product could be physical or digital. Based on the type of your business, you can offer one or more goods/services. Your product can be either fixed priced or a subscription service. Each of this may fall under a separate pricing category or have add ons associated to them. For more details check https://www.zoho.com/inventory/api/v1/#Items

##### Create an item

Creates a new item in Zoho Inventory.

<!-- {.file-heading} -->

```ruby
params = { name: 'Bags-small', rate: 10, purchase_rate: 10 }

Zoho::Inventory::Item.create(params)
```
Check https://www.zoho.com/inventory/api/v1/#Items_Create_an_item for more arguments that you can pass as params.

##### Retrieve an item

Fetches the details for an existing item.

<!-- {.file-heading} -->

```ruby
item_id = '1234567890'

Zoho::Inventory::Item.find(item_id)
```

##### Update an item

Update the details of an item.

<!-- {.file-heading} -->

```ruby
item_id = '1234567890'
params = { name: 'Bags small', rate: 5 }

Zoho::Inventory::Item.update(item_id, params)
```
Check https://www.zoho.com/inventory/api/v1/#Items_Update_an_item for more arguments that you can pass as params.

##### Delete an item

Deletes an existing item from Zoho Inventory.

<!-- {.file-heading} -->

```ruby
item_id = '1234567890'

Zoho::Inventory::Item.destroy(item_id)
```

##### Mark as active

Changes the status of an item to active.

<!-- {.file-heading} -->

```ruby
item_id = '1234567890'

Zoho::Inventory::Item.active!(item_id)
```

##### Mark as inactive

Mark an item as inactive.

<!-- {.file-heading} -->

```ruby
item_id = '1234567890'

Zoho::Inventory::Item.inactive!(item_id)
```

##### List all the items

Lists all the items present in Zoho Inventory.

<!-- {.file-heading} -->

```ruby
Zoho::Inventory::Item.all
```

##### List all the items based on arguments passed

<!-- {.file-heading} -->

```ruby
Zoho::Inventory::Item.all(filter_by: 'Status.Active', sort_column: 'created_time',
                    sort_order: 'D', search_text: 'Bags', page: 1, per_page: 20)

# filter_by (`Status.All`, `Status.Active`, `Status.Inactive`)
# sort_column (`name`, `rate`, `created_time`)
# sort_order ('D', 'A')
```
