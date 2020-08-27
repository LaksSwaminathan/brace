view: user {
  sql_table_name: auth."user" ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."user_id" ;;
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
    sql: ${TABLE}."email" ;;
  }

  dimension: employer_address {
    type: string
    sql: ${TABLE}."employer_address" ;;
  }

  dimension: employer_address2 {
    type: string
    sql: ${TABLE}."employer_address2" ;;
  }

  dimension: employer_city {
    type: string
    sql: ${TABLE}."employer_city" ;;
  }

  dimension: employer_county {
    type: string
    sql: ${TABLE}."employer_county" ;;
  }

  dimension: employer_name {
    type: string
    sql: ${TABLE}."employer_name" ;;
  }

  dimension: employer_phone {
    type: string
    sql: ${TABLE}."employer_phone" ;;
  }

  dimension: employer_state {
    type: string
    sql: ${TABLE}."employer_state" ;;
  }

  dimension: employer_zip_code {
    type: string
    sql: ${TABLE}."employer_zip_code" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
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
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  dimension: full_name {
    type: string
    sql: CONCAT(${first_name}, ' ', ${last_name}) ;;
  }

  dimension: mailing_address {
    type: string
    sql: ${TABLE}."mailing_address" ;;
  }

  dimension: mailing_address2 {
    type: string
    sql: ${TABLE}."mailing_address2" ;;
  }

  dimension: mailing_city {
    type: string
    sql: ${TABLE}."mailing_city" ;;
  }

  dimension: mailing_state {
    type: string
    sql: ${TABLE}."mailing_state" ;;
  }

  dimension: mailing_zip_code {
    type: string
    sql: ${TABLE}."mailing_zip_code" ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}."middle_name" ;;
  }

  dimension: primary_identifier {
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
    type: string
    sql: ${TABLE}."searchable" ;;
  }

  dimension: secondary_phone {
    type: string
    sql: ${TABLE}."secondary_phone" ;;
  }

  dimension: secondary_phone_type {
    type: string
    sql: ${TABLE}."secondary_phone_type" ;;
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

  dimension: user_uuid {
    type: string
    sql: ${TABLE}."user_uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      user_id,
      first_name,
      middle_name,
      last_name,
      employer_name,
      login.count
    ]
  }
}
