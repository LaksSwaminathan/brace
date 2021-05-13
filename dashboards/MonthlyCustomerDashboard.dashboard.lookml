- dashboard: monthlycustomerdashboard
  title: Monthly CustomerDashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  embed_style:
    background_color: "#fcffff"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: 'Monthly - # of Applications Started'
    name: 'Monthly - # of Applications Started'
    # model: Flagstar
    explore: application
    type: looker_column
    fields: [application.application_count, application_audit_details.application_begin_month]
    fill_fields: [application_audit_details.application_begin_month]
    sorts: [application_audit_details.application_begin_month desc]
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
    y_axes: []
    series_types: {}
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
    listen:
      Application Date: application_audit_details.application_begin_date
    row: 2
    col: 0
    width: 14
    height: 5
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="6"><center><b>Flagstar Monthly Dashboard
      </b></center></font>
      </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: 'Monthly - # of Completed Actions by Type'
    name: 'Monthly - # of Completed Actions by Type'
    # model: Flagstar
    explore: application
    type: looker_bar
    fields: [application.count_complete_application, application.updated_month, application.application_status_detail]
    pivots: [application.application_status_detail]
    fill_fields: [application.updated_month]
    filters:
      application.application_status_detail: Request for Assistance - Streamline Flow
        Complete,Request for Assistance - Forbearance Grant,eSigned Application
    sorts: [application.updated_month desc, application.application_status_detail]
    limit: 500
    column_limit: 50
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
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
      Application Date: application_audit_details.application_begin_date
    row: 7
    col: 0
    width: 14
    height: 10
  - title: Monthly Plaid Connections (Items) of Signed Full Applications
    name: Monthly Plaid Connections (Items) of Signed Full Applications
    # model: Flagstar
    explore: application
    type: looker_column
    fields: [plaid_details.count, application.is_esigned_application, application_audit_details.application_completed_month]
    pivots: [application.is_esigned_application]
    fill_fields: [application_audit_details.application_completed_month, application.is_esigned_application]
    sorts: [plaid_details.count desc 0, application.is_esigned_application]
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
    stacking: normal
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
    row: 38
    col: 0
    width: 14
    height: 6
  - name: 3rd Party Services
    type: text
    title_text: 3rd Party Services
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="5"><center><b>3rd Party Services
      </b></center></font>
      </div>
      </div>
    row: 35
    col: 8
    width: 10
    height: 3
  - title: Monthly Status Breakdown
    name: Monthly Status Breakdown
    # model: Flagstar
    explore: application
    type: looker_grid
    fields: [application.application_status_description, application.application_status_detail,
      application_audit_details.application_begin_month, application.application_count]
    pivots: [application_audit_details.application_begin_month]
    fill_fields: [application_audit_details.application_begin_month]
    filters:
      application_audit_details.application_begin_date: after 2021/03/14
    sorts: [application_audit_details.application_begin_month, application.application_count
        desc 0]
    limit: 500
    column_limit: 50
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: []
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
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    legend_position: center
    font_size: '12'
    series_types: {}
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
    defaults_version: 1
    pinned_columns:
      application.application_status_detail: left
    hidden_fields: []
    show_null_points: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    row: 2
    col: 14
    width: 10
    height: 15
  - title: Days to Submit
    name: Days to Submit
    # model: Flagstar
    explore: application
    type: looker_grid
    fields: [application_audit_details.application_begin_month, application.application_count,
      application.days_to_submit_tier, application.is_incomplete_application]
    pivots: [application.days_to_submit_tier, application.is_incomplete_application]
    fill_fields: [application_audit_details.application_begin_month]
    filters:
      application_audit_details.application_begin_date: after 2021/03/14
    sorts: [application.days_to_submit_tier 0, application.is_incomplete_application
        0, application_audit_details.application_begin_month]
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
    row: 17
    col: 0
    width: 24
    height: 6
  - title: Application by Mode
    name: Application by Mode
    # model: Flagstar
    explore: application
    type: looker_donut_multiples
    fields: [application.mode, application.application_count, application_audit_details.application_begin_month]
    pivots: [application.mode]
    fill_fields: [application_audit_details.application_begin_month]
    filters:
      application_audit_details.application_begin_date: 3 months
      hardship.start_date: 3 months
    sorts: [application_audit_details.application_begin_month, application.mode]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: percentage_of_applications, label: Percentage
          of applications, expression: "${application.application_count}/sum(${application.application_count})",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    show_value_labels: true
    font_size: 12
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
    show_null_points: true
    interpolation: linear
    row: 23
    col: 0
    width: 24
    height: 6
  - title: Hardship Breakdown
    name: Hardship Breakdown
    # model: Flagstar
    explore: application
    type: looker_grid
    fields: [application.application_count, hardship_type.description, disaster.is_covid,
      application_audit_details.application_begin_month]
    pivots: [application_audit_details.application_begin_month]
    fill_fields: [application_audit_details.application_begin_month]
    filters:
      hardship_type.description: "-NULL"
      application_audit_details.application_begin_date: 3 months
    sorts: [application.application_count desc 0, application_audit_details.application_begin_month]
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
    row: 29
    col: 0
    width: 24
    height: 6
  - title: File This Monthly Interest
    name: File This Monthly Interest
    # model: Flagstar
    explore: application
    type: looker_grid
    fields: [borrower_to_loan_application.count_filethis_accounts, application_audit_details.application_begin_month]
    fill_fields: [application_audit_details.application_begin_month]
    filters:
      application_audit_details.application_begin_month: 3 months
    sorts: [application_audit_details.application_begin_month desc]
    limit: 500
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: "# FileThis Interest"
    defaults_version: 1
    series_types: {}
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
    row: 38
    col: 14
    width: 8
    height: 6
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
