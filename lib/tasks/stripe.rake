namespace :stripe do
    desc 'Test stripe'
    task :test do
        Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

        puts Stripe::PaymentIntent.create({
            amount: 1000,
            currency: 'aud',
            payment_method_types: ['card'],
            receipt_email: 'jenny.rosen@example.com',
        })
    end
end