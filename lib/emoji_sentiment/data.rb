module EmojiSentiment
  module Data
    def self.for_codepoint(s)
      data[s]
    end

    def self.base_data
      @base_data ||= JSON.parse(data_file('emoji-sentiment-data.json'))
    end

    def self.data
      @data ||= JSON.parse(data_file('derived-emoji-sentiment-data.json'))
    end
    private_class_method :data

    def self.data_file(f)
      File.read(File.expand_path(File.join(__FILE__, '..', 'data', f)))
    end
    private_class_method :data_file
  end
end