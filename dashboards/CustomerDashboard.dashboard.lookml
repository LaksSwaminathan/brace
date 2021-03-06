- dashboard: customer_dashboard
  title: Customer Dashboard
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
#     model: Flagstar
    explore: application
    type: looker_column
    fields: [application.application_count, application_audit_details.application_begin_date]
    fill_fields: [application_audit_details.application_begin_date]
    sorts: [application_audit_details.application_begin_date desc]
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
    hidden_fields: []
    defaults_version: 1
    series_types: {}
    y_axes: []
    listen:
      Application Date: application_audit_details.application_begin_date
    row: 5
    col: 0
    width: 14
    height: 5
  - title: "# Started"
    name: "# Started"
#     model: Flagstar
    explore: application
    type: single_value
    fields: [application.application_count]
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
    hidden_fields: []
    y_axes: []
    listen:
      Application Date: application_audit_details.application_begin_date
    row: 5
    col: 18
    width: 4
    height: 2
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="6"><center><b> Customer Dashboard
      </b></center></font>
      </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: "# In Progress"
    name: "# In Progress"
#     model: Flagstar
    explore: application
    type: single_value
    fields: [application.application_count]
    filters:
      application.application_status_detail: Request for Assistance Active,Request
        for Assistance Started
    sorts: [application.application_count desc]
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
    hidden_fields: []
    y_axes: []
    listen:
      Application Date: application_audit_details.application_begin_date
    row: 14
    col: 18
    width: 4
    height: 2
  - title: "# Expired"
    name: "# Expired"
#     model: Flagstar
    explore: application
    type: single_value
    fields: [application.application_count]
    filters:
      application.status: "%Expired%"
    sorts: [application.application_count desc]
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
    hidden_fields: []
    y_axes: []
    listen:
      Application Date: application_audit_details.application_begin_date
    row: 9
    col: 18
    width: 4
    height: 2
  - title: 'Daily - # of Completed Applications'
    name: 'Daily - # of Completed Applications'
#     model: Flagstar
    explore: application
    type: looker_column
    fields: [application_audit_details.application_completed_date, application.is_esigned_application,
      application.count_complete_application]
    pivots: [application.is_esigned_application]
    fill_fields: [application_audit_details.application_completed_date, application.is_esigned_application]
    sorts: [application_audit_details.application_completed_date desc, application.is_esigned_application]
    limit: 500
    column_limit: 50
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
    stacking: normal
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
    x_axis_label: Complete Date
    series_types: {}
    series_labels:
      No - application.count_of_complete_application: Complete - Not eSigned
      Yes - application.count_of_complete_application: Complete - eSigned
      Yes - application.count_complete_application: Esigned
      No - application.count_complete_application: Completed without eSignature
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
    listen:
      Application Date: application_audit_details.application_completed_date
    row: 10
    col: 0
    width: 14
    height: 5
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
#     model: Flagstar
    explore: application
    type: looker_grid
    fields: [application.application_status_description, application.application_status_detail,
      application.application_count]
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
    hidden_fields: []
    y_axes: []
    listen:
      Application Date: application_audit_details.application_begin_date
    row: 16
    col: 16
    width: 8
    height: 10
  - title: Plaid Connections
    name: Plaid Connections
#     model: Flagstar
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
      Application Date: application_audit_details.application_begin_date
    row: 29
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
#     model: Flagstar
    explore: application
    type: looker_grid
    fields: [application.application_count, hardship_type.description]
    filters:
      hardship_type.description: "-NULL"
    sorts: [application.application_count desc]
    limit: 500
    column_limit: 50
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
    hidden_fields: []
    y_axes: []
    listen:
      Application Date: application_audit_details.application_begin_date
    row: 36
    col: 0
    width: 14
    height: 4
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
  - title: "# of Completed Applications - by Days to Submit"
    name: "# of Completed Applications - by Days to Submit"
#     model: Flagstar
    explore: application
    type: looker_bar
    fields: [application.days_to_submit_tier, application.application_count]
    filters:
      application.days_to_submit_tier: "-Undefined"
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
    hidden_fields: []
    y_axes: []
    listen:
      Application Date: application_audit_details.application_begin_date
    row: 18
    col: 0
    width: 14
    height: 7
  - title: 'Daily # of Completed Applications - By days to submit'
    name: 'Daily # of Completed Applications - By days to submit'
#     model: Flagstar
    explore: application
    type: looker_grid
    fields: [application.days_to_submit_tier, application.application_count, application.is_incomplete_application,
      application_audit_details.application_begin_date]
    pivots: [application.days_to_submit_tier, application.is_incomplete_application]
    fill_fields: [application_audit_details.application_begin_date]
    sorts: [application.days_to_submit_tier, application.is_incomplete_application,
      application_audit_details.application_begin_date desc]
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
    hidden_fields: []
    y_axes: []
    listen:
      Application Date: application_audit_details.application_begin_date
    row: 25
    col: 0
    width: 14
    height: 8
  - title: "# Completed"
    name: "# Completed"
#     model: Flagstar
    explore: application
    type: single_value
    fields: [application.application_count]
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
    hidden_fields: []
    y_axes: []
    listen:
      Application Date: application_audit_details.application_completed_date
    row: 7
    col: 18
    width: 4
    height: 2
  - title: Started Applications - By Mode
    name: Started Applications - By Mode
#     model: Flagstar
    explore: application
    type: looker_grid
    fields: [application.mode, application.application_count]
    sorts: [application.application_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: percentage_of_applications, label: Percentage
          of applications, expression: "${application.application_count}/sum(${application.application_count})",
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
    hidden_fields: []
    y_axes: []
    listen:
      Application Date: application_audit_details.application_begin_date
    row: 33
    col: 0
    width: 14
    height: 3
  - title: "# FileThis Interest"
    name: "# FileThis Interest"
#     model: Flagstar
    explore: application
    type: single_value
    fields: [borrower_to_loan_application.count_filethis_accounts]
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
    single_value_title: "# FileThis Interest"
    defaults_version: 1
    listen: {}
    row: 31
    col: 18
    width: 4
    height: 2
  filters:
  - name: Application Date
    title: Application Date
    type: date_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
