- dashboard: customer_dashboard
  title: Customer Dashboard
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Count of Application over Time
    name: Count of Application over Time
    # model: brace_client_a
    explore: application
    type: looker_line
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 2
    col: 6
    width: 5
    height: 4
  - title: Total Applications
    name: Total Applications
    # model: brace_client_a
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
    row: 2
    col: 1
    width: 5
    height: 4
  - title: Count of Applications by Mode
    name: Count of Applications by Mode
    # model: brace_client_a
    explore: application
    type: looker_pie
    fields: [application.mode, application.count]
    sorts: [application.count desc]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 65
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
    defaults_version: 1
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Application Date: application.created_date
    row: 2
    col: 11
    width: 6
    height: 8
  - title: State of Application Breakdown
    name: State of Application Breakdown
    # model: brace_client_a
    explore: application
    type: looker_pie
    fields: [application.status, application.count]
    sorts: [application.status]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labPer
    inner_radius: 65
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: false
    show_value_labels: true
    font_size: 17
    hide_legend: true
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Application Date: application.created_date
    row: 2
    col: 17
    width: 6
    height: 8
  - name: ''
    type: text
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="6"><center><b>Application Overview
      </b></center></font>
      </div>
      </div>
    row: 0
    col: 1
    width: 22
    height: 2
  - title: Days to Submit Application Count
    name: Days to Submit Application Count
    # model: brace_client_a
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
    row: 14
    col: 1
    width: 10
    height: 6
  - title: Number of Borrowers
    name: Number of Borrowers
    # model: brace_client_a
    explore: application
    type: single_value
    fields: [user.count]
    limit: 500
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
    row: 6
    col: 6
    width: 5
    height: 4
  - title: Incomplete Active Application
    name: Incomplete Active Application
    # model: brace_client_a
    explore: application
    type: single_value
    fields: [borrower_to_loan_application.count_of_incomplete_application]
    filters:
      application.status: Active
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
    row: 6
    col: 1
    width: 5
    height: 4
  - title: "# of Closed Incomplete Applications"
    name: "# of Closed Incomplete Applications"
    # model: brace_client_a
    explore: application
    type: single_value
    fields: [borrower_to_loan_application.count_of_incomplete_application]
    filters:
      application.status: Completed
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
    row: 10
    col: 1
    width: 5
    height: 4
  - title: "# of Applications filled out in Together Mode"
    name: "# of Applications filled out in Together Mode"
    # model: brace_client_a
    explore: application
    type: single_value
    fields: [application.count]
    filters:
      application.mode: Together
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
    row: 10
    col: 6
    width: 5
    height: 4
  - title: Days to Submit Application (Past 7 Days)
    name: Days to Submit Application (Past 7 Days)
    # model: brace_client_a
    explore: application
    type: looker_grid
    fields: [application.created_date, application.days_to_submit_tier, application.count,
      application.is_incomplete_application]
    pivots: [application.days_to_submit_tier, application.is_incomplete_application]
    fill_fields: [application.created_date]
    filters:
      application.created_date: 7 days
      application.status: ''
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
    row: 10
    col: 11
    width: 12
    height: 10
  filters:
  - name: Application Date
    title: Application Date
    type: field_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
    # model: brace_client_a
    explore: application
    listens_to_filters: []
    field: application.created_date
