class NotesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def create
    @note = Note.new(note_params)
    @track = @note.track
    @note.user = current_user
    @note.save
    redirect_to track_url(@note.track)
  end

  def new
    @tracks = Track.all
    @track = Track.find(params[:track_id])
    @note = Note.new
    render :new
  end

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def edit
    @note = Note.find(params[:id])
    @track = @note.track
    @tracks = Track.all
    render :edit
  end

  def update
    @note = Note.find(params[:id])
    @note.user = current_user
    @note.update_attributes(note_params)
    redirect_to track_url(@note.track)
  end

  private

  def note_params
    params.require(:note).permit(:body, :name, :track_id)
  end


end
