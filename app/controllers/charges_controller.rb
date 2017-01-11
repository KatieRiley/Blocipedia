class ChargesController < ApplicationController
  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    current_user.stripe_ID = customer.id

    charge = Stripe::Charge.create(
      customer: current_user.stripe_ID,
      amount: 15_00,
      description: "Blocipedia Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thank you! Your account has been upgraded to the premium membership."
    current_user.role = 'premium'
    current_user.save
    redirect_to root_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      current_user.role = 'standard'
      current_user.stripe_charge_ID = charge.id
      current_user.save
      redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{Rails.configuration.stripe[:publishable_key]}",
      description: "Blocipedia Premium Membership - #{current_user.email}",
      amount: 15_00
    }
  end
end
