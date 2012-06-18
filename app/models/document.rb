class Document
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::ActsAsList

  field :content, type: String, default: "Click to edit..."

  embedded_in :user
  acts_as_list
end
