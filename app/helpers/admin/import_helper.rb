module Admin::ImportHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this")
  end

  def link_to_add_fields(name, f, assoc)
    new_object = f.object.class.reflect_on_association(assoc).klass.new
    fields = f.fields_for(assoc, new_object, child_index: "new_#{assoc}") do |build|
      render assoc.to_s.singularize, f: build
    end
    link_to_function name, "add_fields(this, \"#{assoc}\", \"#{escape_javascript(fields)}\")"
  end
end
