# frozen_string_literal: false

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    lines = []
    tsv.each_line { |line| lines << line.chomp }
    keys = lines[0].split("\t")
    @data = (1..lines.length - 1).map do |num|
      values = lines[num].split("\t")
      keys.zip(values).to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    string = "date	student_id	languages	best_language	app_experience	tech_experience\n"
    # column_names = hashes.first.keys
    @data.each do |hash|
      hash.each_with_index do |(_, value), idx|
        string << (idx == (hash.length - 1) ? value.to_s : value.to_s + "\t")
      end
      string << "\n"
    end
    puts "String: #{string}"
    string
  end
end
