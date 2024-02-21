class OnboardingsController < ApplicationController

  def complete
    onboarding = current_user.onboarding
    onboarding.update(passed: true)

    respond_to do |format|
      if onboarding.update(passed: true)
        format.html { redirect_to root_url }
      end
    end
  end

end
