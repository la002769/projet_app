class Publication < ActiveRecord::Base
  attr_accessible :content, :month, :notes, :pages, :pub_name, :pub_type, :summary, :title, :user_id, :year
belongs_to :user
  
  validates :user_id, presence: true
  
  validates :title, presence: true,
  									length: { maximum: 256 }
  
  validates :pub_type, presence: true
  
  validates :pub_name, presence: true,
  										 length: { maximum: 256 }
  
  @maxyear = Time.now.year
  validates :year, presence: true,
  								 numericality: { :greater_than => 1900 , :less_than_or_equal_to => @maxyear}
  								
  						
  validates :month, presence: true,
  									numericality: { :greater_than => 0 , :less_than => 13}
  
  validates :pages, presence: true,
  									numericality: { :greater_than => 0 }
    
  validates :summary, presence: true
  #validates :notes, presence: true
  
  default_scope order: 'publications.created_at DESC'
end
