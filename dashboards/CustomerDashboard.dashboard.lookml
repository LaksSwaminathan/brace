- dashboard: customer_dashboard_dev
  title: Customer Dashboard (Dev)
  layout: newspaper
  preferred_viewer: dashboards
  embed_style:
    background_color: "#fcffff"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: 'Daily - # of Applications Started'
    name: 'Daily - # of Applications Started'
#     model: BraceDev
    explore: application
    type: looker_column
    fields: [application.count, application.created_date]
    filters:
      application.created_week: 4 weeks
    sorts: [application.created_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: WoW Change
    hidden_fields:
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 5
    col: 0
    width: 14
    height: 5
  - title: "# Started"
    name: "# Started"
#     model: BraceDev
    explore: application
    type: single_value
    fields: [application.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Application Date: application.created_date
    row: 5
    col: 18
    width: 4
    height: 2
  - title: Started Applications - by Mode
    name: Started Applications - by Mode
#     model: BraceDev
    explore: application
    type: looker_grid
    fields: [application.mode, application.count]
    sorts: [application.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: percentage_of_applications, label: Percentage
          of applications, expression: "${application.count}/sum(${application.count})",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: labels
    label_type: labPer
    inner_radius: 65
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    listen:
      Application Date: application.created_date
    row: 32
    col: 0
    width: 14
    height: 4
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="6"><center><b>Customer Dashboard
      </b></center></font>
      </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: "# of eSigned Applications - by Days to Submit"
    name: "# of eSigned Applications - by Days to Submit"
#     model: BraceDev
    explore: application
    type: looker_bar
    fields: [application.days_to_submit_tier, application.count]
    fill_fields: [application.days_to_submit_tier]
    sorts: [application.days_to_submit_tier]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_dropoff: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Application Date: application.created_date
    row: 18
    col: 0
    width: 14
    height: 6
  - title: "# In Progress"
    name: "# In Progress"
#     model: BraceDev
    explore: application
    type: single_value
    fields: [application.count]
    filters:
      application.application_status_detail: Application Active,Application Started
    sorts: [application.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Application Date: application.created_date
    row: 14
    col: 18
    width: 4
    height: 2
  - title: "# Expired"
    name: "# Expired"
#     model: BraceDev
    explore: application
    type: single_value
    fields: [application.count]
    filters:
      application.application_status_detail: Expired
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Application Date: application.created_date
    row: 9
    col: 18
    width: 4
    height: 2
  - title: 'Daily - # of eSigned Applications by Days to Submit'
    name: 'Daily - # of eSigned Applications by Days to Submit'
#     model: BraceDev
    explore: application
    type: looker_grid
    fields: [application.created_date, application.days_to_submit_tier, application.count,
      application.is_incomplete_application]
    pivots: [application.days_to_submit_tier, application.is_incomplete_application]
    fill_fields: [application.created_date]
    filters:
      application.created_date: 10 days
      application.days_to_submit_tier: "-Undefined"
    sorts: [application.created_date desc, application.days_to_submit_tier, application.is_incomplete_application]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      application.is_incomplete_application: Incomplete Application
      application.days_to_submit_tier: Days to Submit Application
    series_cell_visualizations:
      application.count:
        is_active: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 24
    col: 0
    width: 14
    height: 8
  - title: 'Daily - # of eSigned Applications'
    name: 'Daily - # of eSigned Applications'
#     model: BraceDev
    explore: application
    type: looker_column
    fields: [application.created_date, application.count_of_complete_application]
    filters:
      application.created_week: 4 weeks
      application.count: ''
    sorts: [application.created_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: WoW Change
    hidden_fields:
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 10
    col: 0
    width: 14
    height: 5
  - title: "# eSigned"
    name: "# eSigned"
#     model: BraceDev
    explore: application
    type: single_value
    fields: [application.count]
    filters:
      application.application_status_detail: eSigned Application
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Application Date: application.created_date
    row: 7
    col: 18
    width: 4
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="5"><center><b>Application metrics Last 30 days
      </b></center></font>
      </div>
      </div>
    row: 2
    col: 16
    width: 7
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="5"><center><b>Today's snapshot
      </b></center></font>
      </div>
      </div>
    row: 11
    col: 16
    width: 4
    height: 3
  - title: Application Snapshot by Status
    name: Application Snapshot by Status
#     model: BraceDev
    explore: application
    type: looker_grid
    fields: [application.application_status_description, application.application_status_detail,
      application.count]
    sorts: [application.application_status_detail desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", application.application_status_detail, application.application_status_description,
      application.count]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      application.application_status_description: 241
      application.application_status_detail: 93
    series_cell_visualizations:
      application.count:
        is_active: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    pinned_columns:
      application.application_status_detail: left
    listen: {}
    row: 16
    col: 16
    width: 8
    height: 10
  - title: Plaid Connections
    name: Plaid Connections
#     model: BraceDev
    explore: application
    type: single_value
    fields: [plaid_details.count]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: "# Plaid Connections"
    defaults_version: 1
    listen:
      Application Date: application.created_date
    row: 29
    col: 18
    width: 4
    height: 2
  - title: FileThis Connections
    name: FileThis Connections
#     model: BraceDev
    explore: application
    type: single_value
    fields: [borrower.count_filethis_accounts]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: "# FileThis Accounts"
    defaults_version: 1
    listen:
      Application Date: application.created_date
    row: 31
    col: 18
    width: 4
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="5"><center><b>3rd Party Services - Last 30 days
      </b></center></font>
      </div>
      </div>
    row: 26
    col: 16
    width: 7
    height: 3
  - title: Started Applications - by Hardship
    name: Started Applications - by Hardship
#     model: BraceDev
    explore: application
    type: looker_grid
    fields: [application.count, hardship_type.description]
    sorts: [application.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: percentage_of_applications, label: Percentage
          of applications, expression: "${application.count}/sum(${application.count})",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: labels
    label_type: labPer
    inner_radius: 65
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    listen:
      Application Date: application.created_date
    row: 36
    col: 0
    width: 14
    height: 8
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="5"><center><b>30 day trends
      </b></center></font>
      </div>
      </div>
    row: 2
    col: 0
    width: 4
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="5"><center><b>Application composition
      </b></center></font>
      </div>
      </div>
    row: 15
    col: 0
    width: 6
    height: 3
  filters:
  - name: Application Date
    title: Application Date
    type: field_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
#     model: BraceDev
    explore: application
    listens_to_filters: []
    field: application.created_date
