#!/usr/bin/ruby

require 'date'

def parse(line)
    elements = line.split(" ")

    fields = {}

    fields['time'] = parse_time(elements[6])
    fields['host'] = elements[5]
    fields['path'] = elements[19]
    fields['code'] = elements[10]
    fields['size'] = elements[11]

    return fields
end

def parse_time(time)
    stripped = time.tr('[]','')

    DateTime.strptime(stripped, '%d/%b/%Y:%H:%M:%S.%L').to_time.to_i
end

def format(elements)
    elements.values.join('|')
end

while line = gets.chomp do
    output = format(parse(line))
    puts output
    STDOUT.flush
    # $stdout.flush works too, though the difference
    # is outside the scope of this question
end