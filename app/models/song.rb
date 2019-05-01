class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes


   def genre_name
      self.genre ? self.genre.name : nil
   end

   def genre_name=(name)   #The setter method #genre_name= is called
     #whenever a Song is initialized with a genre_name field.
       self.genre = Genre.find_or_create_by(name: name)
   end

   def artist_name
     self.artist ? self.artist.name : nil
   end

   def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def note_contents
     notes.map(&:content)  #get contents of each object of note
   end

   def note_contents=(contents)  #when submit the form, controller will have access to a note_contents params,
     # will be an array of string. #note_contents= is called
       #whenever a Song is initialized with a note_contents field.
     contents.each do |content|
       notes << Note.create(content: content) unless content.empty?
     end
   end 

end
