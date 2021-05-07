module RailsAdmin::Config::Fields::Types
  class Map < RailsAdmin::Config::Fields::Base
    RailsAdmin::Config::Fields::Types::register(:map, self)

    def allowed_methods
      [@name, longitude_field, gplace_field]
    end

    # THe name of the corresponding longitude field to match the latitude field
    # in this object.
    register_instance_option(:longitude_field) do
      "longitude"
    end

    register_instance_option(:gplace_field) do
      "gplace"
    end

    register_instance_option(:address_field) do
      "address"
    end

    register_instance_option(:city_field) do
      "city"
    end

    register_instance_option(:state_field) do
      "state"
    end

    register_instance_option(:partial) do
      :form_map
    end

    register_instance_option(:map_label) do
      "Map"
    end

    register_instance_option :label do
      map_label
    end

    # Google Maps API Key - optional
    register_instance_option(:google_api_key) do
      nil
    end

    # Latitude value to display in the map if the latitude attribute is nil
    register_instance_option(:default_latitude) do
      -32.2988067
    end

    # Longitude value to display if the longitude attribute is nil
    register_instance_option(:default_longitude) do
      24.5730242
    end

    # Default zoom level of the map
    register_instance_option(:default_zoom_level) do
      8
    end

    register_instance_option(:map_type) do
      'ROADMAP'
    end


    # Map heigth in px
    register_instance_option(:map_width) do
      300
    end

    # Map width in px
    register_instance_option(:map_height) do
      200
    end

    register_instance_option(:formatted_value) do
      return value if bindings[:controller].action_name != "show"

      render(
        bindings[:view].render(partial: "rails_admin/main/map", locals: { field: self })
      )
    end

    def sanitized_object_name(object_name)
      object_name.gsub(/]\[|[^-a-zA-Z0-9:.]/,"_").sub(/_$/,"")
    end

    def form_tag_id(object_name, field)
      "#{sanitized_object_name(object_name.to_s)}_#{field.to_s}"
    end

    def dom_name
      @dom_name ||= "#{form_tag_id(bindings[:form].object_name, @name)}_#{longitude_field}"
    end

    def latitude_dom_name
      form_tag_id(bindings[:form].object_name, @name)
    end

    def longitude_dom_name
      form_tag_id(bindings[:form].object_name, longitude_field)
    end

    def gplace_dom_name
      form_tag_id(bindings[:form].object_name, gplace_field)
    end

    def address_dom_name
      form_tag_id(bindings[:form].object_name, address_field)
    end

    def city_dom_name
      form_tag_id(bindings[:form].object_name, city_field)
    end

    def state_dom_name
      form_tag_id(bindings[:form].object_name, state_field)
    end

    def latitude
      bindings[:object][name]
    end

    def longitude
      bindings[:object][longitude_field]
    end
  end
end
