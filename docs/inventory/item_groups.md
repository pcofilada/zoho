# Item Groups

Item Group are the products that you sell or services that you render to various clients and can be purchased from various vendors in a business. Create and manage the item groups your business deals with and also create price lists for specific item and clients. For more details check https://www.zoho.com/inventory/api/v1/#Item_Groups

##### Create an Item Group

A new Item Group can a be created.

<!-- {.file-heading} -->

```ruby
params = { group_name: 'Bags', unit: 'qty' }

Zoho::Inventory::ItemGroup.create(params)
```
Check https://www.zoho.com/inventory/api/v1/#Item_Groups_Create_an_Item_Group for more arguments that you can pass as params.

##### Retrieve an Item Group

Fetches the details for an existing Item Group.

<!-- {.file-heading} -->

```ruby
itemgroup_id = '1234567890'

Zoho::Inventory::ItemGroup.find(itemgroup_id)
```

##### Update an Item Group

Updates the details of an existing Item Group.

<!-- {.file-heading} -->

```ruby
itemgroup_id = '1234567890'
params = { group_name: 'Bags', unit: 'qty' }

Zoho::Inventory::ItemGroup.update(itemgroup_id, params)
```
Check https://www.zoho.com/inventory/api/v1/#Item_Groups_Update_an_Item_Group for more arguments that you can pass as params.

##### Delete an Item Group

Deletes an existing Item Group from Zoho Inventory.

<!-- {.file-heading} -->

```ruby
itemgroup_id = '1234567890'

Zoho::Inventory::ItemGroup.destroy(itemgroup_id)
```

##### Mark as active

Marks an Item group as Active.

<!-- {.file-heading} -->

```ruby
itemgroup_id = '1234567890'

Zoho::Inventory::ItemGroup.active!(itemgroup_id)
```

##### Mark as inactive

Marks as Item Group as Inactive.

<!-- {.file-heading} -->

```ruby
itemgroup_id = '1234567890'

Zoho::Inventory::ItemGroup.inactive!(itemgroup_id)
```

##### List all Item Groups

Lists all the Item Groups that are present in the Zoho Inventory organization.

<!-- {.file-heading} -->

```ruby
Zoho::Inventory::ItemGroup.all
```

##### List all the items based on arguments passed

<!-- {.file-heading} -->

```ruby
Zoho::Inventory::ItemGroup.all(filter_by: 'Status.Active', sort_column: 'created_time',
                               sort_order: 'D', search_text: 'Bags', page: 1, per_page: 20)

# filter_by (`Status.All`, `Status.Active`, `Status.Inactive`)
# sort_column (`name`, `rate`, `created_time`)
# sort_order ('D', 'A')
```
