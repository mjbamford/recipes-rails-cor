class StripeController < ApplicationController
    skip_before_action :verify_authenticity_token

    def checkout
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
            price_data: {
                currency: 'usd',
                product_data: {
                name: 'T-shirt',
                },
                unit_amount: 2000,
            },
            quantity: 1,
            }],
            mode: 'payment',
            # For now leave these URLs as placeholder values.
            #
            # Later on in the guide, you'll create a real success page, but no need to
            # do it yet.
            success_url: 'https://example.com/success',
            cancel_url: 'https://example.com/cancel',
        })

        render json: { id: session.id }
    end
end
