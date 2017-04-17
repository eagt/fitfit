module ApplicationHelper

def show_tag()
	icon('eye', class: 'show fa-2x')
end

def edit_tag()
	icon('pencil-square-o', class: 'edit fa-2x')
end

def destroy_tag() 
	icon('trash', class: 'destroy fa-2x')
end

def back_tag()
	icon('hand-o-left', class: 'back fa-2x')
end

def new_tag()
	icon('plus-square', class: 'new fa-2x')
end

end
