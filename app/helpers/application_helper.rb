module ApplicationHelper
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      content_tag("notextile", CodeRay.scan($3,$2).div(:css => :class, :tab_width => 2, :line_numbers => :table),nil,false)
    end
  end
  
  def markdown(text)
    preserve(raw(textilize(coderay(text))).gsub("<p>", "<p class='post-content'"))
  end
  
  def gravatar_url(mail)
    gravatar_id = Digest::MD5.hexdigest(mail.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end
  
  def event_link_name(event)
    event.allday ? event.name : "#{event.name} (#{event.when.strftime("%H:%M")})"
  end
  
  def with_subdomain(subdomain = nil)
    subdomain = (subdomain || "")
    subdomain += "." unless subdomain.empty?
    [subdomain, request.domain].join
  end
  
  def my_subdomain_url(subdomain = nil)
    root_url(:host => with_subdomain(subdomain))
  end
  
  #def generate_category_options(categories,pre="")
    #fucking_options = []
    #
    #categories.each do |c|
      #fucking_options << [ pre+c.title, c.id ]
      #fucking_options += generate_category_options(c.categories,pre+"= ")
    #end
    #fucking_options
  #end
  
  def tags_join(tags)
    tags.map { |t| link_to("#"+t.name,"/blog/tag/#{t.name}") }.join(", ")
  end
  
  #def shorten(txt, size)
    #txt.length > size ? txt[1..size-3]+"..." : txt
  #end
  
  def parcel_content_type_icon(type)
    link_to image_tag("/images/content-type/"+type+".png", :class => 'parcel-icon'), "/files/type/"+type
  end
  
  def parcel_size_parser(size)
    if size/1024 > 1
      if size/1048576 > 1
        "#{(size.to_f/1048576).round(3).to_s} MB"
      else
        "#{(size.to_f/1024).round(3).to_s} KB"
      end
    else
      "#{size.to_s} B"
    end
  end
end
