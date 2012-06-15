class Document
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::ActsAsList
  field :title, :type => String
  field :content, :type => String

  embedded_in :user
  acts_as_list
end
