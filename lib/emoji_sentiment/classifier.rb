require 'emoji_regex'

module EmojiSentiment
  class Classifier
    def classify(emoji_string)
      parts = emoji_string.scan(EmojiRegex::Regex)
      counts = parts.inject(Hash.new(0)){|h, c| h[c] += 1; h}
      scores = parts.map do |part|
        codepoint = part.ord.to_s(16).upcase
        data = Data.for_codepoint(codepoint) || {}
        data['score']
      end.compact

      # pretty sure this is wrong
      scores.inject{ |sum, el| sum + el }.to_f / scores.size
    end
  end
end