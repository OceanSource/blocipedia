 Rails.configuration.stripe = {
   publishable_key: ENV['pk_test_kvprNtPw2iMFnkfITwdMPRpU'],
   secret_key: ENV['sk_test_QOXi8hH8Nil9uXABoZrosiQx']
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]