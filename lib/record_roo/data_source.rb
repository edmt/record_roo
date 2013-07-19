# This class wraps a spreadsheet file.
# It provides two methods: 
# * **parse** for reading the file content as an array of arrays,
# * **model_generator** for create a collection of class instances based on a given class.
class RecordRoo::DataSource
  def initialize filepath
    @filepath = filepath
  end

  # Returns an array of rows
  def parse
    @adapter = Class.instance_eval "RecordRoo::#{adapter}"
    @adapter.parse @filepath
  end

  # Given a class and an attribute list, it produces an array of class instances.
  def model_generator model_with_attributes
    parse.drop(1).map do |row|
      model = model_with_attributes[:model]
      object = Hash[model_with_attributes[:attributes].map.with_index(0) do |attr, index|
        [attr, row[index]]
      end]
      model.new(object)
    end
  end

  private
  def raw_extension
    File.extname @filepath
  end

  def adapter
    raw_extension.match(/\w+/).to_s.capitalize
  end
end
