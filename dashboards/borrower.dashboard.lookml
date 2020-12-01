- dashboard: financial_information
  title: Financial Information
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Total Applications Created
    name: Total Applications Created
#     model: BraceDev
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
    single_value_title: Applications Created
    defaults_version: 1
    listen:
      Date: application_audit_details.application_begin_date
    row: 2
    col: 1
    width: 11
    height: 3
  - title: FileThis Cost
    name: FileThis Cost
#     model: BraceDev
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
    listen:
      Date: application_audit_details.application_begin_date
    row: 17
    col: 7
    width: 3
    height: 6
  - title: Total Connection
    name: Total Connection
#     model: BraceDev
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
    listen:
      Date: application_audit_details.application_begin_date
    row: 7
    col: 4
    width: 3
    height: 6
  - title: HelloSign Cost
    name: HelloSign Cost
#     model: BraceDev
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
    listen:
      Date: application_audit_details.application_begin_date
    row: 23
    col: 7
    width: 3
    height: 6
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
  - name: " (2)"
    type: text
    body_text: |-
      <div class="vis">
      <div class="vis-single-value">
      <font color="#2aa5b1" size="6"><center><b>Vendor Overview
      </b></center></font>
      </div>
      </div>
    row: 5
    col: 1
    width: 22
    height: 2
  - title: Vendor Breakdown
    name: Vendor Breakdown
#     model: BraceDev
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
    listen:
      Date: application_audit_details.application_begin_date
    row: 29
    col: 1
    width: 22
    height: 9
  - name: " (3)"
    type: text
    body_text: "<div class=\"vis\">\n<div class=\"vis-single-value\">\n<font color=\"\
      #2aa5b1\" size=\"6\"><center><a href=\"https://brace.cloud.looker.com/dashboards/2\"\
      >Plaid</a>\n</center></font> \n</div>\n</div>"
    row: 7
    col: 1
    width: 3
    height: 6
  - title: Total Cost
    name: Total Cost
#     model: BraceDev
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
    listen:
      Date: application_audit_details.application_begin_date
    row: 7
    col: 7
    width: 3
    height: 6
  - title: Total Cost & Connection Breakdown
    name: Total Cost & Connection Breakdown
#     model: BraceDev
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
    listen:
      Date: application_audit_details.application_begin_date
    row: 7
    col: 10
    width: 13
    height: 6
  - name: " (4)"
    type: text
    body_text: "<div class=\"vis\">\n<div class=\"vis-single-value\">\n<font color=\"\
      #2aa5b1\" size=\"6\"><center><a href=\"https://brace.cloud.looker.com/dashboards/2\"\
      >FileThis</a>\n</center></font> \n</div>\n</div>"
    row: 17
    col: 1
    width: 3
    height: 6
  - title: Total Connections
    name: Total Connections
#     model: BraceDev
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
    listen:
      Date: application_audit_details.application_begin_date
    row: 17
    col: 4
    width: 3
    height: 6
  - title: Total Cost & Connection Breakdown
    name: Total Cost & Connection Breakdown (2)
#     model: BraceDev
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
    listen:
      Date: application_audit_details.application_begin_date
    row: 17
    col: 10
    width: 13
    height: 6
  - name: " (5)"
    type: text
    body_text: "<div class=\"vis\">\n<div class=\"vis-single-value\">\n<font color=\"\
      #2aa5b1\" size=\"6\"><center><a href=\"https://brace.cloud.looker.com/dashboards/2\"\
      >HelloSign</a>\n</center></font> \n</div>\n</div>"
    row: 23
    col: 1
    width: 3
    height: 6
  - title: Total Connection
    name: Total Connection (2)
#     model: BraceDev
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
    listen:
      Date: application_audit_details.application_begin_date
    row: 23
    col: 4
    width: 3
    height: 6
  - title: Total Cost & Connection Breakdown (copy)
    name: Total Cost & Connection Breakdown (copy)
#     model: BraceDev
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
    listen:
      Date: application_audit_details.application_begin_date
    row: 23
    col: 10
    width: 13
    height: 6
  - title: Plaid Connections By Application
    name: Plaid Connections By Application
#     model: BraceDev
    explore: application
    type: looker_grid
    fields: [application.application_id, plaid_details.count, user.full_name, application.created_date]
    filters:
      plaid_details.count: ">0"
    sorts: [plaid_details.count desc]
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
    listen:
      Date: application_audit_details.application_begin_date
    row: 13
    col: 1
    width: 22
    height: 4
  - title: Applications Completed (eSigned)
    name: Applications Completed (eSigned)
#     model: BraceDev
    explore: application
    type: single_value
    fields: [application.application_count]
    filters:
      application.application_status_detail: eSigned Application
    sorts: [application.application_count desc]
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
    single_value_title: Applications Completed (eSigned)
    defaults_version: 1
    listen:
      Date: borrower_to_loan_application.form710_signature_date
    row: 2
    col: 12
    width: 11
    height: 3
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 1 quarters ago for 1 quarters
    allow_multiple_values: true
    required: false
