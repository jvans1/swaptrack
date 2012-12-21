class Tournament < ActiveRecord::Base
  #to be depricated mass assignment of buy_in/name
  attr_accessible :title, :body, :name, :buy_in, :date
  has_many :recuests
  has_many :user_tournaments
  has_many :users, :through=> :user_tournaments
  has_many :prizes
  has_many :swaps
  has_many :pieces
  has_many :tournament_packages
  has_many :packages, :through => :tournament_packages


  def self.tournaments 
    Tournament.all.collect do |t|
      {className: t.id.to_s, title: t.name, start: t.date.to_s}.to_json
    end
  end
end
