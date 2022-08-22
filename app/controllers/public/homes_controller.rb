class Public::HomesController < ApplicationController
  
  def top
     @all_ranks = Note.find(Like.group(:note_id).order('count(note_id) desc').limit(3).pluck(:note_id))
  end
  
  def about
  end
  
end
