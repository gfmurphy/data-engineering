require "csv"

class DataFileParser
  include Enumerable

  def initialize(filename)
    @filename = filename
  end

  def each(&b)
    CSV.foreach(@filename, col_sep: "\t", headers: true) do |row|
      yield make_row(row) if block_given?
    end
  end

  private
  def make_row(row)
    {
      purchaser: { name: row[0] },
      item: { description: row[1], price: row[2].to_d },
      item_count: row[3].to_i,
      merchant: { address: row[4], name: row[5] }
    }
  end
end
