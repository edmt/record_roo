##
# Handler for csv files

class RecordRoo::Csv

	##
  # Returns a list of records (array of arrays)
  def self.parse filepath
    CSV.read filepath
  end
end
