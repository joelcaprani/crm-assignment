class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@next_id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @id = @@next_id
    @first_name = first_name
    @last_name = last_name
    @email =email
    @note = note

    @@next_id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it

  def self.create(first_name, last_name, email, note)

    new_contact = self.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return  new_contact

  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)

    @@contacts.each do |contact|
      # puts "comparing contact id #{contact.id} and id #{id}"
      if contact.id == id
        return contact
      end
    end
    #will return nil instead of array if no match found
    puts "NO CONTACT FOUND!! \n\n"

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)

    case attribute
    when "first_name"
      self.first_name = new_value
    when "last_name"
      self.last_name = new_value
    when "email"
      self.email = new_value
    when "note"
      self.note = new_value
    end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    # puts "looking for attr #{attribute} and value #{value}"
    temp_contact = nil
    @@contacts.each do |contact|
      temp_contact = contact if attribute == "first_name" && contact.first_name == value
      temp_contact = contact if attribute == "last_name" && contact.last_name == value
      temp_contact = contact if attribute == "email" && contact.email == value
      temp_contact = contact if attribute == "note" && contact.note == value
    end
    return temp_contact
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []

  end

  def full_name
    "#{first_name}, #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
    puts "contact deleted"
  end

  def self.printContacts
    if @@contacts.count > 0
      puts "Found Contact(s) with the following attributes and values"
      @@contacts.each do |contact|
        self.printContact(contact)
      end
    else
      puts "No contacts to modify \n\n"
    end
  end

  def self.printContact(contact)
    puts "ID: \t\t #{contact.id}"
    puts "First Name: \t\t #{contact.first_name}"
    puts "Last Name: \t\t #{contact.last_name}"
    puts "Email: \t\t #{contact.email}"
    puts "Note:\t\t  #{contact.note}"
    puts "\n\n======================================\n\n"
  end

end
