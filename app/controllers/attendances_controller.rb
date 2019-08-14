class AttendancesController < ApplicationController
	before_action :set_event
	before_action :redirect_to_root, if: :not_admin?, only: [:index]

	def index
	end

	def new
  end

  def create
	  # Amount in cents
	  @amount = @event.price * 100

	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount,
	    description: 'Rails Stripe customer',
	    currency: 'eur',
	  })

		@attendance = Attendance.new(stripe_customer_id: charge.customer, participant: current_user, event: @event)
    if @attendance.save
			flash[:success] = "Votre participation à bien été prise en compte !"
			#redirect_to gossips_path
		else
			#@tags = Tag.all
			render new_event_attendance_path(@event)
    end
 

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_event_attendance_path(@event)
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:event_id])
    end

    def not_admin?
      return @event.admin != current_user
    end

    def redirect_to_root
      redirect_to events_path
    end
end
