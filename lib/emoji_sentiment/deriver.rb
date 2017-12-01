require 'json'

module EmojiSentiment
  class Deriver
    def self.derive
      derived_data = {}
      Data.base_data.each do |datum|
        %w(negative neutral positive).each do |position|
          datum["p_#{position}"] = (datum[position] + 1.0) / (datum['occurrences'] + 3.0)
        end

        mean = (datum['p_negative'] * -1) + (datum['p_neutral'] * 0) + (datum['p_positive'] * 1)

        [[:negative, -1], [:neutral, 0], [:positive, 1]].each do |tuple|
          position = tuple.first
          modifier = tuple.last
          datum["d_#{position}"] = datum["p_#{position}"] * ((modifier - mean)**2)
        end

        datum['score'] = mean

        sd = Math.sqrt(datum['d_negative'] + datum['d_neutral'] + datum['d_positive'])
        datum['sem'] = sd / Math.sqrt(datum['occurrences'])
        derived_data[datum['sequence']] = datum
      end

      File.open(File.expand_path(File.join(__FILE__, '..', '/data/derived-emoji-sentiment-data.json')), 'w') do |f|
        f.write derived_data.to_json
      end
    end
  end
end