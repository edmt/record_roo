##
# Handler for xls files

class RecordRoo::Xls

  # Returns a list of records (array of arrays)
  def self.parse filepath
    CSV.parse Roo::Excel.new(filepath).to_csv
  end
end
