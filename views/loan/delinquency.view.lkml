view: delinquency {
  sql_table_name: loan.delinquency ;;
  drill_fields: [delinquency_id]

###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: delinquency_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."delinquency_id" ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  dimension: accrued_late_fee_penalty_amount {
    type: number
    sql: ${TABLE}."accrued_late_fee_penalty_amount" ;;
  }

  dimension_group: created {
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

  dimension_group: current_last_paid_installment {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."current_last_paid_installment_date" ;;
  }

  dimension: delinquency_uuid {
    type: string
    sql: ${TABLE}."delinquency_uuid" ;;
  }

  dimension: delinquent_interest_amount {
    type: number
    sql: ${TABLE}."delinquent_interest_amount" ;;
  }

  dimension: delinquent_interest_through_submission_date_amount {
    type: number
    sql: ${TABLE}."delinquent_interest_through_submission_date_amount" ;;
  }

  dimension: existing_balloon_amount {
    type: number
    sql: ${TABLE}."existing_balloon_amount" ;;
  }

  dimension: existing_forbearance_amount {
    type: number
    sql: ${TABLE}."existing_forbearance_amount" ;;
  }

  dimension_group: foreclosure_sale {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."foreclosure_sale_date" ;;
  }

  dimension: foreclosure_sale_date_type {
    type: string
    sql: ${TABLE}."foreclosure_sale_date_type" ;;
  }

  dimension: foreclosure_status {
    type: string
    sql: ${TABLE}."foreclosure_status" ;;
  }

  dimension: imminent_default_indicator {
    type: yesno
    sql: ${TABLE}."imminent_default_indicator" ;;
  }

  dimension: imminent_default_type {
    type: string
    sql: ${TABLE}."imminent_default_type" ;;
  }

  dimension: mortgage_insurance_partial_claim_amount {
    type: number
    sql: ${TABLE}."mortgage_insurance_partial_claim_amount" ;;
  }

  dimension: number_of_consecutive_payments_on_rolling_delinquency {
    type: number
    sql: ${TABLE}."number_of_consecutive_payments_on_rolling_delinquency" ;;
  }

  dimension: other_relocation_assistance_amount {
    type: number
    sql: ${TABLE}."other_relocation_assistance_amount" ;;
  }

  dimension: rolling_30_day_delinquencies {
    type: yesno
    sql: ${TABLE}."rolling_30_day_delinquencies" ;;
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
    type: number
    sql: ${TABLE}."updated_by" ;;
  }

###################################################################################################
#
#   MEASURES
#
###################################################################################################

  measure: count {
    type: count
    drill_fields: [delinquency_id, application.count]
  }

###################################################################################################
#
#   SETS
#
###################################################################################################

}
