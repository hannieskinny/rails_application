class Car < ActiveRecord::Base
<<<<<<< HEAD
  def searcher
    label :tag, :from => :tags, :field => :name
  end
  
=======
  searcher do
    label :tag, :from => :tags, :field => :name
  end

>>>>>>> add-authentication-in-project
  validates :brand, :presence => true
  has_many :assets
  accepts_nested_attributes_for :assets
  has_many :comments
<<<<<<< HEAD
  mount_uploader :asset, AssetUploader
  belongs_to :user

=======
  belongs_to :user
  
>>>>>>> add-authentication-in-project
  belongs_to :state
  attr_accessor :tag_names
  has_and_belongs_to_many :tags
  before_create :associate_tags
  
 
  def tag_names
    @tag_names
  end
 
  def tag_names=(names)
    @tag_names = names
  end

  private
    def associate_tags
      if tag_names
        tag_names.split(" ").each do |name|
          self.tags << Tag.find_or_create_by_name(name)
        end 
      end
    end

end

