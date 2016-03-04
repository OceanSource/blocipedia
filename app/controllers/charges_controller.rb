class ChargesController < ApplicationController
  
after_action :make_premium, only: :create  
  
def new
  @stripe_btn_data = {
    key: ENV['stripe_publishable_key'],
    description: "Premium Membership - #{current_user.email}",
    amount: Amount.default
  }
end
  
def create
  # Creates a Stripe Customer object, for associating
  # with the charge
  customer = Stripe::Customer.create(
   email: current_user.email,
   card: params[:stripeToken]
)
 
  # Where the real magic happens
  charge = Stripe::Charge.create(
   customer: customer.id, # Note -- this is NOT the user_id in your app
   amount: Amount.default,
   description: "Premium subscription - #{current_user.email}",
   currency: 'usd'
  )
 
  current_user.update_attribute(:role, 'premium')

    flash[:success] = "Your payment has been receieved. Thank you!"
    redirect_to root_url

  rescue Stripe::CardError => e
    current_user.update_attribute(:role, 'standard')
    flash[:error] = e.message
    redirect_to new_charge_path
end

  class Amount
    def self.default
      15_00
    end
  end
  
def make_premium
    current_user.update_attribute(:role, 'premium')
    current_user.save!
end

def downgrade
    current_user.update_attributes(role: 'standard')
    #current_user.make_wikis_public
    redirect_to root_path
end
  
end

