view: loan {
  sql_table_name: loan.loan ;;
  drill_fields: [loan_id]

###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: loan_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."loan_id" ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  dimension: brand_identifier {
    type: string
    sql: ${TABLE}."brand_identifier" ;;
  }

  dimension_group: created {
    hidden: yes
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
    hidden: yes
    type: number
    sql: ${TABLE}."created_by" ;;
  }

  dimension: is_escrow_prohibited {
    hidden: yes
    type: yesno
    sql: ${TABLE}."is_escrow_prohibited" ;;
  }

  dimension: loan_uuid {
    hidden: yes
    type: string
    sql: ${TABLE}."loan_uuid" ;;
  }

  dimension_group: mbs_pool_issue {
    hidden: yes
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
    sql: ${TABLE}."mbs_pool_issue_date" ;;
  }

  dimension: property_id {
    hidden: yes
    type: number
    sql: ${TABLE}."property_id" ;;
  }

  dimension: searchable {
    hidden: yes
    type: string
    sql: ${TABLE}."searchable" ;;
  }

  dimension: servicer_id {
    hidden: yes
    type: number
    sql: ${TABLE}."servicer_id" ;;
  }

  dimension: servicer_verified_first_lienholder {
    hidden: yes
    type: yesno
    sql: ${TABLE}."servicer_verified_first_lienholder" ;;
  }

  dimension: sor_identifier {
    # hidden: yes
    type: string
    sql: ${TABLE}."sor_identifier" ;;
  }

  dimension_group: transferred {
    hidden: yes
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
    sql: ${TABLE}."transferred" ;;
  }

  dimension: transferred_from {
    type: number
    sql: ${TABLE}."transferred_from" ;;
  }

  dimension_group: updated {
    hidden: yes
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

###################################################################################################
#
#   MEASURES
#
###################################################################################################

  measure: count {
    type: count
    drill_fields: [loan_id, application.count]
  }

###################################################################################################
#
#   SETS
#
###################################################################################################

}
