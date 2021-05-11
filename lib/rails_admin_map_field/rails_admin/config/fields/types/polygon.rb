module RailsAdmin::Config::Fields::Types
  class Polygon < RailsAdmin::Config::Fields::Base
    RailsAdmin::Config::Fields::Types::register(:polygon, self)
    

    def allowed_methods
      [@name, shape_field]
    end

    # THe name of the corresponding shape field to match the latitude field
    # in this object.
    register_instance_option(:shape_field) do
      "shape"
    end

    register_instance_option(:partial) do
      :form_polygon
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

    register_instance_option(:map_type) do
      'ROADMAP'
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
        bindings[:view].render(partial: "rails_admin/main/polygon", locals: { field: self })
      )
    end

    def sanitized_object_name(object_name)
      object_name.gsub(/]\[|[^-a-zA-Z0-9:.]/,"_").sub(/_$/,"")
    end

    def form_tag_id(object_name, field)
      "#{sanitized_object_name(object_name.to_s)}_#{field.to_s}"
    end

    def dom_name
      @dom_name ||= "#{form_tag_id(bindings[:form].object_name, @name)}_#{shape_field}"
    end

    def shape_dom_name
      form_tag_id(bindings[:form].object_name, shape_field)
    end

    def shape
      bindings[:object][shape_field]
    end

    def center     
      if bindings[:object][name]
        bindings[:object][name].centroid
      # else
      #   factory = RGeo::Geographic.spherical_factory(:srid => 4326)
      #   factory.point(default_latitude,default_longitude)
      end
    end

    def geo_json
      get_geometry.to_json
    end

    private
    def get_geometry
      @shape ||= RGeo::GeoJSON.encode(bindings[:object][name])
      @shape
    end
  end
end
