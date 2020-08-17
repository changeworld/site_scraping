# -*- coding: utf-8 -*-

require 'nokogiri'
require 'open-uri'

url = ARGV[0]

doc = Nokogiri::HTML(URI.open(url))
doc.css("div.totaldiv").each do |element|
  # refinfo
  element.css('div.refinfo').each do |element|
    puts element.content.strip
  end
  # refinfo2
  element.css('div.refinfo2').each do |element|
    # subject
    idx_1st = element.to_html.strip.index('数学')
    idx_2nd = element.to_html.strip.index('</')
    puts element.to_html.strip[idx_1st, idx_2nd - idx_1st]
    # score
    idx_1st = element.content.strip.index('配点')
    idx_2nd = element.content.strip.index('点', idx_1st+2)
    puts element.content.strip[idx_1st+2, idx_2nd - (idx_1st+2)]
  end
  # qbody
  element.css('div.qbody').each do |element|
    # qnum
    element.css('.qnum').each do |element|
      puts element.content
    end
    # shomon1
    element.css('.shomon1').each_with_index do |element, idx|
      puts element.content
    end
  end
end
