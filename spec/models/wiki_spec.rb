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

require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body") }
 
   describe "attributes" do
 # #2
     it "responds to title" do
       expect(wiki).to respond_to(:title)
     end
 # #3
     it "responds to body" do
       expect(wiki).to respond_to(:body)
     end
   end
 end
