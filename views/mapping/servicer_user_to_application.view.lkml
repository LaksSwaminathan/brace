view: servicer_user_to_application {
  sql_table_name: mapping.servicer_user_to_application ;;
  drill_fields: [servicer_user_to_application_id]

  dimension: servicer_user_to_application_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."servicer_user_to_application_id" ;;
  }

  dimension: application_id {
    hidden: yes
    type: number
    sql: ${TABLE}."application_id" ;;
  }

  dimension: application_state_raw {
    hidden: yes
    type: string
    sql: CAST(${TABLE}."application_state" AS VARCHAR) ;;
  }

  dimension: application_state {
    hidden: yes
    type: string
    sql: INITCAP(${application_state_raw}) ;;
  }

  dimension: user_id {
    hidden: yes
    type: number
    sql: ${TABLE}."user_id" ;;
  }
}
