# Problem Solving Exercise

#### Assumptions or decisions:

1. Assumption #1:
  * The data will always be provided in a table.
  * decision: I will use a database with a table Products structured as follows:

| id    | product   | customer  | measure   | value       | valid_from_day | valid_to_day |
|-------|-----------|-----------|-----------|-------------|----------------|--------------|
|Serial |varchar    |varchar    |varchar    |decimal      |date            |date          |

2. Assumption #2:
  * I need to convert the products rows (database objects) into ruby objects to interact with them easily using an ORM (DataMapper).

3. Assumption #3:
  * My program should return a table of identical products that shares the same customers, measures and has overlapping date ranges.

4. Assumption #4:
  * I can use any language of frameworks to deliver a working solution:
  * decision: I elected to use rails as - through scaffolding - I can create a solution in a few minutes.

5. Assumption #5:
  * Due to the simplicity of the task I don't need to TDD it.

#### The process:

1- Createing a new rails 4 app:
  `rails _4.2.7_ new . ProductManager -d postgresql -T`
2- Creating a scaffold of the product with the attributes from the table:
  `rails g scaffold Product product:string customer:string measure:string value:decimal valid_from_day:date valid_to_day:date`
  (I though about changing the `product` attribute to `title` but then chose to stick to the specifications provided)
  Then migrated: `rake db:migrate`

  Now through my scaffold I have a form to add products with the attributes I need:

  ![It Works!!!](http://i64.tinypic.com/3090ocg.jpg "it Works!!!")

  And upon adding the first product it will be displayed in a table:

  ![It Works!!!](http://i64.tinypic.com/s5ztkh.jpg "it Works!!!")

  But I'll add my products by seeding the database.


3- Seeding the database with the examples provided:

```
# in /db/seed.rb

Product.delete_all
Product.create!(product: 'Widgets', customer: 'Tesco', measure: 'Gross Sales Price', value: 1.0, valid_from_day: "2013-01-01", valid_to_day: "2013-04-01")
Product.create!(product: 'Widgets', customer: 'Tesco', measure: 'Gross Sales Price', value: 1.5, valid_from_day: "2013-03-01", valid_to_day: "2013-12-31")
Product.create!(product: 'Widgets', customer: 'Tesco', measure: 'Gross Sales Price', value: 2.0, valid_from_day: "2013-04-01", valid_to_day: "2015-01-01")

....

```
Then: `rake db:seed`

And now this is how my index looks:

![It Works!!!](http://i65.tinypic.com/2jeo1so.jpg "it Works!!!")

(I noticed that product number 9 which had wierd dates (i.e 0000000 99999) was created but the valid from and to dates were added to the database as NULL)

4- Create a method to find maching products:
  * I added a method to the Product model to find a match:
  ```
  def a_match?(another_product)
    if self.product == another_product.product && self.customer == another_product.customer && self.measure == another_product.measure && (self.valid_from_day..self.valid_to_day).overlaps?(another_product.valid_from_day..another_product.valid_to_day)
      true
    else
      false
    end
  end
  ```
  * and used it in the index view:
  ```
  <% @products.each do |product| %>
      <% if product.a_match?(@product) %>
        <tr>
          <td><%= product.id %></td>
          <td><%= product.product %></td>
          <td><%= product.customer %></td>
          <td><%= product.measure %></td>
          <td><%= product.value %></td>
          <td><%= product.valid_from_day %></td>
          <td><%= product.valid_to_day %></td>
        </tr>
        <% @counter += 1%>
      <% end %>
    <% end %>
  ```

  * `@product` and `@counter` are defined i the product controller:
  ```
    def index
      @products = Product.all
      @counter = 0
      @product = Product.all[@counter]
    end
  ```

And this is how it looks now:

![It Works!!!](http://i68.tinypic.com/2dl2osp.jpg "it Works!!!")


ِAnd through editing the date of a product the overlapping dates could be removed.

#### To do:
* Add button to remove overlapping dates with one click. 


#### To run the app:

* Please clone the repo:
  `$ git clone git@github.com:cyberplanner/problem_solving_exercise.git`

* Run bundle:
  `$ bundle install`

* Run the server:
  `$ rails s`

* Visit the app's root page:
  http://localhost:3000/


-------
##### Thanks for reviewing my code, feedback is welcomed and appreciated.
