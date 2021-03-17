view: application {
  sql_table_name: loan.application ;;
  drill_fields: [application_id]


###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: application_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.application_id ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  dimension: application_uuid {
    hidden: yes
    type: string
    sql: ${TABLE}."application_uuid" ;;
  }

  dimension: cash_contribution_prohibited {
    hidden: yes
    type: yesno
    sql: ${TABLE}."cash_contribution_prohibited" ;;
  }

  dimension_group: created {
    label: "ETL"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."created" ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}."created_by" ;;
  }

  dimension_group: expiration {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."expiration_date" ;;
  }

  dimension: is_incomplete_application {
    type: yesno
    sql: case when ${application_audit_details.application_completed_date} is not null then true else false end ;;
  }

  dimension: is_esigned_application {
    type: yesno
    sql: case when ${application_status_detail} like 'eSigned Application' then true else false end ;;
  }

  dimension: days_since_application_creation {
    type: duration_day
    sql_start: ${application_audit_details.application_begin_raw};;
    sql_end: NOW() ;;
    # sql: DATE_PART('day', current_date - ${application_audit_details.application_begin_date});;
  }

  dimension: days_to_submit {
    group_label: "Time to Submit"
    type: duration_day
    sql_start: ${application_audit_details.application_begin_raw};;
    sql_end: ${application_audit_details.application_completed_raw} ;;
    # sql: DATE_PART('day', ${borrower_to_loan_application.form710_signature_raw} - ${application_audit_details.application_begin_date});;
  }

  dimension: minutes_to_submit {
    group_label: "Time to Submit"
    type: duration_minute
    sql_start: ${application_audit_details.application_begin_raw};;
    sql_end: ${application_audit_details.application_completed_raw} ;;
    # sql: DATE_PART('day', ${borrower_to_loan_application.form710_signature_raw} - ${application_audit_details.application_begin_date});;
  }

  dimension: days_since_submitted {
    type: duration_day
    sql_start: ${application_audit_details.application_completed_date} ;;
    sql_end: NOW() ;;
  }

  dimension: days_since_submitted_buckets {
    type: tier
    tiers: [5, 10, 30, 60, 90]
    style: integer
    sql: ${days_since_submitted} ;;
  }

  dimension: days_to_submit_tier {
    type: tier
    tiers: [0,1,3,5]
    style: integer
    sql: ${days_to_submit} ;;
  }


  dimension: delinquency_id {
    type: number
    hidden: yes
    sql: ${TABLE}."delinquency_id" ;;
  }

  dimension: expenses_id {
    type: number
    hidden: yes
    sql: ${TABLE}."expenses_id" ;;
  }

  dimension: in_recourse {
    hidden: yes
    type: yesno
    sql: ${TABLE}."in_recourse" ;;
  }

  dimension: lien_position {
    hidden: yes
    type: string
    sql: ${TABLE}."lien_position" ;;
  }

  dimension: loan_id {
    type: number
    hidden: yes
    sql: ${TABLE}."loan_id" ;;
  }

  dimension: meets_fhlmc_uw_guidelines {
    hidden: yes
    type: yesno
    sql: ${TABLE}."meets_fhlmc_uw_guidelines" ;;
  }

  dimension: mode {
    type: string
    sql:
      case
        when initcap(CAST(${TABLE}."mode" AS VARCHAR)) like 'Individual%' then 'Individual'
        when initcap(CAST(${TABLE}."mode" AS VARCHAR)) like 'Together%' then 'Together'
        else initcap(CAST(${TABLE}."mode" AS VARCHAR))
      end;;
  }

  dimension: prior_partial_claims {
    hidden: yes
    type: number
    sql: ${TABLE}."prior_partial_claims" ;;
  }

  dimension: property_condition {
    hidden: yes
    type: string
    sql: initcap(CAST(${TABLE}."property_condition" AS VARCHAR)) ;;
  }

  dimension: property_disposition_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}."property_disposition_type_id" ;;
  }

  dimension: property_has_problems {
    hidden: yes
    type: yesno
    sql: ${TABLE}."property_has_problems" ;;
  }

  dimension: property_occupancy_status_id {
    hidden: yes
    type: number
    sql: ${TABLE}."property_occupancy_status_id" ;;
  }

  dimension: property_repair_cost {
    hidden: yes
    type: number
    sql: ${TABLE}."property_repair_cost" ;;
  }

  dimension: property_usage_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}."property_usage_type_id" ;;
  }

  dimension: servicer_confirmed_down_payment_from_borrower {
    hidden: yes
    type: yesno
    sql: ${TABLE}."servicer_confirmed_down_payment_from_borrower" ;;
  }

  dimension: application_status_detail {
    type: string
    sql:
      case
        when ${state} like 'Collecting' AND ${mode} like 'Notstarted' AND ${status} like 'Pending' AND ${application_details.has_logged_in} is false then 'Not Logged In'
        when ${state} like 'Collecting' AND ${mode} like 'Notstarted' AND ${status} like 'Pending' AND ${application_details.has_logged_in} is true then 'Logged In'
        when ${state} like 'Collecting' AND ${status} like 'Active'
          and ${application_details.borrower_started_count} = 0  then 'Request for Assistance Started'
        when ${state} like 'Collecting' AND ${status} like 'Active'
          and ${application_details.borrower_started_count} > 0 then 'Request for Assistance Active'
        when ${state} not like 'Collecting' AND ${status} not like 'Pending' and ${status} not like 'Expired'
          and ${borrower_to_loan_application.form710_signature_raw} is not null then 'eSigned Application'
        when ${state} not like 'Collecting' AND ${status} LIKE '%Expired%' then 'Request for Assistance Expired'
        when ${state} not like 'Collecting' AND ${status} not like 'Pending' and ${status} not like 'Expired'
          and ${application_audit_details.application_completed_date} is not null then 'Request for Assistance Complete'
        else 'Other'
      end
      ;;
  }

  dimension: application_status_description {
    type: string
    sql:
      case
        when ${application_status_detail} like 'Not Logged In' then 'User has not reached Brace, User has not clicked "Begin Application"'
        when ${application_status_detail} like 'Logged In' then 'User has reached Brace, User has not clicked "Get Started" or "Update Hardship", User has closed browser'
        when ${application_status_detail} like 'Request for Assistance Started' then 'User has reached brace, user has clicked "Get Started" or "Update Hardship", User has not completed anything'
        when ${application_status_detail} like 'Request for Assistance Active' then 'User has reached brace, user has clicked "Get Started" or "Update Hardship", and has specified some information in the application. User has not yet submitted OR has not reached the application timeout window'
        when ${application_status_detail} like 'eSigned Application' then 'User has e-signed an application with all the required fields'
        when ${application_status_detail} like 'Request for Assistance Expired' then 'User has clicked "Get Started" or "Update Hardship", but has not finished and/or submitted an application, and X days have passed'
        when ${application_status_detail} like 'Request for Assistance Complete' then 'User has completed an request for assistance, possibly through the acceptance of a forbearance grant.'

        else 'Other'
      end
      ;;
  }
  # esigned is not defined correctly...

  dimension: state {
    label: "Servicer State"
    type: string
    sql: INITCAP(${state_raw}) ;;
    order_by_field: state_sort
  }

  dimension: state_raw {
    hidden: yes
    type: string
    sql: CAST(${TABLE}."state" AS VARCHAR) ;;
  }

  dimension: state_sort {
    hidden: yes
    case: {
      when: {
        label: "1"
        sql: ${state_raw} = 'COLLECTING' ;;
      }
      when: {
        label: "2"
        sql: ${state_raw} = 'PROCESSING' ;;
      }
      when: {
        label: "3"
        sql: ${state_raw} = 'UNDERWRITING' ;;
      }
      when: {
        label: "4"
        sql: ${state_raw} = 'OPTION_RECOMMENDED' ;;
      }
      when: {
        label: "5"
        sql: ${state_raw} = 'COMPLETED' ;;
      }
      else: "0"
    }
    alpha_sort: yes
  }

  dimension: status {
    label: "Application Status"
    type: string
    sql: initcap(CAST(${TABLE}."status" AS VARCHAR)) ;;
  }

  dimension: subject_to_indemnification {
    hidden: yes
    type: yesno
    sql: ${TABLE}."subject_to_indemnification" ;;
  }

  dimension: terms_id {
    hidden: yes
    type: number
    sql: ${TABLE}."terms_id" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."updated" ;;
  }

  dimension: updated_by {
    hidden: yes
    type: number
    sql: ${TABLE}."updated_by" ;;
  }

  dimension: workout_details_communicated {
    hidden: yes
    type: yesno
    sql: ${TABLE}."workout_details_communicated" ;;
  }

###################################################################################################
#
#   MEASURES
#
###################################################################################################

  measure: application_count {
    type: count_distinct
    sql: ${application_id} ;;
    drill_fields: [application_id, user.email, application_status_detail, borrower_to_loan_application.last_completed_step]
  }

  measure: count_incomplete_application {
    type: count_distinct
    sql: ${application_id} ;;
    filters: [is_incomplete_application: "No"]
  }

  measure: count_complete_application {
    type: count_distinct
    sql: ${application_id} ;;
    filters: [is_incomplete_application: "Yes"]
  }

  measure: count_option_recommended {
    type: count_distinct
    sql: ${application_id} ;;
    filters: [state: "Option_Recommended", workout_state.name: "PROPOSED"]
  }

  measure: days_in_funnel {
    type: sum
    sql: ${days_since_application_creation} ;;
    filters: [is_incomplete_application: "No"]
  }




###################################################################################################
#
#   SETS
#
###################################################################################################

  set: application {
    fields: [
    ]
  }
}
