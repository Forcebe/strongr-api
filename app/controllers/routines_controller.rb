class RoutinesController < ApplicationController

def index
  if logged_in? && current_user
    @routines = @current_user.routines
    @workout
    if @routines
      render json: {
        routines: @routines
      }
    else
      render json: {
        errors: ["No routines found"]
      }
    end
  else
    render json: {
      errors: ["User not found"]
    }
  end
end

def show
  if logged_in? && current_user
    @routine = Routine.find params[:id]
    @workouts = @routine.workouts
    if @routine
      render json: {
        routine: @routine,
        workouts: @workouts
      }
    else
      render json: {
        errors: ["Routine not found"]
      }
    end
  else
    render json: {
      errors: ["User not found"]
    }
  end
end

# NOT WORKING: Can't add routine to current_user.routines
def create
  @routine = Routine.new (routine_params)
  if @routine.save
    @current_user.routines << @routine
    render json: {
      status: created,
      routine: @routine
    }
  else
    render json: {
      status: 500,
      errors: @routine.errors.full_messages
    }
  end
end

def destroy
  routine = Routine.find params[:id]
  routine.destroy
end

def routine_params
  params.require(:routine).permit(:name)
end

end
