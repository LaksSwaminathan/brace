###################################################################################################
#   PURPOSE: Modeling the auth.user table
#
#   AUTHOR:  DATA CLYMER (www.dataclymer.com):  hello@dataclymer.com
#
#   DATE:  12/03/2020
#
#   NOTES:
#
###################################################################################################


view: user {
  sql_table_name: auth."user" ;;
  drill_fields: [detail*]


###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: user_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."user_id" ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

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

  dimension_group: current_login {
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
    sql: ${TABLE}."current_login" ;;
  }

  dimension: disabled {
    type: yesno
    sql: ${TABLE}."disabled" ;;
  }

  dimension: email {
    type: string
    sql: md5(${TABLE}."email") ;;
  }

  # dimension: employer_address {
  #   group_label: "Employer"
  #   type: string
  #   sql: ${TABLE}."employer_address" ;;
  # }

  # dimension: employer_address2 {
  #   group_label: "Employer"
  #   type: string
  #   sql: ${TABLE}."employer_address2" ;;
  # }

  # dimension: employer_city {
  #   group_label: "Employer"
  #   type: string
  #   sql: ${TABLE}."employer_city" ;;
  # }

  # dimension: employer_county {
  #   group_label: "Employer"
  #   type: string
  #   sql: ${TABLE}."employer_county" ;;
  # }

  # dimension: employer_name {
  #   group_label: "Employer"
  #   type: string
  #   sql: ${TABLE}."employer_name" ;;
  # }

  # dimension: employer_phone {
  #   group_label: "Employer"
  #   type: string
  #   sql: ${TABLE}."employer_phone" ;;
  # }

  # dimension: employer_state {
  #   group_label: "Employer"
  #   type: string
  #   sql: ${TABLE}."employer_state" ;;
  # }

  # dimension: employer_zip_code {
  #   group_label: "Employer"
  #   type: string
  #   sql: ${TABLE}."employer_zip_code" ;;
  # }

  dimension: first_name {
    hidden: yes
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: is_active_user {
    description: "Users who have logged in the last 30 days"
    type: yesno
    sql: ${last_login_date} >= ${30_days_ago};;
  }

  dimension: 30_days_ago {
    hidden: yes
    type: date
    sql:  now() - 30 * interval '1 day';;
  }

  dimension_group: last_login {
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
    sql: ${TABLE}."last_login" ;;
  }

  dimension: last_name {
    hidden: yes
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension: full_name {
    type: string
    sql: md5(CONCAT(${first_name}, ' ', ${last_name})) ;;
  }

  dimension: mailing_address {
    group_label: "Address"
    type: string
    sql: ${TABLE}."mailing_address" ;;
  }

  dimension: mailing_address2 {
    group_label: "Address"
    type: string
    sql: ${TABLE}."mailing_address2" ;;
  }

  dimension: mailing_city {
    group_label: "Address"
    type: string
    sql: ${TABLE}."mailing_city" ;;
  }

  dimension: mailing_state {
    group_label: "Address"
    type: string
    sql: ${TABLE}."mailing_state" ;;
  }

  dimension: mailing_zip_code {
    group_label: "Address"
    type: string
    sql: ${TABLE}."mailing_zip_code" ;;
  }

  dimension: middle_name {
    hidden: yes
    type: string
    sql: ${TABLE}."middle_name" ;;
  }

  dimension: primary_identifier {
    hidden: yes
    type: string
    sql: ${TABLE}."primary_identifier" ;;
  }

  dimension: primary_phone {
    type: string
    sql: ${TABLE}."primary_phone" ;;
  }

  dimension: primary_phone_type {
    type: string
    sql: ${TABLE}."primary_phone_type" ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}."role" ;;
  }

  dimension: searchable {
    hidden: yes
    type: string
    sql: ${TABLE}."searchable" ;;
  }

  dimension: secondary_phone {
    hidden: yes
    type: string
    sql: ${TABLE}."secondary_phone" ;;
  }

  dimension: secondary_phone_type {
    hidden: yes
    type: string
    sql: ${TABLE}."secondary_phone_type" ;;
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

  dimension: user_uuid {
    hidden: yes
    type: string
    sql: ${TABLE}."user_uuid" ;;
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

  measure: active_user_count {
    type: count_distinct
    sql: ${user_id} ;;
    filters: [is_active_user: "Yes"]
  }

###################################################################################################
#
#   SETS
#
###################################################################################################

  set: detail {
    fields: [
      user_id,
      first_name,
      middle_name,
      last_name,
      login.count
    ]
  }
}
