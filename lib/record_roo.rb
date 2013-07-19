require "csv"
require "roo"

module RecordRoo
  autoload :VERSION,    'record_roo/version'

  autoload :DataSource, 'record_roo/data_source'

  autoload :Csv,        'record_roo/formats/csv'
  autoload :Xlsx,       'record_roo/formats/xlsx'
  autoload :Xls,        'record_roo/formats/xls'
end
