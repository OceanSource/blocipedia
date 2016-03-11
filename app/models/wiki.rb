# == Schema Information
#
# Table name: wikis
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  private    :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wiki < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :collaborations
  has_many :collaborators, through: :collaborations, source: :user
  
  scope :visible_to, -> (user) { user ? all : where(private: false) }

  # :make_public
  ## Method causes problems when making wikis private

  default_scope { order('created_at DESC') }
  scope :private_wikis, -> (user) { where(private: true) }
  scope :public_wikis, -> (user) { where(private: false) }

  def public?
    self.private == false
  end

  def private?
   self.private == true
  end

  private

  def make_public
    self.private = false
  end

end
