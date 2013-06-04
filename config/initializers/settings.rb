if File.exists? "config/settings.yml"
  hash = YAML.load_file("config/settings.yml")
  SETTINGS = HashWithIndifferentAccess.new(hash)
else
  SETTINGS = {}
end

#Set Round mode for all financial calculations
BigDecimal.mode(BigDecimal::ROUND_MODE, :banker)


#ROUND_UP, :up
#
#    round away from zero
#ROUND_DOWN, :down, :truncate
#
#    round towards zero (truncate)
#ROUND_HALF_UP, :half_up, :default
#
#    round towards the nearest neighbor, unless both neighbors are equidistant, in which case round away from zero. (default)
#ROUND_HALF_DOWN, :half_down
#
#    round towards the nearest neighbor, unless both neighbors are equidistant, in which case round towards zero.
#ROUND_HALF_EVEN, :half_even, :banker
#
#    round towards the nearest neighbor, unless both neighbors are equidistant, in which case round towards the even neighbor (Banker’s rounding)
#ROUND_CEILING, :ceiling, :ceil
#
#    round towards positive infinity (ceil)
#ROUND_FLOOR, :floor
#
#    round towards negative infinity (floor)
