class Admins::TypesController < ApplicationController
	 def index
      	@types = Type.all
        @type = Type.new
      end


      def edit
      	  @type = Type.find(params[:id])
      end

      def update
      	@type = Type.find(params[:id])

        if @type.update(type_params)

        redirect_to admins_types_path
         else
         redirect_to admins_types_path
       end
      end

      def create
      	 @type = Type.new(type_params)

         if @type.save
         	flash[:notice] = ""
         redirect_to admins_types_path
         else
          flash[:notice] = ""
         redirect_to admins_types_path
         end
      end

    def destroy
      	  @type = Type.find(params[:id])
      	  @type.destroy
          redirect_to admins_types_path
      end


    private
        def type_params
          params.require(:type).permit(:name, :status)
        end
end
