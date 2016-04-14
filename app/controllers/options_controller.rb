class OptionsController < InheritedResources::Base

  private

    def option_params
      params.require(:option).permit()
    end
end

