require "csv"
require "roo"
require "record_roo/version"

module RecordRoo
	class DataSource
	  def initialize filepath
	    @filepath = filepath
	  end

	  def parse
	    @adapter = Class.instance_eval adapter
	    @adapter.parse @filepath
	  end

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

	class Xlsx
	  def self.parse filepath
	    CSV.parse Roo::Excelx.new(filepath).to_csv
	  end
	end

	class Xls
	  def self.parse filepath
	    CSV.parse Roo::Excel.new(filepath).to_csv
	  end
	end

	class Csv
	  def self.parse filepath
	    CSV.read filepath
	  end
	end
end
