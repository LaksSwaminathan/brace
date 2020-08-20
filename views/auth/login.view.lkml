view: login {
  sql_table_name: auth.login ;;
  drill_fields: [login_id]

  dimension: login_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."login_id" ;;
  }

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
    type: number
    # hidden: yes
    sql: ${TABLE}."user_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
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
