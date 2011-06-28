class Hash
  unless method_defined?(:stringify_keys)
    def stringify_keys!
      keys.each do |key|
        self[key.to_s] = delete(key)
      end
      self
    end
    
    def stringify_keys
      dup.stringify_keys!
    end
  end
end