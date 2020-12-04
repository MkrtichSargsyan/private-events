module ApplicationHelper
  def show_user_name(current_user)
    if signed_in?
      "<li class='nav-item'>
        <div class='nav-link text-white'>Logged in as [ <strong  >#{current_user.email} </strong>] </div>
      </li>
      <li class='nav-item'>
         #{link_to 'logout', destroy_user_session_path, class: 'nav-link text-white', method: :delete}
      </li>".html_safe
    else
      "<li class='nav-item'>
        #{link_to 'Log in / Sign up', new_user_registration_path, class: 'nav-link text-white'}
      </li>".html_safe
    end
  end

  def show_creator(event)
    if signed_in?
      "<h5 class='text-secondary'>Created by #{event.creator.name}</h5>".html_safe
    else
      "<h5 class='text-secondary'>Created by Anonymous</h5>".html_safe
    end
  end

  def show_attendees(attendees)
    result = '<p>No attendees yet</p>'
    unless attendees.count.zero?
      result = ''
      attendees.each do |attendee|
        result += "<div style='background-color: beige' class='rounded p-1 mb-1'>#{attendee.name}</div>"
      end
    end
    result.html_safe
  end
end
