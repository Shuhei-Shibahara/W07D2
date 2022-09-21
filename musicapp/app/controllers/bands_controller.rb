class BandsController < ApplicationController
    before_action :set_band, only: [:show, :edit, :update, :destroy]
    before_action :require_logged_in

    def index
        @bands = Band.all
        render :index
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            render :show
        else
            flash.now[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def new
        @band = Band.new
        render :new
    end

    def edit
        render :edit
    end

    def show
        render :show
    end

    def update
        # debugger
        if @band.update(band_params)
            redirect_to band_url(@band.id)
        else
            flash.now[:errors] = @band.errors.full_messages
            render :edit
        end
    end

    def destroy
        @band.destroy
        render :index
    end

    def set_band
        @band = Band.find_by(id: params[:id])
    end

    private 

    def band_params
        params.require(:band).permit(:name)
    end
end
