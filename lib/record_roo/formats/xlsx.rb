##
# Handler for xlsx files

class RecordRoo::Xlsx
  ##
  # Returns a list of records (array of arrays)
  def self.parse filepath
    CSV.parse Roo::Excelx.new(filepath).to_csv
  end
end
