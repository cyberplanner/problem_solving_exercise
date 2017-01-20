
Product.delete_all
# Product.create!(product: 'Widgets', customer: , measure: , value: , valid_from_day: , valid_to_day: )
Product.create!(product: 'Widgets', customer: 'Tesco', measure: 'Gross Sales Price', value: 1.0, valid_from_day: "2013-01-01", valid_to_day: "2013-04-01")
Product.create!(product: 'Widgets', customer: 'Tesco', measure: 'Gross Sales Price', value: 1.5, valid_from_day: "2013-03-01", valid_to_day: "2013-12-31")
Product.create!(product: 'Widgets', customer: 'Tesco', measure: 'Gross Sales Price', value: 2.0, valid_from_day: "2013-04-01", valid_to_day: "2015-01-01")
Product.create!(product: 'Widgets', customer: 'Tesco', measure: 'Distribution Cost', value: 5.0, valid_from_day: "2013-01-01", valid_to_day: "2015-04-01")
Product.create!(product: 'Widgets', customer: 'Tesco', measure: 'Distribution Cost', value: 6.0, valid_from_day: "2013-03-01", valid_to_day: "2014-04-01")
Product.create!(product: 'Widgets', customer: 'Tesco', measure: 'Distribution Cost', value: 6.0, valid_from_day: "2013-03-01", valid_to_day: "2014-04-01")
Product.create!(product: 'Widgets', customer: 'Tesco', measure: 'Distribution Cost', value: 7.0, valid_from_day: "2013-12-31", valid_to_day: "2015-01-01")
Product.create!(product: 'Widgets', customer: 'Asda', measure: 'Gross Sales Price', value: 100.0, valid_from_day: "0000-00-00", valid_to_day: "9999-99-99")
Product.create!(product: 'Widgets', customer: 'Asda', measure: 'Gross Sales Price', value: 200.0, valid_from_day: "2013-12-31", valid_to_day: "2015-01-01")
Product.create!(product: 'Widgets', customer: 'Asda', measure: 'Distribution Cost', value: 2.0, valid_from_day: "2013-03-01", valid_to_day: "2013-12-31")
Product.create!(product: 'Widgets', customer: 'Asda', measure: 'Distribution Cost', value: 3.0, valid_from_day: "2014-04-01", valid_to_day: "2015-01-01")
