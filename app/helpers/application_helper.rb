module ApplicationHelper
  def show_user_name(current_user)
    if signed_in?
      "<li class='nav-item'>
        <div class='nav-link text-white'>
          Logged in as [ <strong  >#{link_to current_user.name, user_path(current_user)} </strong>]
        </div>
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

  def show_registration_button(event)
    if event.attendances.exists?(user_id: current_user.id)
      '<p>Already signed in</p>'.html_safe
    else
      # rubocop:disable Metrics/LineLength
      (link_to 'Join', join_attendances_path(id: @event.id), class: 'btn btn-primary mb-4', method: :post).to_s.html_safe
      # rubocop:enable Metrics/LineLength
    end
  end

  def show_create_event_button
    return unless current_user

    (link_to 'Create new event', new_event_path, class: 'nav-link text-info').to_s.html_safe
  end
end
