require 'test_helper'

class SqlTemplateTest < ActiveSupport::TestCase
  test 'resolver returns a template with the saved body' do
    resolver = SqlTemplate::Resolver.new
    details = { formats: [:html], locale: [:en], handlers: [:erb]}

    # 1) assert our resolver cannot find any templates as db is empty
    assert resolver.find_all('index', 'posts', false, details).empty?

    # create template in db
    SqlTemplate.create!(
      body: "<%= Hi, from Templater! %>",
      path: 'posts/index',
      format: 'html',
      locale: 'en',
      handler: 'erb',
      partial: false)

    # assert template can now be found
    template = resolver.find_all('index', 'posts', false, details).first
    assert_kind_of ActionView::Template, template

    assert_equal "<%= Hi, from Templater! %>", template.source
    assert_kind_of ActionView::Template::Handlers::ERB, template.handler
    assert_equal [:html], template.formats
    assert_equal 'posts/index', template.virtual_path
    assert_match %r[SqlTemplate - \d+ - "posts/index"], template.identifier
  end
end
