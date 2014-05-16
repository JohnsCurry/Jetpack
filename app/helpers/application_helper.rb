module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  def wrap(s, width=78)
    s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1<br>").html_safe
  end

  def paginate_stuff
    if @jobsize >= @skillsize
      will_paginate @jobs
    else 
      will_paginate @skills
    end
  end

  def skill_or_banner(skill)
    if skill.banner.size != 0
      skill.title
    else
      link_to skill.title, fix_url(skill.url), :target => '_blank'
    end
  end

end
