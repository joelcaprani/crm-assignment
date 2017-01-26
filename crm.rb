require_relative 'contact'

class CRM

  def initialize(name)
    @name = name
  end

  def self.create(name)
    a_crm_app = self.new(name)
    a_crm_app.main_menu
    return a_crm_app
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)

    end

  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '

  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end

  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

   Contact.create(first_name, last_name, email, note)

  end

  def modify_existing_contact

    if Contact.printContacts.nil?
      return
    else
      puts 'Enter an id for the contact to be modified: '
      id = gets.chomp
      # puts "sending id #{id} to find "
      this_contact = Contact.find(id.to_i)

      Contact.printContact(this_contact)
      puts "Please enter the attribute you want to modify \n"
      # if user enters First Name it will lowercase and underscore to first_name
      attribute = gets.chomp.downcase.tr(" ","_")

      puts "Please enter the value you want to assign to attribute #{attribute}"
      value = gets.chomp

      # puts "sending update #{attribute}, #{value}"
      this_contact.update(attribute, value)

      puts "Contact details updated as follows"
      Contact.printContact(this_contact)

    end
  end

  def delete_contact
    print 'Enter the ID of the contact to delete: '
    id = gets.chomp.to_i
    c = Contact.find(id)
    c.delete
  end

  def display_all_contacts
    contacts = Contact.all
    contacts.each do |value|
      puts "\ Id: #{value.id} \n First Name: #{value.first_name} \n Last Name \n #{value.last_name} \n Email: #{value.email} \n Note: #{value.note}"
    end
  end

  def search_by_attribute
    puts "search attribute by first_name, last_name, email, and note"
    attribute = gets.chomp
    puts "put in the value you are looking for"
    value = gets.chomp
    result = Contact.find_by(attribute, value)
    Contact.printContact(result)

  end


end
