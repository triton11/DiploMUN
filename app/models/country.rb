class Country < ActiveRecord::Base
	include BCrypt
  has_many :resolution_countries
  has_many :resolutions, :through => :resolution_countries
	validates :name, length: { minimum: 2 }
	validates :name, uniqueness: true
	validate :name_capitalized

	def name_capitalized
		unless /^[A-Z]/.match(name)
			errors.add(:name, 'name is not capitalized')
		end
	end

	def password
    	unless password_hash == nil 
        password ||= Password.new(password_hash)
      end
  	end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password = @password
  end

  def isAdmin
    return (self.name == "Admin")
  end

  def getNews
    arr = []
    mechanize = Mechanize.new

    page = mechanize.get "http://news.google.com/"
    search_form = page.forms.first
    search_form['q'] = "#{self.name}"
    page = search_form.submit
    count = 0
    page.links.each do |h3|
      if (/#{self.name}/.match(h3.text.strip) && count <= 5)
        arr << h3.text.strip
        count += 1
      end
    end

    return (arr)
  end

  def ping_a(title)
    notifier = Slack::Notifier.new("https://hooks.slack.com/services/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",
     channel: '#news', username: 'notifier')
    notifier.ping("#{self.name} was hit by a #{title}")
  end

  def ping_b
    notifier = Slack::Notifier.new("https://hooks.slack.com/services/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",
     channel: '#news', username: 'notifier')
    notifier.ping('The next round has commenced')
  end

  def ping_c
    notifier = Slack::Notifier.new("https://hooks.slack.com/services/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",
     channel: '#news', username: 'notifier')
    notifier.ping("#{self.name} has started a new resolution")
  end

  def change
    @bad = 0
    if self.f_military >= self.u_military
      self.f_military -= self.u_military
      self.u_military = 0
    else
      self.u_military -= self.f_military
      self.f_military = 0
      @bad = self.population*(10.0/3.0)
    end
    if (self.n_energy + r_energy - self.population) < 0
      @bad = self.population*(10.0/3.0)
    end
    if (self.resource - 10*self.population) < 0
      @bad = self.population*(10.0/3.0)
    end
    puts (@bad)

    self.e_metric += ((self.education - (10.0/3.0)*self.population)*(1.0/(2.0*self.population)) + (self.tech - (10.0/3.0)*self.population)*(1.0/(self.population)))
    self.r_metric += ((self.education - (10.0/3.0)*self.population)*(1.0/(2.0*self.population)) 
    + (self.infrastructure - (10.0/3.0)*self.population)*(1.0/(self.population)))
    self.f_metric += (self.infrastructure - (10.0/3.0)*self.population)*(3.0/(4.0*self.population)) 
    + (self.tech - (10.0/3.0)*self.population)*(3.0/(4.0*self.population))
    self.c_metric += (self.education - (10.0/3.0)*self.population)*(3.0/(2.0*self.population))
    puts c_metric

    self.r_energy = (self.e_metric*self.population/5.0)*(self.c_metric/10.0)
    self.n_energy = (self.e_metric*self.population/5.0)*((10.0-self.c_metric)/10.0)
    self.resource = (self.r_metric*self.population*2.0) - 0.5*@bad
    self.funds += (self.f_metric*self.population*2.0) - @bad

    self.climate = (self.r_energy-self.n_energy)*1.0/self.population*1.0
    self.economy = (self.funds*3.0/(80.0*self.population)) + (self.resource/(80.0*self.population))
    self.quality += ((self.education - (10.0/3.0)*self.population)*(1.0/(self.population)) 
    + (self.tech - (10.0/3.0)*self.population)*(1.0/(self.population))) - @bad/1000.0
    self.happiness += ((self.education - (10.0/3.0)*self.population)*(1.0/(self.population)) 
    + (self.infrastructure - (10.0/3.0)*self.population)*(1.0/(self.population))) - @bad/1000.0

    self.tech = 0
    self.education = 0
    self.infrastructure = 0

  end
end
