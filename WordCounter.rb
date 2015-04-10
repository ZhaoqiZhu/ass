require "open-uri"
urls=[]
x="http://en.wikipedia.org"
homeURL="http://en.wikipedia.org/wiki/Main_Page"
homaPage=open(homeURL).read
homePageStr=homaPage.split
countable1=false
homePageStr.each do |url|
  if url.include?"</p>"
    countable1=false
  end
  if countable1
    if url.include?"href="
      url.sub! "href=", ""
      url.gsub! "\"", ""
      urls<<(x+=url)
      x="http://en.wikipedia.org"
    end
  end
  if url.include?"<p>"
    countable1=true
  end
end

urls=urls.sample(10)

h = Hash.new 0


urls.each do |url|
  str=open(url).read
  words =str.split
  countable=false

  words.each do |word|
    if word.include?"</p>"
      countable=false
    end
    if countable
      if !word.include?"=" and !word.include?"<" and !word.include?"\""and !word.include?"&"and !word.include?"%"
        word.gsub!(/[<\/\\?.*?()>,;:]/,"")
        h[word]+=1
      end
    end
    if word.include?"<p>"
      countable=true
    end
  end
end
p h.to_a.sort {|a,b| a[1]<=> b[1]}.to_h