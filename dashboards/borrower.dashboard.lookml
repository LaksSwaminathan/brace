- dashboard: borrower_new
  title: BorrowerNew
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Count of Application
    name: Count of Application
    # model: brace_bi
    explore: application
    type: single_value
    fields: [application.created_week, application.count]
    fill_fields: [application.created_week]
    filters:
      application.created_week: 2 weeks
    sorts: [application.created_week desc]
    limit: 2
    dynamic_fields: [{table_calculation: change, label: "% Change", expression: "${application.count}/offset(${application.count},1)\
          \ - 1", value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
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
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 2
    col: 6
    width: 5
    height: 4
  - title: Total Applications
    name: Total Applications
    # model: brace_bi
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
    row: 2
    col: 1
    width: 5
    height: 4
  - title: Count of Applications by Mode
    name: Count of Applications by Mode
    # model: brace_bi
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
    row: 2
    col: 11
    width: 6
    height: 8
  - title: State of Application Breakdown
    name: State of Application Breakdown
    # model: brace_bi
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
    listen: {}
    row: 2
    col: 17
    width: 6
    height: 8
  - title: FileThis Cost
    name: FileThis Cost
    # model: brace_bi
    explore: application
    type: single_value
    fields: [borrower.total_filethis_cost]
    limit: 2
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
    listen: {}
    row: 28
    col: 7
    width: 3
    height: 6
  - title: Total Connection
    name: Total Connection
    # model: brace_bi
    explore: application
    type: single_value
    fields: [plaid_details.count]
    limit: 2
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
    show_view_names: false
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen: {}
    row: 22
    col: 4
    width: 3
    height: 6
  - title: HelloSign Cost
    name: HelloSign Cost
    # model: brace_bi
    explore: application
    type: single_value
    fields: [borrower_to_loan_application.total_cost]
    limit: 2
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
    row: 34
    col: 7
    width: 3
    height: 6
  - title: Document Upload by Borrower
    name: Document Upload by Borrower
    # model: brace_bi
    explore: application
    type: looker_grid
    fields: [document.count, user.full_name, application.application_id]
    sorts: [document.count desc]
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    series_types: {}
    hidden_fields: [document.application_id]
    listen: {}
    row: 10
    col: 11
    width: 12
    height: 10
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
    # model: brace_bi
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
    listen: {}
    row: 14
    col: 1
    width: 10
    height: 6
  - title: Number of Borrowers
    name: Number of Borrowers
    # model: brace_bi
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
    row: 6
    col: 6
    width: 5
    height: 4
  - name: " (2)"
    type: text
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="6"><center><b>Vendor Overview
      </b></center></font>
      </div>
      </div>
    row: 20
    col: 1
    width: 22
    height: 2
  - title: Vendor Breakdown
    name: Vendor Breakdown
    # model: brace_bi
    explore: application
    type: looker_column
    fields: [borrower_income.count, borrower_to_loan_application.count_of_hello_sign,
      plaid_details.count, application.created_date]
    filters:
      application.created_date: 30 days
    sorts: [application.created_date desc]
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
    stacking: percent
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
    row: 40
    col: 1
    width: 22
    height: 9
  - name: " (3)"
    type: text
    body_text: "<div class=\"vis\">\n<div class=\"vis-single-value\">\n<font color=\"\
      #2aa5b1\" size=\"6\"><center><a href=\"https://brace.cloud.looker.com/dashboards/2\"\
      >Plaid</a>\n</center></font> \n</div>\n</div>"
    row: 22
    col: 1
    width: 3
    height: 6
  - title: Total Cost
    name: Total Cost
    # model: brace_bi
    explore: application
    type: single_value
    fields: [plaid_details.total_cost]
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
    listen: {}
    row: 22
    col: 7
    width: 3
    height: 6
  - title: Total Cost & Connection Breakdown
    name: Total Cost & Connection Breakdown
    # model: brace_bi
    explore: application
    type: looker_line
    fields: [plaid_details.total_cost, plaid_details.count, application.created_date]
    fill_fields: [application.created_date]
    filters:
      application.created_date: 30 days
    sorts: [plaid_details.created_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: plaid_details.total_cost,
            id: plaid_details.total_cost, name: Total Cost}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: plaid_details.count,
            id: plaid_details.count, name: Total Connections}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      plaid_details.count: column
    defaults_version: 1
    listen: {}
    row: 22
    col: 10
    width: 13
    height: 6
  - name: " (4)"
    type: text
    body_text: "<div class=\"vis\">\n<div class=\"vis-single-value\">\n<font color=\"\
      #2aa5b1\" size=\"6\"><center><a href=\"https://brace.cloud.looker.com/dashboards/2\"\
      >FileThis</a>\n</center></font> \n</div>\n</div>"
    row: 28
    col: 1
    width: 3
    height: 6
  - title: Total Connections
    name: Total Connections
    # model: brace_bi
    explore: application
    type: single_value
    fields: [borrower.count_filethis_accounts]
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
    listen: {}
    row: 28
    col: 4
    width: 3
    height: 6
  - title: Total Cost & Connection Breakdown
    name: Total Cost & Connection Breakdown (2)
    # model: brace_bi
    explore: application
    type: looker_line
    fields: [application.created_date, borrower.total_filethis_cost, borrower.count_filethis_accounts]
    fill_fields: [application.created_date]
    filters:
      application.created_date: 30 days
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: borrower.total_filethis_cost,
            id: borrower.total_filethis_cost, name: FileThis Total Cost}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: borrower.count_filethis_accounts,
            id: borrower.count_filethis_accounts, name: FileThis Account Count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    hidden_series: []
    series_types:
      plaid_details.count: column
      borrower_income.count: column
      borrower.count_filethis_accounts: column
    defaults_version: 1
    listen: {}
    row: 28
    col: 10
    width: 13
    height: 6
  - name: " (5)"
    type: text
    body_text: "<div class=\"vis\">\n<div class=\"vis-single-value\">\n<font color=\"\
      #2aa5b1\" size=\"6\"><center><a href=\"https://brace.cloud.looker.com/dashboards/2\"\
      >HelloSign</a>\n</center></font> \n</div>\n</div>"
    row: 34
    col: 1
    width: 3
    height: 6
  - title: Total Connection
    name: Total Connection (2)
    # model: brace_bi
    explore: application
    type: single_value
    fields: [borrower_to_loan_application.count_of_hello_sign]
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
    listen: {}
    row: 34
    col: 4
    width: 3
    height: 6
  - title: Total Cost & Connection Breakdown (copy)
    name: Total Cost & Connection Breakdown (copy)
    # model: brace_bi
    explore: application
    type: looker_line
    fields: [borrower_to_loan_application.total_cost, borrower_to_loan_application.count_of_hello_sign,
      application.created_date]
    fill_fields: [application.created_date]
    filters:
      application.created_date: 30 days
    sorts: [plaid_details.created_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: plaid_details.total_cost,
            id: plaid_details.total_cost, name: Total Cost}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: plaid_details.count,
            id: plaid_details.count, name: Total Connections}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: []
    series_types:
      plaid_details.count: column
      borrower_income.count: column
      borrower_to_loan_application.count_of_hello_sign: column
    defaults_version: 1
    listen: {}
    row: 34
    col: 10
    width: 13
    height: 6
  - title: Incomplete Active Application
    name: Incomplete Active Application
    # model: brace_bi
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
    row: 6
    col: 1
    width: 5
    height: 4
  - title: "# of Closed Incomplete Applications"
    name: "# of Closed Incomplete Applications"
    # model: brace_bi
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
    row: 10
    col: 1
    width: 5
    height: 4
  - title: "# of Applications filled out in Together Mode"
    name: "# of Applications filled out in Together Mode"
    # model: brace_bi
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
    row: 10
    col: 6
    width: 5
    height: 4
