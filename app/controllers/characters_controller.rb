class CharactersController < ApplicationController
  def create
    @character = Character.new(name: params[:character][:name], actor_name: params[:character][:actor_name], description: params[:character][:description], show_id: params[:television_show_id])
    @show = TelevisionShow.find(params[:television_show_id])
    @character.save
    flash[:notice] = "#{@character.errors.full_messages}" if @character.errors.any?
    redirect_to @show
  end

  def index
    @characters = Character.all
  end
end
