require 'rails/generators/named_base'
require 'fileutils'

class ComponentGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  class_option :format, type: :string, default: 'erb'
  class_option :block, type: :boolean, default: false

  def set_component_name_variable
    @component_name = component_name
  end

  def set_extension
    @extension = validate_extension_format(options[:format])
  end

  def create_component_files
    create_view_file
    create_sass_file
    update_base_imports_file
  end

  private

  def component_name
    file_name.gsub(/-/, '_')
  end

  def validate_extension_format(format)
    whitelist = ['erb', 'slim', 'haml']
    return whitelist.include?(format) ? format : 'erb'
  end

  def create_view_file
    created_file_name = "app/views/application/_#{component_name}.html.#{@extension}"
    template_type = options[:block] ? 'block_template' : 'inline_template'

    template "#{@extension}/#{template_type}.html.#{@extension}", created_file_name
  end

  def create_sass_file
    style_dir = options[:block] ? 'sections' : 'blocks'
    template 'component_stylesheet_template.scss', "app/assets/stylesheets/#{style_dir}/_#{component_name}.scss"
  end

  def update_base_imports_file
    FileUtils.touch('app/assets/stylesheets/base.scss')
    style_dir = options[:block] ? 'sections' : 'blocks'
    append_to_file 'app/assets/stylesheets/base.scss', "@import '#{style_dir}/#{component_name}';\n"
  end
end
