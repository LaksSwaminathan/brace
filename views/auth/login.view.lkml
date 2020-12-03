###################################################################################################
#   PURPOSE: Model the auth.login table
#
#   AUTHOR:  DATA CLYMER (www.dataclymer.com):  hello@dataclymer.com
#
#   DATE:  12/01/2020
#
#   NOTES:
#
###################################################################################################

view: login {
  sql_table_name: auth.login ;;
  drill_fields: [detail*]

###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: login_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."login_id" ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  dimension_group: tstamp {
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
    sql: ${TABLE}."tstamp" ;;
  }

  dimension: user_id {
    hidden: yes
    type: number
    sql: ${TABLE}."user_id" ;;
  }

###################################################################################################
#
#   MEASURES
#
###################################################################################################

  measure: user_count {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: most_recent_login {
    type: max
    sql: ${tstamp_raw} ;;
  }

###################################################################################################
#
#   SETS
#
###################################################################################################

  set: detail {
    fields: [
      login_id,
      user.first_name,
      user.middle_name,
      user.last_name,
      user.employer_name,
      user.user_id
    ]
  }
}
