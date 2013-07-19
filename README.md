# RecordRoo

Easy object mapping from spreadsheets.

It provides a way to obtain an object that wraps a row within a spreadsheet.

## Installation

Add this line to your application's Gemfile:

    gem 'record_roo'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install record_roo

## Usage

All you need is to know the location of your spreadsheet file:

    > filepath = "myfile.xlsx"

Then, after you have included the RecordRoo module:

    > ds = DataSource.new filepath

…or like this, if you haven't:

    > ds = RecordRoo::DataSource.new filepath

You can just obtain an array of records by sending the :parse message.

    > ds.parse
    => [["Key", "Name", "Price", "Category"], ["678678676", "PS4", "8000", "consoles"], ["234234234", "Coffee", "30", "snacks"]]    

Or, for better, obtain a collection of instances from one of your classes.

    > ds.model_generator({model: Product,
        attributes: [:key, :name, :price, :category]})
    => [#<Product:0x007fc31a085ef0>, #<Product:0x007fc31a085c98>]

Keep in mind that for the desired result, you must specify the correct order of the attributes, based on your spreadsheet.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Thank you! ಠ_ಠ
