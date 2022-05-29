lut = {
  0 => '電圧降下検出中',
  1 => 'ARM frequency capped',
  2 => 'currently throttled',
  3 => 'sfotware temperature limit active',
  16 => '電圧降下履歴あり',
  17 => 'ARM frequency capping has occurred',
  18 => 'throttling has occurred',
  19 => 'soft temperature limit has occurred'
}
status = `vcgencmd get_throttled`.split('0x')[-1].to_i(16)

msg = []
lut.each {|k, v|
  msg.push(v) unless status & (1 << k) == 0
}
print "#{Time.now}: #{msg.join(',')}\n"

