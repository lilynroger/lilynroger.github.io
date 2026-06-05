# _plugins/duration_filter.rb

module DurationFilter
  UNITS = {
    'd' => { name: '天', seconds: 86400 },
    'h' => { name: '小时', seconds: 3600 },
    'm' => { name: '分钟', seconds: 60 },
    's' => { name: '秒', seconds: 1 }
  }
  
  def to_chinese_duration(duration_str)
    return duration_str if duration_str.nil? || duration_str.empty?
    
    parsed = parse_duration(duration_str)
    return duration_str if parsed.empty?
    
    chinese_parts = []
    parsed.each do |unit, value|
      # 关键修复：将数值格式化为整数（去掉 .0）
      formatted_value = format_number(value)
      chinese_parts << "#{formatted_value} #{UNITS[unit][:name]}"
    end
    
    chinese_parts.empty? ? "0 秒" : chinese_parts.join(" ")
  end
  
  def duration_to_seconds(duration_str)
    return 0 if duration_str.nil? || duration_str.empty?
    
    parsed = parse_duration(duration_str)
    return 0 if parsed.empty?
    
    total_seconds = 0.0
    parsed.each do |unit, value|
      total_seconds += value * UNITS[unit][:seconds]
    end
    
    total_seconds.to_i
  end
  
  def seconds_to_chinese_duration(seconds)
    return "0 秒" if seconds.nil? || seconds == 0
    
    seconds = seconds.to_i
    result = []
    
    UNITS.each do |unit, info|
      unit_seconds = info[:seconds]
      if seconds >= unit_seconds
        value = (seconds / unit_seconds).to_i
        result << "#{value} #{info[:name]}"
        seconds %= unit_seconds
      end
    end
    
    result.empty? ? "0 秒" : result.join
  end
  
  private
  
  def parse_duration(duration_str)
    result = {}
    remaining = duration_str.strip
    
    UNITS.keys.each do |unit|
      # 匹配整数或小数
      if remaining =~ /(\d+(?:\.\d+)?)#{unit}/
        value = $1.to_f
        result[unit] = value
        remaining = remaining.gsub(/(\d+(?:\.\d+)?)#{unit}/, '')
      end
    end
    
    result
  end
  
  # 关键辅助方法：将数值格式化为不显示 .0 的字符串
  def format_number(value)
    # 如果是整数（比如 2.0），显示 "2"
    # 如果是小数（比如 2.5），显示 "2.5"
    if value == value.to_i
      value.to_i.to_s
    else
      # 去掉末尾多余的0（比如 2.50 -> 2.5）
      value.to_s.gsub(/\.?0+$/, '')
    end
  end
end

Liquid::Template.register_filter(DurationFilter)