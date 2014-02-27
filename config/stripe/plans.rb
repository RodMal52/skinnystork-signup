Stripe.plan :bold_moves_monthly do |plan|
  plan.name = 'The Bold Moves (billed month-to-month)'
  
  plan.amount = 11900 # $119.00
  plan.interval = 'month'
  plan.trial_period_days = 14
end

Stripe.plan :bold_moves_trimonthly do |plan|
  plan.name = 'The Bold Moves (billed every 3 months)'
 
  plan.amount = 32700 # $109.00/month
  plan.interval = 'month'
  plan.interval_count = 3
  plan.trial_period_days = 14
end

Stripe.plan :fusion_monthly do |plan|
  plan.name = 'The 360 Fusion (billed month-to-month)'
  
  plan.amount = 14900 # $149.00
  plan.interval = 'month'
  plan.trial_period_days = 14
end

Stripe.plan :fusion_trimonthly do |plan|
  plan.name = 'The 360 Fusion (billed every 3 months)'
  
  plan.amount = 41700 # $139.00/moth
  plan.interval = 'month'
  plan.interval_count = 3
  plan.trial_period_days = 14
end

Stripe.plan :fit_lifestyle_monthly do |plan|
  plan.name = 'The Fit Lifestyle (billed month-to-month)'
  
  plan.amount = 19900 # $199.00
  plan.interval = 'month'
  plan.trial_period_days = 14
end

Stripe.plan :fit_lifestyle_trimonthly do |plan|
  plan.name = 'The Fit Lifestyle (billed every 3 months)'
  
  plan.amount = 56700 # $189.00/month
  plan.interval = 'month'
  plan.interval_count = 3
  plan.trial_period_days = 14
end




# This file contains descriptions of all your stripe plans

# Example
# Stripe::Plans::PRIMO #=> 'primo'

# Stripe.plan :primo do |plan|
#
#   # plan name as it will appear on credit card statements
#   plan.name = 'Acme as a service PRIMO'
#
#   # amount in cents. This is 6.99
#   plan.amount = 699
#
#   # interval must be either 'week', 'month' or 'year'
#   plan.interval = 'month'
#
#   # only bill once every three months (default 1)
#   plan.interval_count = 3
#
#   # number of days before charging customer's card (default 0)
#   plan.trial_period_days = 30
# end

# Once you have your plans defined, you can run
#
#   rake stripe:prepare
#
# This will export any new plans to stripe.com so that you can
# begin using them in your API calls.
