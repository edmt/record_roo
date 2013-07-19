require 'test/unit'
require 'record_roo'

class Product
  attr_accessor :key, :name, :price, :category
  def initialize fake
  end
end

class RecordTest < Test::Unit::TestCase
  include RecordRoo

  def setup
    config_path      = File.expand_path("../data", __FILE__)
    @filepath        = "#{config_path}/products"
    @csv_datasource  = RecordRoo::DataSource.new "#{@filepath}.csv"
    @xlsx_datasource = RecordRoo::DataSource.new "#{@filepath}.xlsx"
    @xls_datasource  = RecordRoo::DataSource.new "#{@filepath}.xls"
    @model           = Product
    @attributes      = [:key, :name, :price, :category]
  end

  def test_csv_file_parsing
    collection = @csv_datasource.parse
    assert_instance_of Array, collection
    assert_instance_of Array, collection.first
  end

  def test_xlsx_file_parsing
    collection = @xlsx_datasource.parse
    assert_instance_of Array, collection
    assert_instance_of Array, collection.first
  end

  def test_xls_file_parsing
    collection = @xls_datasource.parse
    assert_instance_of Array, collection
    assert_instance_of Array, collection.first
  end

  def test_csv_model_generator
    collection = @csv_datasource.model_generator({model: @model, attributes: @attributes})
    assert !collection.empty?
    assert_instance_of @model, collection.first
  end

  def test_xlsx_model_generator
    collection = @xlsx_datasource.model_generator({model: @model, attributes: @attributes})
    assert !collection.empty?
    assert_instance_of @model, collection.first
  end

  def test_xls_model_generator
    collection = @xls_datasource.model_generator({model: @model, attributes: @attributes})
    assert !collection.empty?
    assert_instance_of @model, collection.first
  end
end
